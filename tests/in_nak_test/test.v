`include "../top_tb_header.vh"
  initial begin
    send_usb_in(0, 1);
    expect_usb_nak();
    $finish(0);
  end
`include "../top_tb_footer.vh"
