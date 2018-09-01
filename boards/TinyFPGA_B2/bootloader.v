module bootloader (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,

  input  pin_miso,
  output pin_cs,
  output pin_mosi,
  output pin_sck
);
  // generate 48 mhz clock
  wire clk_48mhz;

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
    .LOCK(),
    .SDI(),
    .SDO(),
    .SCLK()
  );

  // interface with iCE40 warmboot/multiboot capability
  wire boot;

  SB_WARMBOOT warmboot_inst (
    .S1(1'b0),
    .S0(1'b1),
    .BOOT(boot)
  );

  // instantiate tinyfpga bootloader
  wire reset;
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_tx_en;

  tinyfpga_bootloader tinyfpga_bootloader_inst (
    .clk_48mhz(clk_48mhz),
    .reset(reset),
    .usb_p_tx(usb_p_tx),
    .usb_n_tx(usb_n_tx),
    .usb_p_rx(usb_p_rx),
    .usb_n_rx(usb_n_rx),
    .usb_tx_en(usb_tx_en),
    .spi_miso(pin_miso),
    .spi_cs(pin_cs),
    .spi_mosi(pin_mosi),
    .spi_sck(pin_sck),
    .boot(boot)
  );

  wire usb_p_rx_in;
  wire usb_n_rx_in;
  SB_IO #(
    .PIN_TYPE(6'b1010_01), // simple input, tristate output
    .PULLUP(1'b0)
  ) usb_io_buf [1:0] (
    .PACKAGE_PIN({pin_usbp, pin_usbn}),
    .OUTPUT_ENABLE({usb_tx_en, usb_tx_en}),
    .D_OUT_0({usb_p_tx, usb_n_tx}),
    .D_IN_0({usb_p_rx_in, usb_n_rx_in})
  );
  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_p_rx_in;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_n_rx_in;

  assign reset = 1'b0;
endmodule
