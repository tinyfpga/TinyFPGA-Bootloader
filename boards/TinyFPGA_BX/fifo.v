
/** 256 Kb SPRAM, organized 16 K x 16 bits */
module spram(
	input clk,
	input reset = 0,
	input cs = 1,
	input [DEPTH-1:0] addr,
	input write_strobe,
	input [15:0] write_data,
	output [15:0] read_data
);
	parameter DEPTH = 16;

	wire [15:0] read_data_0;
	wire [15:0] read_data_1;
	wire [15:0] read_data_2;
	wire [15:0] read_data_3;

	wire cs0, cs1, cs2, cs3;
/*
	generate if (DEPTH == 14)
		assign cs0 = cs;
		assign cs1 = 0;
		assign cs2 = 0;
		assign cs3 = 0;
	endgenerate
	generate if (DEPTH == 15)
		assign cs0 = cs & addr[14] == 1'b0;
		assign cs1 = cs & addr[14] == 1'b1;
		assign cs2 = 0;
		assign cs3 = 0;
	endgenerate
*/
	generate if (DEPTH == 16)
		assign cs0 = cs && addr[15:14] == 2'b00;
		assign cs1 = cs && addr[15:14] == 2'b01;
		assign cs2 = cs && addr[15:14] == 2'b10;
		assign cs3 = cs && addr[15:14] == 2'b11;
	endgenerate

	assign read_data = 
		cs0 ? read_data_0 :
		cs1 ? read_data_1 :
		cs2 ? read_data_2 :
		read_data_3;

	SB_SPRAM256KA spram0(
		.DATAOUT(read_data_0),
		.ADDRESS(addr[13:0]),
		.DATAIN(write_data),
		.MASKWREN(4'b1111),
		.WREN(write_strobe),
		.CHIPSELECT(cs0 && !reset),
		.CLOCK(clk),

		// if we cared about power, maybe we would adjust these
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1)
	);

	generate if (DEPTH > 14)
	SB_SPRAM256KA spram1(
		.DATAOUT(read_data_1),
		.ADDRESS(addr[13:0]),
		.DATAIN(write_data),
		.MASKWREN(4'b1111),
		.WREN(write_strobe),
		.CHIPSELECT(cs1 && !reset),
		.CLOCK(clk),

		// if we cared about power, maybe we would adjust these
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1)
	);
	endgenerate

	generate if (DEPTH > 15)

	SB_SPRAM256KA spram2(
		.DATAOUT(read_data_2),
		.ADDRESS(addr[13:0]),
		.DATAIN(write_data),
		.MASKWREN(4'b1111),
		.WREN(write_strobe),
		.CHIPSELECT(cs2 && !reset),
		.CLOCK(clk),

		// if we cared about power, maybe we would adjust these
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1)
	);

	SB_SPRAM256KA spram3(
		.DATAOUT(read_data_3),
		.ADDRESS(addr[13:0]),
		.DATAIN(write_data),
		.MASKWREN(4'b1111),
		.WREN(write_strobe),
		.CHIPSELECT(cs3 && !reset),
		.CLOCK(clk),

		// if we cared about power, maybe we would adjust these
		.STANDBY(1'b0),
		.SLEEP(1'b0),
		.POWEROFF(1'b1)
	);
	endgenerate
endmodule


module fifo_spram(
	input clk,
	input reset,
	input [WIDTH-1:0] write_data,
	input write_strobe,
	output [WIDTH-1:0] read_data,
	input read_strobe,
	output data_available
);
	parameter WIDTH = 16;
	parameter DEPTH = 16; // 14 == one SPRAM deep, 15 == two deep, 16 == four
	reg [DEPTH-1:0] write_ptr = 0;
	reg [DEPTH-1:0] read_ptr = 0;
	assign data_available = read_ptr != write_ptr;

	spram #(
		.DEPTH(DEPTH)
	) buf0(
		.clk(clk),
		.reset(reset),
		.write_strobe(write_strobe),
		.addr(write_strobe ? write_ptr : read_ptr), 
		.write_data(write_data[15:0]),
		.read_data(read_data[15:0]),
	);

	generate if (WIDTH > 16)
	spram #(
		.DEPTH(DEPTH)
	) buf1(
		.clk(clk),
		.reset(reset),
		.write_strobe(write_strobe),
		.addr(write_strobe ? write_ptr : read_ptr), 
		.write_data(write_data[31:16]),
		.read_data(read_data[31:16]),
	);
	endgenerate

	generate if (WIDTH > 32)
	spram #(
		.DEPTH(DEPTH)
	) buf2(
		.clk(clk),
		.reset(reset),
		.write_strobe(write_strobe),
		.addr(write_strobe ? write_ptr : read_ptr), 
		.write_data(write_data[47:32]),
		.read_data(read_data[47:32]),
	);
	endgenerate

	generate if (WIDTH > 48)
	spram #(
		.DEPTH(DEPTH)
	) buf3(
		.clk(clk),
		.reset(reset),
		.write_strobe(write_strobe),
		.addr(write_strobe ? write_ptr : read_ptr), 
		.write_data(write_data[63:48]),
		.read_data(read_data[63:48]),
	);
	endgenerate

	always @(posedge clk)
	begin
		if (write_strobe)
			write_ptr <= write_ptr + 1;

		if (read_strobe)
			read_ptr <= read_ptr + 1;
	end
endmodule



