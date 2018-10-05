`timescale 1 ns / 10 ps
`define clk_half_period 10.4166667

module wbicapetwo_tb;
  reg clk_48mhz = 0;
  reg reset     = 1;
  reg boot      = 0;
  integer counter = 0;

  wbicapetwo wbicapetwo_inst (
                              .clk_48mhz(clk_48mhz),
                              .reset(reset),
                              .boot(boot)
                              );
  always @ (posedge clk_48mhz)
    begin : TB
      counter <= counter + 1;
      if (counter < 1000) begin
        reset <= 1'b1;
      end else if (counter < 2000) begin
        reset <= 1'b0;
      end else if (counter < 2100) begin
        boot  <= 1'b1;
      end else begin
        boot <= 1'b0;
      end
    end


  always
    #`clk_half_period clk_48mhz <= ~clk_48mhz;


  
endmodule
