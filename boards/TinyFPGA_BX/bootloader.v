`include "util.v"
`include "fifo.v"
`include "uart.v"

module bootloader (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,

  input  pin_29_miso,
  output pin_30_cs,
  output pin_31_mosi,
  output pin_32_sck,

  output pin_8 // uart
);
  wire serial_tx = pin_8;

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;
  wire lock;
  wire reset = !lock;

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
    .LOCK(lock),
    .SDI(),
    .SDO(),
    .SCLK()
  );

	reg clk_24mhz;
	reg clk_12mhz;
	always @(posedge clk_48mhz) clk_24mhz = !clk_24mhz;
	always @(posedge clk_24mhz) clk_12mhz = !clk_12mhz;
	wire clk = !clk_48mhz;

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
  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_tx_en;

`ifdef NONONO

	wire bit_strobe;
	wire pkt_start;
	wire pkt_start;
	wire pkt_end;
	wire [3:0] pid;
	wire [6:0] addr;
	wire [3:0] endp;
	wire [10:0] frame_num;
	wire rx_data_put;
	wire [7:0] rx_data;
	wire valid_packet;

	usb_fs_rx usb(
		.clk_48mhz(clk_48mhz),
		.clk(clk),
		.reset(reset),
		.dp(usb_p_rx),
		.dn(usb_n_rx),
		.bit_strobe(bit_strobe),
		.pkt_start(pkt_start),
		.pkt_end(pkt_end),
		.pid(pid),
		.addr(addr),
		.endp(endp),
		.frame_num(frame_num),
		.rx_data_put(rx_data_put),
		.rx_data(rx_data),
		.valid_packet(valid_packet)
	);

	assign usb_tx_en = 0;

	parameter FIFO_WIDTH = 24;
	reg [FIFO_WIDTH-1:0] fifo_write_data;
	reg fifo_write_strobe;
	wire [FIFO_WIDTH-1:0] fifo_read_data;
	reg fifo_read_strobe;
	wire fifo_data_available;

	fifo_bram #(.WIDTH(FIFO_WIDTH)) uart_fifo(
		.reset(reset),
		.write_clk(clk),
		.write_strobe(fifo_write_strobe),
		.write_data(fifo_write_data),
		.read_clk(clk),
		.read_strobe(fifo_read_strobe),
		.read_data(fifo_read_data),
		.data_available(fifo_data_available)
	);

	always @(posedge clk)
	begin
		fifo_write_strobe <= 0;

		if (pkt_start) begin
			fifo_write_strobe <= 1;
			fifo_write_data <= {
				4'hA,
				20'b0,
			};
		end else
		if (rx_data_put) begin
			fifo_write_strobe <= 1;
			fifo_write_data <= {
				pkt_start ? 4'hA : 4'hB, // 4
				12'b0, // 12
				rx_data // 8
			};
		end else
		if (pkt_end) begin
			fifo_write_strobe <= 1;
			fifo_write_data <= {
				valid_packet ? 4'hC : 4'hF,
				pid,	// 4
				1'b0, addr, // 1 + 7
				frame_num[7:0] // 8
			};
		end
	end
`endif

	reg uart_strobe;
	reg [7:0] uart_data;
	wire uart_ready;

	wire clk_1;
	divide_by_n #(.N(16)) div48(clk_48mhz, reset, clk_1);

	uart_tx_fifo uart_tx(
		.clk(clk),
		.reset(reset),
		.baud_x1(clk_1),
		.data(uart_data),
		.data_strobe(uart_strobe),
		.serial(serial_tx)
	);

/*
	reg [FIFO_WIDTH-1:0] hexdata;
	reg [7:0] len;
	reg [12:0] counter;

	always @(posedge clk)
	begin
		uart_strobe <= 0;
		fifo_read_strobe <= 0;
		counter <= counter + 1;
		pin_led <= 0;

		if (!uart_ready
		||   uart_strobe
		||   counter != 0
		) begin
			// nothing
		end else
		begin
			uart_data <= "A";
			uart_strobe <= 1;
			pin_led <= 1;
		end
	end
*/
/*
	always @(posedge clk)
	begin
		uart_strobe <= 0;
		fifo_read_strobe <= 0;
		counter <= counter + 1;
		pin_led <= 0;

		if (len == 0
		&&  fifo_data_available
		&& !fifo_read_strobe) begin
			len <= 8;
			hexdata <= fifo_read_data;
			fifo_read_strobe <= 1;
			pin_led <= 1;
		end else
		if (!uart_ready
		||  uart_strobe
		||  counter != 0
		) begin
			// nothing
		end else
		if (len == 1) begin
			uart_data <= "\n";
			uart_strobe <= 1;
			len <= 0;
		end else
		if (len == 2) begin
			uart_data <= "\r";
			uart_strobe <= 1;
			len <= 1;
		end else
		if (len != 0) begin
			uart_data <= hexdigit(hexdata[FIFO_WIDTH-1:FIFO_WIDTH-4]);
			uart_strobe <= 1;
			hexdata <= { hexdata[FIFO_WIDTH-5:0], 4'b0 };
			len <= len - 1;
		end
	end
*/

  tinyfpga_bootloader tinyfpga_bootloader_inst (
    .clk_48mhz(clk_48mhz),
    .clk(clk),
    .reset(reset),
    .uart_data(uart_data),
    .uart_strobe(uart_strobe),
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
  assign pin_usbp = usb_tx_en ? usb_p_tx : 1'bz;
  assign pin_usbn = usb_tx_en ? usb_n_tx : 1'bz;
  assign usb_p_rx = usb_tx_en ? 1'b1 : pin_usbp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : pin_usbn;

endmodule
