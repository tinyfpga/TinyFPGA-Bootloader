`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2018 07:03:26 PM
// Design Name: 
// Module Name: bootloader
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module bootloader (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,

  input  pin_miso,
  output pin_cs,
  output pin_mosi,
  output pin_sck
);

// Micron N25Q128A13ESF40 on Arty-7
// 32MB of flash
// "bootloader" : "0x00000000-0x000FEFFF",
// "metadata"   : "0x000FF000-0x000FFFFF",
// "userimage"  : "0x00100000-0x003EFFFF",
// "userdata"   : "0x003F0000-0x003FFFFF"

  localparam c_user_start = 48'h0000_0100_0000;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;
  wire clk_48mhz_to_bufg;
  wire clkfbout_buf;
  wire clkfbout;
  wire mmcm_locked;

  MMCME2_BASE 
    #(
      .CLKFBOUT_MULT_F(12.000000),
      .CLKFBOUT_PHASE(0.000000),
      .CLKIN1_PERIOD(10),
      .CLKOUT0_DIVIDE_F(25.000000)
      )                        
  mmcme2_inst 
    (
     .CLKIN1(pin_clk),
     .CLKOUT0(clk_48mhz_to_bufg),
     .PWRDWN(1'b0),
     .RST(1'b0),              
     .LOCKED(mmcm_locked),
     .CLKFBIN(clkfbout_buf),
     .CLKFBOUT(clkfbout)
     );

  BUFG clkf_buf
    (
     .I(clkfbout),
     .O(clkfbout_buf)
     );

  BUFG clk48_buf
    (
     .I(clk_48mhz_to_bufg),
     .O(clk_48mhz)
     );

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// interface with 7 series warmboot/multiboot capability
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire boot;
  wire reset;
  
  wbicapetwo #(
    .G_START_ADDRESS(c_user_start)
    )                        
  wbicapetwo_inst (
    .clk(clk_48mhz),
    .reset(reset),
    .boot(boot),
    .pin_led(pin_led)
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
    .spi_miso(pin_miso),
    .spi_cs(pin_cs),
    .spi_mosi(pin_mosi),
    .spi_sck(pin_sck),
    .boot(boot)
  );

  assign pin_pu = 1'b1;
  assign pin_usbp = usb_tx_en ? usb_p_tx : 1'bz;
  assign pin_usbn = usb_tx_en ? usb_n_tx : 1'bz;
  assign usb_p_rx = usb_tx_en ? 1'b1 : pin_usbp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : pin_usbn;

  assign reset = !mmcm_locked;  // TODO : add hysteresis
endmodule