module fifo_bram(
	input reset,
	input write_clk,
	input write_strobe,
	input [WIDTH-1:0] write_data,
	input read_clk,
	input read_strobe,
	output [WIDTH-1:0] read_data,
	output data_available
);
	parameter WIDTH = 16; // one block RAM wide
	parameter DEPTH = 8; // one block RAM deep
	reg [DEPTH-1:0] read_ptr;
	reg [DEPTH-1:0] write_ptr;

	reg [WIDTH-1:0] fifo[(1 << DEPTH)-1:0];

	assign read_data = fifo[read_ptr];

	reg data_available_0;
	reg data_available_1;
	//reg data_available;
	assign data_available = read_ptr != write_ptr;

	always @(posedge read_clk)
	begin
		if (reset)
			read_ptr <= 0;
		else
		if (read_strobe)
			read_ptr <= read_ptr + 1;

		//data_available <= read_ptr != write_ptr;
		//data_available <= data_available_0;
		//data_available <= data_available_1;
	end

	always @(posedge write_clk)
	begin
		if (reset)
			write_ptr <= 0;
		else
		if (write_strobe) begin
			fifo[write_ptr] <= write_data;
			write_ptr <= write_ptr + 1;
		end
	end
endmodule
	

module fifo_combo(
	input reset,
	input write_clk,
	input write_strobe,
	input [WIDTH-1:0] write_data,
	input read_clk,
	input read_strobe,
	output [WIDTH-1:0] read_data,
	output data_available
);
	parameter WIDTH = 16;

`define NO_SPRAM
`ifdef NO_SPRAM
	parameter DEPTH = 12;
	// just wire it up
	fifo_bram #(
		.WIDTH(WIDTH),
		.DEPTH(DEPTH)
	) fifo0(
		.reset(reset),
		.write_clk(write_clk),
		.write_strobe(write_strobe),
		.write_data(write_data),
		.read_clk(read_clk),
		.read_strobe(read_strobe),
		.read_data(read_data),
		.data_available(data_available)
	);
`else
	parameter DEPTH = 16;
	wire [WIDTH-1:0] fifo0_read_data;
	reg fifo0_read_strobe;
	wire fifo0_data_available;
	reg fifo1_write_strobe;

	fifo_bram #(
		.WIDTH(WIDTH),
	) fifo0(
		.reset(reset),
		.write_clk(write_clk),
		.write_strobe(write_strobe),
		.write_data(write_data),
		.read_clk(read_clk),
		.read_strobe(fifo0_read_strobe),
		.read_data(fifo0_read_data),
		.data_available(fifo0_data_available)
	);

	fifo_spram #(
		.WIDTH(WIDTH),
		.DEPTH(DEPTH)
	) fifo1(
		.reset(reset),
		.clk(read_clk),
		//.write_data(32'hA55AB00F),
		.write_data(fifo0_read_data),
		.write_strobe(fifo1_write_strobe),
		.read_data(read_data),
		.read_strobe(read_strobe),
		.data_available(data_available)
	);

	reg [3:0] counter;

	always @(posedge read_clk) begin
		fifo0_read_strobe <= 0;
		fifo1_write_strobe <= 0;
		counter <= counter + 1;

		if (reset) begin
			// nothing
		end else
		if (fifo0_data_available
		&& !fifo0_read_strobe
		&& !fifo1_write_strobe
		&& !read_strobe // don't move if the user is also moving
		&& counter == 0
		) begin
			// move data from fifo0 into fifo1
			fifo0_read_strobe <= 1;
			fifo1_write_strobe <= 1;
		end
	end
`endif
endmodule

module fifo_bram_16to8(
	input read_clk,
	input write_clk,
	input reset,
	output data_available,
	input [16-1:0] write_data,
	input write_strobe,
	output [8-1:0] read_data,
	input read_strobe
);

	reg [BITS-1:0] write_ptr;
	reg [BITS-1:0] read_ptr;

	// reads from the SPRAM are 16-bits at a time,
	// so we have to pick which byte of the word should be extracted
`undef BUFFER
`ifdef BUFFER
	parameter BITS = 13;
	reg [15:0] buffer[(1 << BITS)-1:0];
	wire [15:0] rdata_16 = buffer[read_ptr[BITS-1:1]];
`else
	parameter BITS = 8;
	wire [15:0] rdata_16;
SB_RAM40_4K #(.READ_MODE(0), .WRITE_MODE(0)) ram256x16_inst (
.RDATA(rdata_16[15:0]),
.RADDR({ 4'b0, read_ptr[BITS-1:1] }),
.RCLK(read_clk),
.RCLKE(!reset),
.RE(1),
.WADDR({ 4'b0, write_ptr[BITS-1:1] }),
.WCLK(write_clk),
.WCLKE(!reset),
.WDATA(write_data[15:0]),
.WE(write_strobe),
.MASK(16'h0)
);
`endif
	assign data_available = read_ptr != write_ptr;
	assign read_data = (!read_ptr[0]) ? rdata_16[15:8] : rdata_16[7:0];

	always @(posedge read_clk)
	begin
		if (reset) begin
			read_ptr <= 0;
		end else
		if (read_strobe) begin
			read_ptr <= read_ptr + 1;
		end
	end

	always @(posedge write_clk)
	begin
		if (reset) begin
			write_ptr <= 0;
		end else
		if (write_strobe) begin
`ifdef BUFFER
			buffer[write_ptr[BITS-1:1]] <= write_data;
`endif
			write_ptr <= write_ptr + 2;
		end
	end
endmodule
