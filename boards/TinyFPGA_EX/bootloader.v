module TinyFPGA_EX (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,

  input  pin_miso,
  output pin_cs,
  output pin_mosi,
  output pin_io2,
  output pin_io3,
  
  output pin_programn,
  output pin_26
);

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;

  usb_pll_inst usb_pll_inst_inst (
    .CLKI(pin_clk), 
    .CLKOP(clk_48mhz)
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
  wire usb_tx_en;

  assign pin_io2 = 1;
  assign pin_io3 = 1;
  
  wire pin_sck;
  wire pin_cs_i;
  assign pin_cs = pin_cs_i;

  wire boot;
  
  tinyfpga_bootloader tinyfpga_bootloader_inst (
    .clk_48mhz(clk_48mhz),
    .reset(reset),
    .usb_p_tx(usb_p_tx),
    .usb_n_tx(usb_n_tx),
    .usb_p_rx(usb_p_rx),
    .usb_n_rx(usb_n_rx),
    .usb_tx_en(usb_tx_en),
    .led(pin_led),
    .spi_miso(pin_miso),
    .spi_cs(pin_cs_i),
    .spi_mosi(pin_mosi),
    .spi_sck(pin_sck),
    .boot(boot)
  );
  
  reg initiate_boot = 0;
  reg [8:0] boot_delay = 0;
  assign pin_programn = ~boot_delay[8];
 
  
  always @(posedge pin_clk) begin
    if (boot) initiate_boot <= 1;

    if (initiate_boot) begin
		boot_delay <= boot_delay + 1'b1;
    end
  end

  assign pin_pu = 1'b1;
  assign pin_usbp = usb_tx_en ? usb_p_tx : 1'bz;
  assign pin_usbn = usb_tx_en ? usb_n_tx : 1'bz;
  assign usb_p_rx = usb_tx_en ? 1'b1 : pin_usbp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : pin_usbn;

  USRMCLK usrmclk_inst (
    .USRMCLKI(pin_sck),
	.USRMCLKTS(pin_cs_i)
  ) /* synthesis syn_noprune=1 */;

  assign reset = 0;
endmodule
