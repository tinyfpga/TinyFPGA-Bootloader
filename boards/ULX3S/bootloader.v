`default_nettype none
`include "tinyfpga_bootloader.v"
`include "edge_detect.v"
`include "usb_fs_pe.v"
`include "usb_fs_in_arb.v"
`include "usb_fs_in_pe.v"
`include "usb_fs_out_arb.v"
`include "usb_fs_out_pe.v"
`include "usb_fs_rx.v"
`include "usb_fs_tx.v"
`include "usb_fs_tx_mux.v"
`include "usb_reset_det.v"
`include "usb_serial_ctrl_ep.v"
`include "usb_spi_bridge_ep.v"
`include "pll_240.v"
`include "pll_48.v"


module top(
	input clk_25mhz,
	output [7:0] led,
	output wifi_gpio0,

	//input ftdi_txd, // from the ftdi chip
	//output ftdi_rxd, // to the ftdi chip

	// USB port directly wired to serial port
	inout usb_fpga_bd_dn,
	inout usb_fpga_bd_dp,
	output usb_fpga_pu_dp,
	output usb_fpga_pu_dn,

	// onboard SPI flash
	output flash_csn,
	//output flash_clk, // special - see USRMCLK below
	output flash_mosi,
	input flash_miso,
	output flash_holdn,
	output flash_wpn,

	// select a reboot from the user space on the flash
	output user_programn
);
	// avoid reboot?
	assign wifi_gpio0 = 1;

	// 25 MHz input clock, 240 MHz output
	wire clk_240mhz, clk_48mhz;
	wire locked;
	wire reset = !locked;
	pll_240 pll_240_i(clk_25mhz, clk_240mhz);
	pll_48 pll_48_i(clk_240mhz, clk_48mhz, locked);

	// configure as a full speed device (pull up on dp)
	assign usb_fpga_pu_dp = 1; // full speed 1.1 device
	assign usb_fpga_pu_dn = 0; // full speed 1.1 device
	wire usb_tx_en;
	wire usb_p_tx, usb_n_tx;
	wire usb_p_rx, usb_n_rx;

	TRELLIS_IO #(.DIR("BIDIR")) usb_p_buf(
		.T(!usb_tx_en),
		.B(usb_fpga_bd_dp),
		.I(usb_p_tx),
		.O(usb_p_rx),
	);
	TRELLIS_IO #(.DIR("BIDIR")) usb_n_buf(
		.T(!usb_tx_en),
		.B(usb_fpga_bd_dn),
		.I(usb_n_tx),
		.O(usb_n_rx),
	);

	// ensure that the flash aux pins are in a stable state
	// and allow flash updates
	assign flash_holdn = 1;
	assign flash_wpn = 1;

	// the U3 pin on the package is special and requires magic to drive it
	wire flash_clk;
	wire flash_csn_i; // needs to be a wire?
	assign flash_csn = flash_csn_i;
	USRMCLK usrmclk_inst (
		.USRMCLKI(flash_clk),
		.USRMCLKTS(flash_csn_i)
	) /* synthesis syn_noprune=1 */;


	wire boot;

	tinyfpga_bootloader tinyfgpa_bootloader_inst(
		.clk_48mhz(clk_48mhz),
		.reset(reset),
		.usb_p_tx(usb_p_tx),
		.usb_n_tx(usb_n_tx),
		.usb_p_rx(usb_tx_en ? 1'b1 : usb_p_rx),
		.usb_n_rx(usb_tx_en ? 1'b0 : usb_n_rx),
		.usb_tx_en(usb_tx_en),
		.led(led[0]),
		.spi_miso(flash_miso),
		.spi_cs(flash_csn_i),
		.spi_mosi(flash_mosi),
		.spi_sck(flash_clk),
		.boot(boot)
	);

	reg initiate_boot = 0;
	reg [8:0] boot_delay = 0;

	assign user_programn = ~boot_delay[8]; // initiate user program
	assign led[7:1] = 0;
 
	always @(posedge clk_48mhz) begin
		if (boot)
			initiate_boot <= 1;

		if (initiate_boot) begin
			boot_delay <= boot_delay + 1'b1;
		end
	end
endmodule
