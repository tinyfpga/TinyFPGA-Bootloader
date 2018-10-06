`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2018 03:30:38 PM
// Design Name: 
// Module Name: wbicapetwo
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


module wbicapetwo(
        input clk,
        input reset,
        input boot
    );
    
    parameter [31:0] g_address = 32'h00000000;

     localparam [31:0] c_dummy_word = 32'hFFFFFFFF; // Dummy Word
     localparam [31:0] c_sync_word = 32'hAA995566; // Sync Word
     localparam [31:0] c_noop_word = 32'h20000000; // Type 1 NO OP
     localparam [31:0] c_wbstar_word = 32'h30020001; // Type 1 Write 1 Words to WBSTAR
     localparam [31:0] c_cmd_word = 32'h30008001;   // Type 1 Write 1 Words to CMD
     localparam [31:0] c_iprog_word = 32'h0000000F; // IPROG Command
     
     integer ix = 0;
     reg enable = 1'b0;
     reg boot_1d = 1'b0;
     reg [31:0] icape2_input = 0;
     reg icape2_csib = 1'b1;
     reg icape2_rdwrb = 1'b1;
     wire [31:0] icape2_output;

    always @(posedge clk)
    begin
        if (reset)
            begin
              ix <= 0;
              enable <= 1'b0;
            end
        else 
            begin
                boot_1d <= boot;
                if (boot == 1'b1 && boot_1d == 1'b0)
                    enable <= 1'b1;

                if (enable && ix < 9)
                    begin
                      ix <= ix + 1;
                    end
        
                case (ix)
                    1:  begin
                            icape2_input <= c_dummy_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    2:  begin
                            icape2_input <= c_sync_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    3:  begin
                            icape2_input <= c_noop_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    4:  begin
                            icape2_input <= c_wbstar_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    5:  begin
                            icape2_input <= g_address;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    6:  begin
                            icape2_input <= c_cmd_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    7:  begin
                            icape2_input <= c_iprog_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                    8:  begin
                            icape2_input <= c_noop_word;
                            icape2_rdwrb <= 1'b0;
                            icape2_csib  <= 1'b0;
                        end
                default:
                        begin
                            icape2_rdwrb <= 1'b1;
                            icape2_csib  <= 1'b1;
                            //enable       <= 1'b0;
                        end
                 endcase
             end  // else reset
    end // always

  ICAPE2 #(
      .ICAP_WIDTH("X32")   // Specifies the input and output data width.
   )
   ICAPE2_inst (
      .O(icape2_output),   // 32-bit output: Configuration data output bus
      .CLK(clk),           // 1-bit input: Clock Input
      .CSIB(icape2_csib),  // 1-bit input: Active-Low ICAP Enable
      .I(icape2_input),    // 32-bit input: Configuration data input bus
      .RDWRB(icape2_csib)  // 1-bit input: Read/Write Select input
   );


endmodule
