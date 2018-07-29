module bootloader_asp_ulx3s (
  input  clk_25mhz,

  inout  usb_fpga_dp,
  inout  usb_fpga_dn,

  output [7:0] led,

  input  flash_miso,
  output flash_mosi,
  output flash_clk,
  output flash_csn,
 
  input [6:0] btn,
  output wifi_gpio0
);

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_200mhz;
  clk_25M_200M clk_200M_inst (
    .CLKI(clk_25mhz),
    .CLKOP(clk_200mhz)
  );

  wire clk_48mhz;
  wire clk_ready;
  clk_200M_48M clk_48M_inst (
    .CLKI(clk_200mhz),
    .CLKOP(clk_48mhz),
    .LOCK(clk_ready)
  );
  
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// instantiate tinyfpga bootloader
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  reg reset = 1'b1;
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_tx_en;
  wire pin_led;
  wire [7:0] debug_led;
  wire boot;
  wire S_flash_clk;
  wire S_flash_csn;

  usbasp_bootloader usbasp_bootloader_inst (
    .clk_48mhz(clk_48mhz),
    .reset(reset),
    .usb_p_tx(usb_p_tx),
    .usb_n_tx(usb_n_tx),
    .usb_p_rx(usb_p_rx),
    .usb_n_rx(usb_n_rx),
    .usb_tx_en(usb_tx_en),
    .led(pin_led),
    .debug_led(debug_led),
    .spi_miso(flash_miso),
    .spi_mosi(flash_mosi),
    .spi_sck(S_flash_clk),
    .spi_cs(S_flash_csn),
    .boot(boot)
  );

  assign usb_fpga_dp = reset ? 1'b0 : (usb_tx_en ? usb_p_tx : 1'bz);
  assign usb_fpga_dn = reset ? 1'b0 : (usb_tx_en ? usb_n_tx : 1'bz);
  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_fpga_dp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_fpga_dn;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// Vendor-specific clock output to SPI config flash
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  USRMCLK usrmclk_inst (
    .USRMCLKI(S_flash_clk),
    .USRMCLKTS(S_flash_csn)
  ) /* synthesis syn_noprune=1 */;
  assign flash_clk = S_flash_clk;
  assign flash_csn = S_flash_csn;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// ULX3S board buttons and LEDs
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  assign wifi_gpio0 = btn[0];
  //assign led[5] = boot;
  // assign led = debug_led;
  assign led[3:0] = {flash_miso, flash_mosi, S_flash_clk, S_flash_csn}; 
  
  always @(posedge clk_48mhz)
  begin
    reset <= btn[1] | ~clk_ready;
  end

endmodule
