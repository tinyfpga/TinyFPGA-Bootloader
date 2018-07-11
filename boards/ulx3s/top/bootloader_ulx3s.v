module bootloader_ulx3s (
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
  clk_200M_48M clk_48M_inst (
    .CLKI(clk_200mhz),
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
  wire pin_led;
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
    .spi_miso(flash_miso),
    .spi_cs(flash_csn),
    .spi_mosi(flash_mosi),
    .spi_sck(flash_clk),
    .boot(boot)
  );

  assign usb_fpga_dp = usb_tx_en ? usb_p_tx : 1'bz;
  assign usb_fpga_dn = usb_tx_en ? usb_n_tx : 1'bz;
  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_fpga_dp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_fpga_dn;

  assign wifi_gpio0 = btn[0];
  assign led[7] = btn[0];
  assign reset = btn[1];
  assign led[6] = btn[1];
  assign led[5] = boot;
  assign led[0] = pin_led;

endmodule
