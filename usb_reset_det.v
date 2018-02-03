// detects USB port reset signal from host
module usb_reset_det (
  input clk,
  output reg reset,

  input usb_p_rx,
  input usb_n_rx
);
  // reset detection
  reg [16:0] reset_timer;

  always @(posedge clk) begin
    reset <= 0;

    if (!usb_p_rx && !usb_n_rx) begin
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
endmodule
