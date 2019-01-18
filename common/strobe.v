module strobe(
	input clk_in,
	input clk_out,
	input strobe_in,
	output strobe_out,
	input [WIDTH-1:0] data_in,
	output [WIDTH-1:0] data_out
);
	parameter WIDTH = 1;
`define CLOCK_CROSS
`ifdef CLOCK_CROSS
	reg flag;
	reg [2:0] sync;
	reg [WIDTH-1:0] data;

	always @(posedge clk_in) begin
		flag <= flag ^ strobe_in;
		if (strobe_in)
			data <= data_in;
	end

	always @(posedge clk_out)
		sync <= { sync[1:0], flag };

	assign strobe_out = sync[1] ^ sync[0];
	assign data_out = data;
	//assign data_out = data_in;
`else
	assign strobe_out = strobe_in;
	assign data_out = data_in;
`endif
endmodule
