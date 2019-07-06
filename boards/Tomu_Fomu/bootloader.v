module bootloader (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led_r,
  output pin_led_g,
  output pin_led_b,

  input  flash_miso,
  output flash_cs,
  output flash_mosi,
  output flash_sck
);
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;
  wire locked;

`define USE_HFOSC_NO
`ifdef USE_HFOSC
	SB_HFOSC u_hfosc (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_48mhz)
	);
	assign locked = 1;
`else
	// the Tomu hacker verison has an external 48 MHz oscillator
	// so there is no need for a PLL.
	assign locked = 1;
	assign clk_48mhz = pin_clk;
`endif

	reg clk_24mhz;
	reg clk_12mhz;
	wire clk = clk_12mhz;
	always @(posedge clk_48mhz) clk_24mhz = !clk_24mhz;
	always @(posedge clk_24mhz) clk_12mhz = !clk_12mhz;


	assign pin_led_g = 1;

/*
	reg [23:0] counter;
	always @(posedge clk_48mhz)
		if (counter == 24'h7FFFFF)
			pin_led_r <= 1;
		else begin
			counter <= counter + 1;
			pin_led_r <= 0;
		end
*/
	assign pin_led_r = 1;


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
  wire reset = !locked;
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
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
    .led(pin_led_b),
    .spi_miso(flash_miso),
    .spi_cs(flash_cs),
    .spi_mosi(flash_mosi),
    .spi_sck(flash_sck),
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
