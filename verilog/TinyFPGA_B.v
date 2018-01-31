module TinyFPGA_B (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,

  input  pin_29_miso,
  output pin_30_cs,
  output pin_31_mosi,
  output pin_32_sck,

  /*
  output pin_1,
  output pin_2,
  output pin_3,
  output pin_4,
  output pin_5,
  output pin_6,
  output pin_7,
  output pin_8,
  output pin_9,
  output pin_10,
  output pin_11,
  output pin_12,
  output pin_13,
  output pin_14,
  output pin_15
  output pin_16,
  output pin_17,
  output pin_18,
  output pin_19,
  output pin_20,
  input  pin_21,
  input  pin_22,
  input  pin_23,
  input  pin_24,
  input  pin_25,
  input  pin_26,
  input  pin_27,
  input  pin_28,
  input  pin_33,
  input  pin_34,
  input  pin_35,
  input  pin_36,
  input  pin_37
  */
);
  wire clk_48mhz;

  /*

  TODO: endpoint reset

   */

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////

  SB_PLL40_CORE usb_pll_inst (
    .REFERENCECLK(pin_clk),
    .PLLOUTCORE(clk_48mhz),
    .PLLOUTGLOBAL(),
    .EXTFEEDBACK(),
    .DYNAMICDELAY(),
    .RESETB(1),
    .BYPASS(1'b0),
    .LATCHINPUTVALUE(),
    .LOCK(),
    .SDI(),
    .SDO(),
    .SCLK()
  );

  // Fin=16, Fout=48;
  defparam usb_pll_inst.DIVR = 4'b0000;
  defparam usb_pll_inst.DIVF = 7'b0101111;
  defparam usb_pll_inst.DIVQ = 3'b100;
  defparam usb_pll_inst.FILTER_RANGE = 3'b001;
  defparam usb_pll_inst.FEEDBACK_PATH = "SIMPLE";
  defparam usb_pll_inst.DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED";
  defparam usb_pll_inst.FDA_FEEDBACK = 4'b0000;
  defparam usb_pll_inst.DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED";
  defparam usb_pll_inst.FDA_RELATIVE = 4'b0000;
  defparam usb_pll_inst.SHIFTREG_DIV_MODE = 2'b00;
  defparam usb_pll_inst.PLLOUT_SELECT = "GENCLK";
  defparam usb_pll_inst.ENABLE_ICEGATE = 1'b0;



  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// bootloader LED
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  reg [7:0] led_pwm;
  reg [7:0] pwm_cnt;
  
  reg [4:0] ns_cnt;
  wire ns_rst = (ns_cnt == 16);
  always @(posedge pin_clk) begin
    if (ns_rst) begin
      ns_cnt <= 0;
    end else begin
      ns_cnt <= ns_cnt + 1'b1;
    end
  end
  
  reg [9:0] us_cnt;
  wire us_rst = (us_cnt == 1000);
  always @(posedge pin_clk) begin
    if (us_rst) begin
      us_cnt <= 0;
    end else if (ns_rst) begin
      us_cnt <= us_cnt + 1'b1;
    end
  end
  
  reg [9:0] ms_cnt;
  wire ms_rst = (ms_cnt == 1000);
  always @(posedge pin_clk) begin
    if (ms_rst) begin
      ms_cnt <= 0;
    end else if (us_rst) begin
      ms_cnt <= ms_cnt + 1'b1;
    end
  end
  
  reg count_down = 0;
  always @(posedge pin_clk) begin
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
  always @(posedge pin_clk) pwm_cnt <= pwm_cnt + 1'b1; 
  assign pin_led = led_pwm > pwm_cnt;  



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
  wire [7:0] ctrl_in_ep_data;
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

  SB_WARMBOOT warmboot_inst (
    .S1(0),
    .S0(1),
    .BOOT(host_presence_timeout || boot_to_user_design)
  );

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
    .spi_cs_b(pin_30_cs),
    .spi_sck(pin_32_sck),
    .spi_mosi(pin_31_mosi),
    .spi_miso(pin_29_miso),

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

    .dp(pin_usbp),
    .dn(pin_usbn),
    .pu(pin_pu),

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
