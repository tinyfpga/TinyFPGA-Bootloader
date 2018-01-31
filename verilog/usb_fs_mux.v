module usb_fs_mux (
  input clk,
  output reg reset,

  // raw usb d+/d- lines
  inout dp,
  inout dn,

  // output enable
  input oe,

  // transmit value when output enabled
  input dp_tx,
  input dn_tx,

  // receive value when output disabled
  output dp_rx,
  output dn_rx,

  output pu
);
  // reset detection
  reg [16:0] reset_timer;

  always @(posedge clk) begin
    reset <= 0;

    if (!dp_rx && !dn_rx) begin
      // SE0 detected from host
      if (reset_timer > 30000) begin
        // timer expired, assert reset
        reset <= 1;
      end else begin
        // timer not expired yet, keep counting
        reset_timer <= reset_timer + 1;
      end

    end else begin
      reset_timer <= 0;
    end
  end

  // SE0 assert on FPGA initialization
  reg [1:0] force_disc_state;
  reg [1:0] force_disc_state_next;

  localparam START = 0;
  localparam FORCE_DISC = 1;
  localparam CONNECTED = 2;
  
  reg [20:0] se0_timer;
  reg ready;
  reg drive_fpga_init_se0;

  always @(posedge clk) begin
    if (ready) begin
      if (se0_timer < 160000) begin
        se0_timer <= se0_timer + 1;
        drive_fpga_init_se0 <= 1;
      end else begin
        drive_fpga_init_se0 <= 0;
      end
    end else begin
      ready <= 1;
      se0_timer <= 0;
      drive_fpga_init_se0 <= 1;
    end
  end

  assign pu = drive_fpga_init_se0 ? 1'b0 : 1'b1;

  assign dp = drive_fpga_init_se0 ? 1'b0 : (oe ? dp_tx : 1'bz);
  assign dn = drive_fpga_init_se0 ? 1'b0 : (oe ? dn_tx : 1'bz);
  assign dp_rx = (oe || drive_fpga_init_se0) ? 1 : dp;
  assign dn_rx = (oe || drive_fpga_init_se0) ? 0 : dn;
endmodule
