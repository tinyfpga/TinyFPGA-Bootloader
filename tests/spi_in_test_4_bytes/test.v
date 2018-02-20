`include "../top_tb_header.vh"
  initial begin
    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 32'h00000000}, 
      /* MISO */ {32'h00000000, 32'h57acca70}, 
      /* Length */ 64
    );

    send_usb_out(0, 1);
    send_usb_data0({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h04, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data0({8'h70, 8'hca, 8'hac, 8'h57}, 32);
    send_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_nak();

    $finish(0);
  end
`include "../top_tb_footer.vh"
