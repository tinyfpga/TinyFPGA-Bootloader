`timescale 1ps / 1ps

`ifdef continue_on_fail
 `define finish_and_return(code) #0
`else
 `ifdef __ICARUS__
  `define finish_and_return(code) $finish_and_return(code)
 `else
  `define finish_and_return(code) $finish
 `endif
`endif

`define assert(msg, signal, value) \
        if ((signal) !== value) begin \
            $display("%d ERROR (%m): %s. signal != value", $time, msg); \
            $display("    actual:   %x", signal); \
            $display("    expected: %x", value); \
        end

`define assert_true(msg, signal) \
        if (!(signal)) begin \
            $display("%d ERROR (%m): %s. (signal) == FALSE", $time, msg); \
        end

module top_tb;
    /* By instantiating vlog_tb_utils we get access to some
     extra functionality that can be activated by plusargs at
     runtime.
     fusesoc run --target=simple_spi_in_test TinyFPGA-Bootloader --help
     will list all available options. Refer to this for details
     */
    vlog_tb_utils vtu();

   /* Set a default name for the tap file.
    Doesn't necessarily have to be unique as each target
    executes in a separate work directory
    Filename specified here can be overridden with the
    vtg.set_file("filename") function at compile-time
    or with a plusarg at run time by adding --tapfile=filename
    to the FuseSoC command line
    */
   vlog_tap_generator #("test.tap") vtg();

    reg clk_48mhz;
    reg reset = 0;

    initial begin
      #1 clk_48mhz <= 0;
      forever begin
        #10416 clk_48mhz <= !clk_48mhz;
      end
    end

    // usb interface
    wire usb_p_tx_raw;
    wire usb_n_tx_raw;
    reg usb_p_rx = 1'b1;
    reg usb_n_rx = 1'b0;
    wire usb_tx_en;

    
    wire usb_p_tx = usb_tx_en ? usb_p_tx_raw : 1'b1;
    wire usb_n_tx = usb_tx_en ? usb_n_tx_raw : 1'b0;

    // user interface
    wire led;

    // spi interface
    wire spi_cs;
    wire spi_sck;
    wire spi_mosi;
    wire spi_miso;

    // boot interface
    wire boot;

    tinyfpga_bootloader dut (
      .clk_48mhz(clk_48mhz),
      .reset(reset),

      .usb_p_tx(usb_p_tx_raw),
      .usb_n_tx(usb_n_tx_raw),

      .usb_p_rx(usb_p_rx),
      .usb_n_rx(usb_n_rx),

      .usb_tx_en(usb_tx_en),

      .led(led),

      .spi_cs(spi_cs),
      .spi_sck(spi_sck),
      .spi_mosi(spi_mosi),
      .spi_miso(spi_miso),

      .boot(boot)
    );


    
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    ////
    //// SPI Slave Modeling
    ////
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    reg [1024 * 8:0] mosi_data = 8097'h0;
    reg [1024 * 8:0] miso_data = 8097'h0;
    reg [31:0] spi_mosi_length = 32'h0;
    reg [31:0] spi_miso_length = 32'h0;

    task prepare_spi_xfer;
      input [1024 * 8:0] new_mosi_data;
      input [1024 * 8:0] new_miso_data;
      input [31:0] new_length;
    begin
      mosi_data = new_mosi_data;
      miso_data = new_miso_data;
      spi_mosi_length <= new_length - 1; 
      spi_miso_length <= new_length; 
    end
    endtask
    
    assign spi_miso = (spi_miso_length == 32'hffffffff) ? 1'b1 : miso_data[spi_miso_length];

    always @(negedge spi_sck) begin
      if (spi_cs == 1'b0 && spi_miso_length > 0) begin
        spi_miso_length <= spi_miso_length - 1;
      end
    end

    always @(posedge spi_sck) begin
      if (spi_cs == 1'b0 && spi_mosi_length > 0) begin
        `assert("SPI MOSI data", spi_mosi, mosi_data[spi_mosi_length]);
        spi_mosi_length <= spi_mosi_length - 1;
      end
    end
    

    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    ////
    //// USB Host Modeling
    ////
    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////

    task wait_usb_interpacket_delay;
    begin
      #83328;
      #83328;
      #83328;
      #83328;
      #83328;
      #83328;
    end
    endtask

    task wait_usb_eop;
    begin
      while (!usb_tx_en) #83328;
      while (usb_tx_en) #83328;
      wait_usb_interpacket_delay();
    end
    endtask

    task send_usb_raw_bit;
      input usbp;
      input usbn;
    begin
        usb_p_rx <= usbp;
        usb_n_rx <= usbn;
        #83328;
    end
    endtask

    task send_usb_k;
    begin
      send_usb_raw_bit(1'b0, 1'b1);
    end
    endtask

    task send_usb_j;
    begin
      send_usb_raw_bit(1'b1, 1'b0); 
    end
    endtask

    task send_usb_se0;
    begin
      send_usb_raw_bit(1'b0, 1'b0); 
    end
    endtask
    
    task send_usb_port_reset;
    begin
      send_usb_se0();
      #1250000000; 
      reset = 1;
      send_usb_j();
      reset = 0;
    end
    endtask

    integer i;
    reg send_usb_nrzi_state;
    integer send_usb_bitstuff_count;
    task send_usb_raw;
      input [1023:0] payload;
      input [10:0] length;
    begin
      // sync
      send_usb_k();
      send_usb_j();
      send_usb_k();
      send_usb_j();
      send_usb_k();
      send_usb_j();
      send_usb_k();
      send_usb_k();

      // payload
      send_usb_nrzi_state = 0;
      send_usb_bitstuff_count = 1;
      for (i = 0; i < length; i = i + 1) begin
        // keep track of nrzi state
        // (toggle line state for '0', keep steady for '1')
        if (!payload[i]) begin
          send_usb_nrzi_state = !send_usb_nrzi_state;
        end

        // send the data bit
        send_usb_raw_bit(send_usb_nrzi_state, !send_usb_nrzi_state);
        
        // keep track of bitstuff
        // (how many '1's in a row)
        if (payload[i]) begin
          send_usb_bitstuff_count = send_usb_bitstuff_count + 1;
        end else begin
          send_usb_bitstuff_count = 0;
        end

        // insert a '0' data bit if we hit bitstuff condition
        if (send_usb_bitstuff_count >= 6) begin
          send_usb_bitstuff_count = 0;
          send_usb_nrzi_state = !send_usb_nrzi_state;
          send_usb_raw_bit(send_usb_nrzi_state, !send_usb_nrzi_state);
        end
      end

      // eop
      send_usb_se0();
      send_usb_se0();
      send_usb_j();
      wait_usb_interpacket_delay();
    end
    endtask

    task send_usb_handshake;
      input [3:0] pid;
    begin
      send_usb_raw({~pid, pid}, 8);      
    end
    endtask

    task send_usb_ack;
    begin
      send_usb_handshake(4'b0010);
    end
    endtask

    task send_usb_nak;
    begin
      send_usb_handshake(4'b1010);
    end
    endtask

    task send_usb_stall;
    begin
      send_usb_handshake(4'b1110);
    end
    endtask

    task send_usb_nyet;
    begin
      send_usb_handshake(4'b0110);
    end
    endtask

    reg [4:0] crc5;
    reg crc5_invert; 
    task calc_crc5;
      input [10:0] data;
    begin
      crc5 = 5'b11111;

      for (i = 0; i < 11; i = i + 1) begin
        crc5_invert = data[i] ^ crc5[4]; 

        crc5[4] = crc5[3];
        crc5[3] = crc5[2];
        crc5[2] = crc5[1] ^ crc5_invert;
        crc5[1] = crc5[0];
        crc5[0] = crc5_invert;
      end
    end
    endtask

    task send_usb_token;
      input [3:0] pid;
      input [10:0] data;
    begin
      calc_crc5(data);
      send_usb_raw({~crc5[0], ~crc5[1], ~crc5[2], ~crc5[3], ~crc5[4], data, ~pid, pid}, 24);      
    end
    endtask

    task send_usb_in;
      input [6:0] addr;
      input [3:0] endp;
    begin
      send_usb_token(4'b1001, {endp, addr});
    end
    endtask

    task send_usb_out;
      input [6:0] addr;
      input [3:0] endp;
    begin
      send_usb_token(4'b0001, {endp, addr});
    end
    endtask

    task send_usb_setup;
      input [6:0] addr;
      input [3:0] endp;
    begin
      send_usb_token(4'b1101, {endp, addr});
    end
    endtask

    task send_usb_sof;
      input [10:0] frame;
    begin
      send_usb_token(4'b0101, frame);
    end
    endtask


    

    reg [15:0] crc16;
    reg crc16_invert; 
    task calc_crc16;
      input [511:0] data;
      input [10:0] length;
    begin
      crc16 = 16'b1111111111111111;

      for (i = 0; i < length; i = i + 1) begin
        crc16_invert = data[i] ^ crc16[15]; 

        crc16[15] = crc16[14] ^ crc16_invert;
        crc16[14] = crc16[13];
        crc16[13] = crc16[12];
        crc16[12] = crc16[11];
        crc16[11] = crc16[10];
        crc16[10] = crc16[9];
        crc16[9] = crc16[8];
        crc16[8] = crc16[7];
        crc16[7] = crc16[6];
        crc16[6] = crc16[5];
        crc16[5] = crc16[4];
        crc16[4] = crc16[3];
        crc16[3] = crc16[2];
        crc16[2] = crc16[1] ^ crc16_invert;
        crc16[1] = crc16[0];
        crc16[0] = crc16_invert;
      end
    end
    endtask

    reg [1023:0] raw_usb_data;
    task send_usb_data;
      input [3:0] pid;
      input [511:0] data;
      input [10:0] length;
    begin
      calc_crc16(data, length);
      raw_usb_data[3:0] = pid;
      raw_usb_data[7:4] = ~pid;

      for (i = 0; i < length; i = i + 1) begin
        raw_usb_data[8 + i] = data[i];
      end

      raw_usb_data[8 + length +  0] =  ~crc16[15];
      raw_usb_data[8 + length +  1] =  ~crc16[14];
      raw_usb_data[8 + length +  2] =  ~crc16[13];
      raw_usb_data[8 + length +  3] =  ~crc16[12];
      raw_usb_data[8 + length +  4] =  ~crc16[11];
      raw_usb_data[8 + length +  5] =  ~crc16[10];
      raw_usb_data[8 + length +  6] =  ~crc16[9];
      raw_usb_data[8 + length +  7] =  ~crc16[8];
      raw_usb_data[8 + length +  8] =  ~crc16[7];
      raw_usb_data[8 + length +  9] =  ~crc16[6];
      raw_usb_data[8 + length + 10] =  ~crc16[5];
      raw_usb_data[8 + length + 11] =  ~crc16[4];
      raw_usb_data[8 + length + 12] =  ~crc16[3];
      raw_usb_data[8 + length + 13] =  ~crc16[2];
      raw_usb_data[8 + length + 14] =  ~crc16[1];
      raw_usb_data[8 + length + 15] =  ~crc16[0];

      send_usb_raw(raw_usb_data, 8 + length + 16);      
    end
    endtask

    task send_usb_data0;
      input [511:0] data;
      input [10:0] length;
    begin
      send_usb_data(4'b0011, data, length);
    end
    endtask

    task send_usb_data1;
      input [511:0] data;
      input [10:0] length;
    begin
      send_usb_data(4'b1011, data, length);
    end
    endtask

    task send_usb_data2;
      input [511:0] data;
      input [10:0] length;
    begin
      send_usb_data(4'b0111, data, length);
    end
    endtask

    task send_usb_mdata;
      input [511:0] data;
      input [10:0] length;
    begin
      send_usb_data(4'b1111, data, length);
    end
    endtask


    
    reg [7:0] sync;
    reg [1:0] eop;
    reg prev_usb_p_tx;
    integer get_usb_bitstuff_count;
    task get_usb_raw;
      output [1023:0] data;
      output [10:0] length;
    begin
      length = 0;
      sync = 0;
      eop = 2'b10;

      // wait for sync
      while (sync != 8'b01010100) begin
        sync = {sync[6:0], usb_p_tx};
        prev_usb_p_tx = usb_p_tx; 
        #83328;
      end

      get_usb_bitstuff_count = 0;

      // get data
      while (eop != 2'b00) begin
        eop = {usb_p_tx, usb_n_tx};

        if (eop == 2'b00) begin
          // do not save se0 data

        end else if (get_usb_bitstuff_count == 6) begin
          // expect bitstuff
          `assert_true("one '0' must follow six '1's", usb_p_tx != prev_usb_p_tx);
          get_usb_bitstuff_count = 0;
        end else begin
          // regular data bit
          length = length + 1;
          if (usb_p_tx == prev_usb_p_tx) begin
            data = {1'b1, data[1023:1]};
            get_usb_bitstuff_count = get_usb_bitstuff_count + 1;
          end else begin
            data = {1'b0, data[1023:1]};
            get_usb_bitstuff_count = 0;
          end
        end

        prev_usb_p_tx = usb_p_tx;

        #83328;
      end

      // se0 initiates end of packet, must be two bit-lengths according to
      // the USB2 spec
      `assert_true("eop must have two se0 bits", usb_p_tx == 1'b0 && usb_n_tx == 1'b0);

      // shift the data down to the bottom so the first bit is data[0]
      data = data >> (1024 - length);

      wait_usb_interpacket_delay();
    end
    endtask

    reg [1023:0] usb_tx_data;
    reg [10:0] usb_tx_len;

    task expect_usb_handshake;
      input [3:0] pid;
    begin
      get_usb_raw(usb_tx_data, usb_tx_len);
      `assert("handshake packets are 8 bits long", usb_tx_len, 8);
      `assert("handshake pid mismatch", usb_tx_data[3:0], pid);
      `assert("pid complement mismatch", usb_tx_data[7:4], ~usb_tx_data[3:0]);
    end
    endtask

    task expect_usb_ack;
    begin
      expect_usb_handshake(4'b0010);
    end
    endtask

    task expect_usb_nak;
    begin
      expect_usb_handshake(4'b1010);
    end
    endtask

    task expect_usb_stall;
    begin
      expect_usb_handshake(4'b1110);
    end
    endtask

    task expect_usb_data;
      input [3:0] pid;
      input [1023:0] data;
      input [10:0] length;
    begin
      calc_crc16(data, length);
      raw_usb_data[3:0] = pid;
      raw_usb_data[7:4] = ~pid;

      for (i = 0; i < length; i = i + 1) begin
        raw_usb_data[8 + i] = data[i];
      end

      raw_usb_data[8 + length +  0] =  ~crc16[15];
      raw_usb_data[8 + length +  1] =  ~crc16[14];
      raw_usb_data[8 + length +  2] =  ~crc16[13];
      raw_usb_data[8 + length +  3] =  ~crc16[12];
      raw_usb_data[8 + length +  4] =  ~crc16[11];
      raw_usb_data[8 + length +  5] =  ~crc16[10];
      raw_usb_data[8 + length +  6] =  ~crc16[9];
      raw_usb_data[8 + length +  7] =  ~crc16[8];
      raw_usb_data[8 + length +  8] =  ~crc16[7];
      raw_usb_data[8 + length +  9] =  ~crc16[6];
      raw_usb_data[8 + length + 10] =  ~crc16[5];
      raw_usb_data[8 + length + 11] =  ~crc16[4];
      raw_usb_data[8 + length + 12] =  ~crc16[3];
      raw_usb_data[8 + length + 13] =  ~crc16[2];
      raw_usb_data[8 + length + 14] =  ~crc16[1];
      raw_usb_data[8 + length + 15] =  ~crc16[0];

      for (i = 8 + length + 16; i < 1024; i = i + 1) begin
        raw_usb_data[i] = 1'b0;
      end

      get_usb_raw(usb_tx_data, usb_tx_len);

      //`assert_true("data packets are less than 536 bits long", usb_tx_len < 536);
      //`assert_true("data packets are at least 24 bits long", usb_tx_len >= 24);
      `assert("data length", usb_tx_len, length + 24);
      `assert("data mismatch", usb_tx_data, raw_usb_data);
      `assert("data packet lengths are a multiple of 8 bits", usb_tx_len[2:0], 3'b000);
      `assert("pid complement mismatch", usb_tx_data[7:4], ~usb_tx_data[3:0]);
      `assert("data pid mismatch", usb_tx_data[3:0], pid);
    end
    endtask
      
    task expect_usb_data1;
      input [1023:0] data;
      input [10:0] length;
    begin
      expect_usb_data(4'b1011, data, length);
    end
    endtask
      
    task expect_usb_data0;
      input [1023:0] data;
      input [10:0] length;
    begin
      expect_usb_data(4'b0011, data, length);
    end
    endtask

    task send_usb_ctrl_xfer;
      input [7:0] addr;
      input [63:0] setup_data;
    begin
      // setup stage
      send_usb_setup(addr, 0); 
      send_usb_data0(setup_data, 64);
      expect_usb_ack();

      // status stage
      send_usb_in(addr, 0);
      expect_usb_data1(0, 0);
      send_usb_ack();
    end
    endtask


    task send_usb_address_device;
      input [7:0] old_addr;
      input [7:0] new_addr;
    begin
      send_usb_ctrl_xfer(old_addr, {8'h00, 8'h00, 8'h00, 8'h00, 8'h00, new_addr, 8'h05, 8'h00});
      `assert("new device address", dut.dev_addr, 7'h1e);
    end
    endtask

    
