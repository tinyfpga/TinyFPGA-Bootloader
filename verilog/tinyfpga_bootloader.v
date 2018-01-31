module tinyfpga_bootloader (
  input  clk_48mhz,

  // USB lines
  inout  usb_p,
  inout  usb_n,

  // 1.5k pull-up resistor should be connected between usb_pu and usb_p.
  output usb_pu,

  // bootloader indicator light, pulses on and off when bootloader is active
  output led,

  // connection to SPI flash
  input  spi_miso,
  output spi_cs,
  output spi_mosi,
  output spi_sck,

  // when asserted it indicates the bootloader is ready for the FPGA to load
  // the user config.  different FPGAs use different primitives for this
  // function.
  output boot
);
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// bootloader LED
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  reg [7:0] led_pwm;
  reg [7:0] pwm_cnt;
  
  reg [5:0] ns_cnt;
  wire ns_rst = (ns_cnt == 48);
  always @(posedge clk_48mhz) begin
    if (ns_rst) begin
      ns_cnt <= 0;
    end else begin
      ns_cnt <= ns_cnt + 1'b1;
    end
  end
  
  reg [9:0] us_cnt;
  wire us_rst = (us_cnt == 1000);
  always @(posedge clk_48mhz) begin
    if (us_rst) begin
      us_cnt <= 0;
    end else if (ns_rst) begin
      us_cnt <= us_cnt + 1'b1;
    end
  end
  
  reg [9:0] ms_cnt;
  wire ms_rst = (ms_cnt == 1000);
  always @(posedge clk_48mhz) begin
    if (ms_rst) begin
      ms_cnt <= 0;
    end else if (us_rst) begin
      ms_cnt <= ms_cnt + 1'b1;
    end
  end
  
  reg count_down = 0;
  always @(posedge clk_48mhz) begin
    if (us_rst) begin
      if (count_down) begin 
        if (led_pwm == 0) begin
          count_down <= 0;
        end else begin
          led_pwm <= led_pwm - 1'b1; 
        end
      end else begin
        if (led_pwm == 255) begin
          count_down <= 1;
        end else begin
          led_pwm <= led_pwm + 1'b1; 
        end
      end
    end
  end
  always @(posedge clk_48mhz) pwm_cnt <= pwm_cnt + 1'b1; 
  assign led = led_pwm > pwm_cnt;  



  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// usb engine
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  wire [6:0] dev_addr;
  wire [7:0] out_ep_data;

  wire ctrl_out_ep_req;
  wire ctrl_out_ep_grant;
  wire ctrl_out_ep_data_avail;
  wire ctrl_out_ep_setup;
  wire ctrl_out_ep_data_get;
  wire ctrl_out_ep_stall;
  wire ctrl_out_ep_acked;

  wire ctrl_in_ep_req;
  wire ctrl_in_ep_grant;
  wire ctrl_in_ep_data_free;
  wire ctrl_in_ep_data_put;
  wire [7:0] ctrl_in_ep_data;clk_48mhz
  wire ctrl_in_ep_data_done;
  wire ctrl_in_ep_stall;
  wire ctrl_in_ep_acked;


  wire serial_out_ep_req;
  wire serial_out_ep_grant;
  wire serial_out_ep_data_avail;
  wire serial_out_ep_setup;
  wire serial_out_ep_data_get;
  wire serial_out_ep_stall;
  wire serial_out_ep_acked;

  wire serial_in_ep_req;
  wire serial_in_ep_grant;
  wire serial_in_ep_data_free;
  wire serial_in_ep_data_put;
  wire [7:0] serial_in_ep_data;
  wire serial_in_ep_data_done;
  wire serial_in_ep_stall;
  wire serial_in_ep_acked;

  wire sof_valid;
  wire [10:0] frame_index;

  reg [31:0] host_presence_timer;
  reg host_presence_timeout;

  wire boot_to_user_design;

  wire [31:0] output_pin_values;
  wire [31:0] output_pin_enables;

  wire reset;

  assign boot = host_presence_timeout || boot_to_user_design;

  usb_serial_ctrl_ep ctrl_ep_inst (
    .clk(clk_48mhz),
    .reset(reset),
    .dev_addr(dev_addr),

    // out endpoint interface 
    .out_ep_req(ctrl_out_ep_req),
    .out_ep_grant(ctrl_out_ep_grant),
    .out_ep_data_avail(ctrl_out_ep_data_avail),
    .out_ep_setup(ctrl_out_ep_setup),
    .out_ep_data_get(ctrl_out_ep_data_get),
    .out_ep_data(out_ep_data),
    .out_ep_stall(ctrl_out_ep_stall),
    .out_ep_acked(ctrl_out_ep_acked),


    // in endpoint interface 
    .in_ep_req(ctrl_in_ep_req),
    .in_ep_grant(ctrl_in_ep_grant),
    .in_ep_data_free(ctrl_in_ep_data_free),
    .in_ep_data_put(ctrl_in_ep_data_put),
    .in_ep_data(ctrl_in_ep_data),
    .in_ep_data_done(ctrl_in_ep_data_done),
    .in_ep_stall(ctrl_in_ep_stall),
    .in_ep_acked(ctrl_in_ep_acked)
  );

  usb_spi_bridge_ep usb_spi_bridge_ep_inst (
    .clk(clk_48mhz),
    .reset(reset),

    // out endpoint interface 
    .out_ep_req(serial_out_ep_req),
    .out_ep_grant(serial_out_ep_grant),
    .out_ep_data_avail(serial_out_ep_data_avail),
    .out_ep_setup(serial_out_ep_setup),
    .out_ep_data_get(serial_out_ep_data_get),
    .out_ep_data(out_ep_data),
    .out_ep_stall(serial_out_ep_stall),
    .out_ep_acked(serial_out_ep_acked),

    // in endpoint interface 
    .in_ep_req(serial_in_ep_req),
    .in_ep_grant(serial_in_ep_grant),
    .in_ep_data_free(serial_in_ep_data_free),
    .in_ep_data_put(serial_in_ep_data_put),
    .in_ep_data(serial_in_ep_data),
    .in_ep_data_done(serial_in_ep_data_done),
    .in_ep_stall(serial_in_ep_stall),
    .in_ep_acked(serial_in_ep_acked),

    // spi interface 
    .spi_cs_b(spi_cs),
    .spi_sck(spi_sck),
    .spi_mosi(spi_mosi),
    .spi_miso(spi_miso),

    // warm boot interface
    .boot_to_user_design(boot_to_user_design),

    // output pin interface for test
    .output_pin_values(output_pin_values),
    .output_pin_enables(output_pin_enables)
  );

  wire nak_in_ep_grant;
  wire nak_in_ep_data_free;
  wire nak_in_ep_acked;

  usb_fs_pe #(
    .NUM_OUT_EPS(2),
    .NUM_IN_EPS(3)
  ) usb_fs_pe_inst (
    .clk(clk_48mhz),
    .reset(reset),

    .dp(usb_p),
    .dn(usb_n),
    .pu(usb_pu),

    .dev_addr(dev_addr),

    // out endpoint interfaces 
    .out_ep_req({serial_out_ep_req, ctrl_out_ep_req}),
    .out_ep_grant({serial_out_ep_grant, ctrl_out_ep_grant}),
    .out_ep_data_avail({serial_out_ep_data_avail, ctrl_out_ep_data_avail}),
    .out_ep_setup({serial_out_ep_setup, ctrl_out_ep_setup}),
    .out_ep_data_get({serial_out_ep_data_get, ctrl_out_ep_data_get}),
    .out_ep_data(out_ep_data),
    .out_ep_stall({serial_out_ep_stall, ctrl_out_ep_stall}),
    .out_ep_acked({serial_out_ep_acked, ctrl_out_ep_acked}),

    // in endpoint interfaces 
    .in_ep_req({1'b0, serial_in_ep_req, ctrl_in_ep_req}),
    .in_ep_grant({nak_in_ep_grant, serial_in_ep_grant, ctrl_in_ep_grant}),
    .in_ep_data_free({nak_in_ep_data_free, serial_in_ep_data_free, ctrl_in_ep_data_free}),
    .in_ep_data_put({1'b0, serial_in_ep_data_put, ctrl_in_ep_data_put}),
    .in_ep_data({8'b0, serial_in_ep_data[7:0], ctrl_in_ep_data[7:0]}),
    .in_ep_data_done({1'b0, serial_in_ep_data_done, ctrl_in_ep_data_done}),
    .in_ep_stall({1'b0, serial_in_ep_stall, ctrl_in_ep_stall}),
    .in_ep_acked({nak_in_ep_acked, serial_in_ep_acked, ctrl_in_ep_acked}),

    // sof interface
    .sof_valid(sof_valid),
    .frame_index(frame_index)
  );

  

  ////////////////////////////////////////////////////////////////////////////////
  // host presence detection
  ////////////////////////////////////////////////////////////////////////////////

  always @(posedge clk_48mhz) begin
    if (sof_valid) begin
      host_presence_timer <= 0;
      host_presence_timeout <= 0;
    end else begin
      host_presence_timer <= host_presence_timer + 1;
    end

    if (host_presence_timer > 48000000) begin
      host_presence_timeout <= 1;
    end
  end
endmodule
