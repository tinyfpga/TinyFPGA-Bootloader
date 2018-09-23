module bootloader_sp_ulx3s (
  input  clk_25mhz,

  inout  usb_fpga_dp,
  inout  usb_fpga_dn,
  
  output usb_fpga_pu_dp,
  inout user_programn,

  output [7:0] led,

  input  flash_miso,
  output flash_mosi,
  output flash_csn,
  output flash_wpn,
  output flash_holdn,
 
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
  reg [15:0] reset_counter = 0; // counter for debouce and prolong reset
  wire reset;
  assign reset = ~reset_counter[15];
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

  tinyfpgasp_bootloader tinyfpgasp_bootloader_inst (
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
  assign flash_csn = S_flash_csn;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// Debonuce and prolong RESET
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  always @(posedge clk_48mhz)
  begin
    if (btn[1] | ~clk_ready)
      reset_counter <= 0;
    else
      if (reset_counter[15] == 0)
        reset_counter <= reset_counter + 1;
  end
  

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// ULX3S board buttons and LEDs
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  assign wifi_gpio0 = btn[0];
  assign led[0] = pin_led;
  assign led[1] = ~pin_led;
  assign led[5] = debug_led;
  assign led[7] = boot;
  // assign led[3:0] = {flash_miso, flash_mosi, S_flash_clk, S_flash_csn}; 
  
  // PULLUP 1.5k D+
  assign usb_fpga_pu_dp = 1;

  // set 1 to holdn wpn for use as single bit mode spi
  assign flash_holdn = 1;
  assign flash_wpn = 1;

  // EXIT from BOOTLOADER
  assign user_programn = ~boot;
  

endmodule
