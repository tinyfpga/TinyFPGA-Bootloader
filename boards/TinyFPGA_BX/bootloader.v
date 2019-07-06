module bootloader (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,

  input  pin_29_miso,
  output pin_30_cs,
  output pin_31_mosi,
  output pin_32_sck
);
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;
  wire lock;
  wire reset = !lock;

  SB_PLL40_CORE #(
    .DIVR(4'b0000),
    .DIVF(7'b0101111),
    .DIVQ(3'b100),
    .FILTER_RANGE(3'b001),
    .FEEDBACK_PATH("SIMPLE"),
    .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
    .FDA_FEEDBACK(4'b0000),
    .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
    .FDA_RELATIVE(4'b0000),
    .SHIFTREG_DIV_MODE(2'b00),
    .PLLOUT_SELECT("GENCLK"),
    .ENABLE_ICEGATE(1'b0)
  ) usb_pll_inst (
    .REFERENCECLK(pin_clk),
    .PLLOUTCORE(clk_48mhz),
    .PLLOUTGLOBAL(),
    .EXTFEEDBACK(),
    .DYNAMICDELAY(),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .LATCHINPUTVALUE(),
    .LOCK(lock),
    .SDI(),
    .SDO(),
    .SCLK()
  );

	reg clk_24mhz;
	reg clk_12mhz;
	always @(posedge clk_48mhz) clk_24mhz = !clk_24mhz;
	always @(posedge clk_24mhz) clk_12mhz = !clk_12mhz;

	wire clk = clk_12mhz; // quarter speed clock

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// interface with iCE40 warmboot/multiboot capability
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire boot;

  SB_WARMBOOT warmboot_inst (
    .S1(1'b0),
    .S0(1'b1),
    .BOOT(boot)
  );


  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// instantiate tinyfpga bootloader
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_p_rx_io;
  wire usb_n_rx_io;
  wire usb_tx_en;

  tinyfpga_bootloader tinyfpga_bootloader_inst (
    .clk_48mhz(clk_48mhz),
    .clk(clk),
    .reset(reset),
    .usb_p_tx(usb_p_tx),
    .usb_n_tx(usb_n_tx),
    .usb_p_rx(usb_p_rx),
    .usb_n_rx(usb_n_rx),
    .usb_tx_en(usb_tx_en),
    .led(pin_led),
    .spi_miso(pin_29_miso),
    .spi_cs(pin_30_cs),
    .spi_mosi(pin_31_mosi),
    .spi_sck(pin_32_sck),
    .boot(boot)
  );

  assign pin_pu = 1'b1;

  wire usb_p_rx_io;
  wire usb_n_rx_io;
  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_p_rx_io;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_n_rx_io;

  tristate usbn_buffer(
	.pin(pin_usbn),
	.enable(usb_tx_en),
	.data_in(usb_n_rx_io),
	.data_out(usb_n_tx)
  );

  tristate usbp_buffer(
	.pin(pin_usbp),
	.enable(usb_tx_en),
	.data_in(usb_p_rx_io),
	.data_out(usb_p_tx)
  );
endmodule

module tristate(
  inout pin,
  input enable,
  input data_out,
  output data_in
);
  SB_IO #(
    .PIN_TYPE(6'b1010_01) // tristatable output
  ) buffer(
    .PACKAGE_PIN(pin),
    .OUTPUT_ENABLE(enable),
    .D_IN_0(data_in),
    .D_OUT_0(data_out)
  );
endmodule
