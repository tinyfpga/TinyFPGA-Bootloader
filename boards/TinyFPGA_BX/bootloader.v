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
  wire reset;
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_p_rx_io;
  wire usb_n_rx_io;
  wire usb_tx_en;

  tinyfpga_bootloader tinyfpga_bootloader_inst (
    .clk_48mhz(clk_48mhz),
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
  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_p_rx_io;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_n_rx_io;

  SB_IO #(
     .PIN_TYPE(6'b101001),
     .PULLUP(1'b0),
     .NEG_TRIGGER(1'b0),
     .IO_STANDARD("SB_LVCMOS")
   ) io_dp_I (
     .PACKAGE_PIN(pin_usbp),
     .LATCH_INPUT_VALUE(1'b0),
     .CLOCK_ENABLE(1'b1),
     .INPUT_CLK(1'b0),
     .OUTPUT_CLK(1'b0),
     .OUTPUT_ENABLE(usb_tx_en),
     .D_OUT_0(usb_p_tx),
     .D_OUT_1(1'b0),
     .D_IN_0(usb_p_rx_io),
     .D_IN_1()
  );

  SB_IO #(
     .PIN_TYPE(6'b101001),
     .PULLUP(1'b0),
     .NEG_TRIGGER(1'b0),
     .IO_STANDARD("SB_LVCMOS")
   ) io_dn_I (
     .PACKAGE_PIN(pin_usbn),
     .LATCH_INPUT_VALUE(1'b0),
     .CLOCK_ENABLE(1'b1),
     .INPUT_CLK(1'b0),
     .OUTPUT_CLK(1'b0),
     .OUTPUT_ENABLE(usb_tx_en),
     .D_OUT_0(usb_n_tx),
     .D_OUT_1(1'b0),
     .D_IN_0(usb_n_rx_io),
     .D_IN_1()
  );

  assign reset = 1'b0; 
endmodule
