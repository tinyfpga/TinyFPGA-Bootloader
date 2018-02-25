`include "../top_tb_header.vh"
  initial begin
    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07, 8'h08, 8'h09, 8'h10, 8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16}, 
      /* Length */ 160
    );

    send_usb_out(0, 1);
    send_usb_data0({8'h00, 8'h10, 8'h00, 8'h04, 8'h01}, 5 * 8);
    expect_usb_ack();

    send_usb_out(0, 1);
    send_usb_data1({8'hbe, 8'hba, 8'hfe, 8'hca}, 4 * 8);
    expect_usb_ack();


    send_usb_in(0, 1);
    expect_usb_nak();


    send_usb_in(0, 1);
    expect_usb_data0({8'h16, 8'h15, 8'h14, 8'h13, 8'h12, 8'h11, 8'h10, 8'h09, 8'h08, 8'h07, 8'h06, 8'h05, 8'h04, 8'h03, 8'h02, 8'h01}, 128);
    send_usb_ack();


    send_usb_in(0, 1);
    expect_usb_nak();

    $finish(0);
  end
`include "../top_tb_footer.vh"
