module usb_asp_ctrl_ep (
  input clk,
  input reset,
  output [6:0] dev_addr,
  
  output reg [7:0] debug_led,
  
  ////////////////////
  // spi chip
  ////////////////////
  input spi_miso,
  output spi_mosi,
  output reg spi_clk = 1,
  output reg spi_csn = 1,

  ////////////////////
  // out endpoint interface 
  ////////////////////
  output out_ep_req,
  input out_ep_grant,
  input out_ep_data_avail,
  input out_ep_setup,
  output out_ep_data_get,
  input [7:0] out_ep_data,
  output out_ep_stall,
  input out_ep_acked,


  ////////////////////
  // in endpoint interface 
  ////////////////////
  output in_ep_req,
  input in_ep_grant,
  input in_ep_data_free,
  output in_ep_data_put,
  output [7:0] in_ep_data,
  output in_ep_data_done,
  output reg in_ep_stall,
  input in_ep_acked
);
  

  localparam IDLE = 0;
  localparam SETUP = 1;
  localparam DATA_IN = 2;
  localparam DATA_OUT = 3;
  localparam STATUS_IN = 4;
  localparam STATUS_OUT = 5;
  
  reg [5:0] ctrl_xfr_state = IDLE;
  reg [5:0] ctrl_xfr_state_next;
 
 
 
  reg setup_stage_end = 0;
  reg data_stage_end = 0;
  reg status_stage_end = 0;
  reg send_zero_length_data_pkt = 0;


  /////////////////////////
  /// SPI BUFFERING
  /////////////////////////
  reg [7:0] out_buf [0:63]; // PC out transfer should be received here (64 byte max)
  reg [7:0] in_buf [0:31]; // PC in transfer when PC reads back buffered SPI response (32 byte max)
  reg [5:0] out_buf_addr_usb = 0; // 0-32 address for the buffer
  reg [5:0] out_buf_addr_spi = 0; // 0-32 address for the buffer for SPI sender
  reg [5:0] spi_length = 0; // 0-32 number of bytes to be sent by OUT
  reg [5:0] spi_bytes_sent = 0; // 0-32 bit current number of bytes sent by OUT
  reg [3:0] spi_bit_counter = 10; // 0-15
  reg send_in_buf = 0;
  reg spi_continue = 0; // 0:normal packet (reset start, closed end) 1:packet continued (open start, open end)
  
  // help with assembling the SPI byte
  reg [7:0] spi_miso_byte; // host input, device output
  wire [7:0] spi_miso_byte_next;
  assign spi_miso_byte_next = {spi_miso_byte[6:0], spi_miso}; // input with shifting, MSB enters shift-register first
  reg [7:0] spi_mosi_byte; // host output, device input
  wire [7:0] spi_mosi_byte_next;
  assign spi_mosi_byte_next = {spi_mosi_byte[6:0], 1'b0}; // input with shifting, MSB enters shift-register first
  assign spi_mosi = spi_mosi_byte[7]; // output: MSB SPI bit gets shifted out first

  wire more_data_out;
  
  reg [15:0] superslow;


  // the default control endpoint gets assigned the device address
  reg [6:0] dev_addr_i = 0;
  assign dev_addr = dev_addr_i;

  assign out_ep_req = out_ep_data_avail;
  assign out_ep_data_get = out_ep_data_avail;
  reg out_ep_data_valid = 0;
  always @(posedge clk) out_ep_data_valid <= out_ep_data_avail && out_ep_grant;

  // need to record the setup data
  reg [3:0] setup_data_addr = 0;
  reg [9:0] raw_setup_data [7:0];

  wire [7:0] bmRequestType = raw_setup_data[0];
  wire [7:0] bRequest = raw_setup_data[1];
  wire [15:0] wValue = {raw_setup_data[3][7:0], raw_setup_data[2][7:0]};
  wire [15:0] wIndex = {raw_setup_data[5][7:0], raw_setup_data[4][7:0]};
  wire [15:0] wLength = {raw_setup_data[7][7:0], raw_setup_data[6][7:0]};

  // keep track of new out data start and end
  wire pkt_start;
  wire pkt_end;

  rising_edge_detector detect_pkt_start (
    .clk(clk),
    .in(out_ep_data_avail),
    .out(pkt_start)
  );

  falling_edge_detector detect_pkt_end (
    .clk(clk),
    .in(out_ep_data_avail),
    .out(pkt_end)
  );

  assign out_ep_stall = 1'b0;

  wire setup_pkt_start = pkt_start && out_ep_setup;

  wire has_data_stage = wLength != 16'b0000000000000000;

  wire out_data_stage;
  assign out_data_stage = has_data_stage && !bmRequestType[7];

  wire in_data_stage;
  assign in_data_stage = has_data_stage && bmRequestType[7];

  reg [7:0] bytes_sent = 0;
  reg [6:0] rom_length = 0;

  wire all_data_sent = 
    (bytes_sent >= rom_length) ||
    (bytes_sent >= wLength);

  wire more_data_to_send =
    !all_data_sent;

  wire in_data_transfer_done;

  rising_edge_detector detect_in_data_transfer_done (
    .clk(clk),
    .in(all_data_sent),
    .out(in_data_transfer_done)
  );

  assign in_ep_data_done = (in_data_transfer_done && ctrl_xfr_state == DATA_IN) || send_zero_length_data_pkt;

  assign in_ep_req = ctrl_xfr_state == DATA_IN && more_data_to_send;
  assign in_ep_data_put = ctrl_xfr_state == DATA_IN && more_data_to_send && in_ep_data_free;


  reg [6:0] rom_addr = 0;

  reg save_dev_addr = 0;
  reg [6:0] new_dev_addr = 0;

  ////////////////////////////////////////////////////////////////////////////////
  // control transfer state machine
  ////////////////////////////////////////////////////////////////////////////////


  always @* begin
    setup_stage_end <= 0;
    data_stage_end <= 0;
    status_stage_end <= 0;
    send_zero_length_data_pkt <= 0;

    case (ctrl_xfr_state)
      IDLE : begin
        if (setup_pkt_start) begin
          ctrl_xfr_state_next <= SETUP;
        end else begin
          ctrl_xfr_state_next <= IDLE;
        end
      end

      SETUP : begin
        if (pkt_end) begin
          setup_stage_end <= 1;

          if (in_data_stage) begin
            ctrl_xfr_state_next <= DATA_IN;

          end else if (out_data_stage) begin
            ctrl_xfr_state_next <= DATA_OUT;

          end else begin
            ctrl_xfr_state_next <= STATUS_IN;
            send_zero_length_data_pkt <= 1;
          end

        end else begin
          ctrl_xfr_state_next <= SETUP;
        end
      end

      DATA_IN : begin
	if (in_ep_stall) begin
          ctrl_xfr_state_next <= IDLE;
          data_stage_end <= 1;
          status_stage_end <= 1;

	end else if (in_ep_acked && all_data_sent) begin
          ctrl_xfr_state_next <= STATUS_OUT;
          data_stage_end <= 1;

        end else begin
          ctrl_xfr_state_next <= DATA_IN;
        end
      end

      DATA_OUT : begin
        // if (out_ep_acked) begin
        if (pkt_end) begin
          ctrl_xfr_state_next <= STATUS_IN;
          send_zero_length_data_pkt <= 1;
          data_stage_end <= 1;

        end else begin
          ctrl_xfr_state_next <= DATA_OUT;
        end
      end

      STATUS_IN : begin
        if (in_ep_acked) begin
          ctrl_xfr_state_next <= IDLE;
          status_stage_end <= 1;
          
        end else begin
          ctrl_xfr_state_next <= STATUS_IN;
        end
      end

      STATUS_OUT: begin
        if (out_ep_acked) begin
          ctrl_xfr_state_next <= IDLE;
          status_stage_end <= 1;
          
        end else begin
          ctrl_xfr_state_next <= STATUS_OUT;
        end
      end

      default begin
        ctrl_xfr_state_next <= IDLE;
      end
    endcase
  end

  always @(posedge clk) begin
    if (reset) begin
      ctrl_xfr_state <= IDLE;
    end else begin
      ctrl_xfr_state <= ctrl_xfr_state_next;
    end
  end

  always @(posedge clk) begin
    in_ep_stall <= 0;

    if (out_ep_setup && out_ep_data_valid) begin
      raw_setup_data[setup_data_addr] <= out_ep_data;
      setup_data_addr <= setup_data_addr + 1;
    end

    if (setup_stage_end) begin
    case (bmRequestType[6:5]) // 2 bits describing request type
      0: begin // 0: standard request
      send_in_buf <= 0; // not vendor-specific
      case (bRequest)
        'h06 : begin
          // GET_DESCRIPTOR
          case (wValue[15:8]) 
            1 : begin
              // DEVICE
              rom_addr    <= 0; 
              rom_length  <= 18;
            end 

            2 : begin
              // CONFIGURATION
              rom_addr    <= 18; 
              rom_length  <= 18;
            end 

            6 : begin
              // DEVICE_QUALIFIER
              in_ep_stall <= 1;
              rom_addr   <= 0;
              rom_length <= 0;
            end

          endcase
        end

        'h05 : begin
          // SET_ADDRESS
          rom_addr   <= 0;
          rom_length <= 0;

          // we need to save the address after the status stage ends
          // this is because the status stage token will still be using
          // the old device address
          save_dev_addr <= 1;
          new_dev_addr <= wValue[6:0]; 
        end

        'h09 : begin
          // SET_CONFIGURATION
          rom_addr   <= 0;
          rom_length <= 0;
        end

        'h20 : begin
          // SET_LINE_CODING
          rom_addr   <= 0;
          rom_length <= 0;
        end

        'h21 : begin
          // GET_LINE_CODING
          rom_addr   <= 85;
          rom_length <= 7;
        end

        'h22 : begin
          // SET_CONTROL_LINE_STATE
          rom_addr   <= 0;
          rom_length <= 0;
        end

        'h23 : begin
          // SEND_BREAK
          rom_addr   <= 0;
          rom_length <= 0;
        end

        default begin
          rom_addr   <= 0;
          rom_length <= 0;
        end
      endcase
      end // end 0: standard request

      2: begin // 2: vendor specific request (also would handle 1 or 3)
        case (bRequest)
          0: begin // write or read SPI data block
            spi_continue <= wValue[0];
            if (in_data_stage)
            begin
              send_in_buf <= 1; // this is vendor-specific request, send data from RAM buffer, not descriptor ROM
              rom_addr <= 0; // misnomer: rom_addr here addresses RAM buffer actually
              rom_length <= wLength; // misnomer: rom_length is actually RAM bytes to be sent
              bytes_sent <= 0;
            end
            if (out_data_stage)
            begin
              send_in_buf <= 0;
              // out_buf_addr_usb <= 0;
              spi_length <= wLength;
              spi_bytes_sent <= 0;
              if (spi_bytes_sent != spi_length)
                debug_led <= debug_led + 1; // indicate overrun, new packet arrived before SPI finished
            end
          end // end bRequest 0
          
          1: begin // read SPI state (0:free 1:busy) IN request
            // choose ROM location which is not likely to change
            // because it will send data from ROM, not buffer
            send_in_buf <= 0;
            if (spi_bytes_sent == spi_length)
              rom_addr <= 5; // must point to 0 in ROM descriptor
            else
              rom_addr <= 1; // must point to 1 in ROM descriptor
            rom_length <= 1;
            bytes_sent <= 0;
          end

          default begin // catch all other bRequest != 0
          end
        endcase
      end // end 2: vendor specific request
      default begin // default 1,3: unhandled
      end // end defaul
    endcase
    end

    if ( (ctrl_xfr_state == DATA_IN) && more_data_to_send && in_ep_grant && in_ep_data_free) begin
      rom_addr <= rom_addr + 1;
      bytes_sent <= bytes_sent + 1;
    end

    if ( (ctrl_xfr_state == DATA_OUT) && out_ep_data_valid && ~out_ep_setup) begin
      out_buf[out_buf_addr_usb] <= out_ep_data;
      out_buf_addr_usb <= out_buf_addr_usb + 1;
    end

    //superslow <= superslow + 1;
    //if (superslow == 0)
    if (spi_bytes_sent == spi_length)
    begin // nothing to send
      if (spi_continue == 0)
      begin
        spi_clk <= 1; // clock inactive
        spi_csn <= 1; // disable chip
        spi_bit_counter <= 10; // skip first few clock cycle
      end
    end
    else // spi_bytes_sent != spi_length
    begin
      spi_csn <= 0; // enable chip
      if(out_buf_addr_usb != out_buf_addr_spi) // more spi data
      begin
        if (spi_bit_counter[3])
          spi_bit_counter <= spi_bit_counter + 1; // skip some cycles, flash needs small delay from csn=0 to clk
        else // spi_bit_counter < 8
        begin
          if (spi_clk == 1)
          begin // clock=0: send data to SPI chip
            if (spi_bit_counter[2:0] == 0)
              spi_mosi_byte <= out_buf[out_buf_addr_spi]; // new byte from buffer
            else
              spi_mosi_byte <= spi_mosi_byte_next; // shift bit output to SPI chip
          end
          if (spi_clk == 0)
          begin // clock=1: read data from SPI chip
            spi_miso_byte <= spi_miso_byte_next; // shift input from SPI chip
            if (spi_bit_counter[2:0] == 7) // byte completed
            begin
              in_buf[spi_bytes_sent] <= spi_miso_byte_next; // complete byte to IN buffer, later sent
              spi_bytes_sent <= spi_bytes_sent + 1;
              out_buf_addr_spi <= out_buf_addr_spi + 1; // catch up
            end
            spi_bit_counter[2:0] <= spi_bit_counter[2:0] + 1;
          end
          spi_clk <= ~spi_clk;
        end // spi bit counter < 8
      end // more_spi_data
    end // spi_bytes_sent != spi_length


    if (status_stage_end) begin
      setup_data_addr <= 0;      
      bytes_sent <= 0;
      rom_addr <= 0;
      rom_length <= 0;

      if (save_dev_addr) begin
        save_dev_addr <= 0;
        dev_addr_i <= new_dev_addr; 
      end 
    end

    if (reset) begin
      bytes_sent <= 0;
      rom_addr <= 0;
      rom_length <= 0;
      dev_addr_i <= 0;
      setup_data_addr <= 0;
      save_dev_addr <= 0;
      send_in_buf <= 0;
      spi_length <= 0;
      spi_bytes_sent <= 0;
      debug_led <= 0;
  end
  end

  assign in_ep_data = (send_in_buf ? in_buf[rom_addr[4:0]] : descriptor_rom[rom_addr]);

  wire [7:0] descriptor_rom [0:35];
    assign descriptor_rom[0] = 18; // bLength
      assign descriptor_rom[1] = 1; // bDescriptorType
      assign descriptor_rom[2] = 'h00; // bcdUSB[0]
      assign descriptor_rom[3] = 'h02; // bcdUSB[1]
      assign descriptor_rom[4] = 'hFF; // bDeviceClass
      assign descriptor_rom[5] = 'h00; // bDeviceSubClass
      assign descriptor_rom[6] = 'h00; // bDeviceProtocol
      assign descriptor_rom[7] = 32; // bMaxPacketSize0

      assign descriptor_rom[8] = 'hc0; // idVendor[0] VOTI
      assign descriptor_rom[9] = 'h16; // idVendor[1]
      assign descriptor_rom[10] = 'hdc; // idProduct[0]
      assign descriptor_rom[11] = 'h05; // idProduct[1]
      
      assign descriptor_rom[12] = 1; // bcdDevice[0] version minor
      assign descriptor_rom[13] = 0; // bcdDevice[1] version major
      assign descriptor_rom[14] = 0; // iManufacturer
      assign descriptor_rom[15] = 0; // iProduct
      assign descriptor_rom[16] = 0; // iSerialNumber
      assign descriptor_rom[17] = 1; // bNumConfigurations

      // configuration descriptor
      assign descriptor_rom[18] = 9; // bLength
      assign descriptor_rom[19] = 2; // bDescriptorType
      assign descriptor_rom[20] = 18; // wTotalLength[0] 
      assign descriptor_rom[21] = 0; // wTotalLength[1]
      assign descriptor_rom[22] = 1; // bNumInterfaces (must have at least 1 interface)
      assign descriptor_rom[23] = 1; // bConfigurationValue
      assign descriptor_rom[24] = 0; // iConfiguration
      assign descriptor_rom[25] = 'hC0; // bmAttributes
      assign descriptor_rom[26] = 250; // bMaxPower
      
      // interface descriptor, USB spec 9.6.5, page 267-269, Table 9-12
      assign descriptor_rom[27] = 9; // bLength
      assign descriptor_rom[28] = 4; // bDescriptorType
      assign descriptor_rom[29] = 0; // bInterfaceNumber
      assign descriptor_rom[30] = 0; // bAlternateSetting
      assign descriptor_rom[31] = 0; // bNumEndpoints
      assign descriptor_rom[32] = 0; // bInterfaceClass
      assign descriptor_rom[33] = 0; // bInterfaceSubClass
      assign descriptor_rom[34] = 0; // bInterfaceProtocol
      assign descriptor_rom[35] = 0; // iInterface

endmodule

/* TODO
[ ] duplicate packets sometimes recived (did SPI finish before new packet came')
[ ] lsusb -vvv -d shows descriptor and vailts, try to dump traffic with wireshark
[ ] overrun signal - problem: SPI often stalls
*/
