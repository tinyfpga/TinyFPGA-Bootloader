// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sun Apr 22 19:10:08 2018
// Host        : DESKTOP-V34NFE6 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/Digilent-Arty/Digilent-Arty.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg324-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_48mhz, clk_100mhz)
/* synthesis syn_black_box black_box_pad_pin="clk_48mhz,clk_100mhz" */;
  output clk_48mhz;
  input clk_100mhz;
endmodule
