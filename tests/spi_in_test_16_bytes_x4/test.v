`include "top_tb_header.vh"
  initial begin
    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07, 8'h08, 8'h09, 8'h10, 8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16}, 
      /* Length */ 160
    );

    send_usb_out(0, 1);
    send_usb_data0({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h10, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data0({8'h16, 8'h15, 8'h14, 8'h13, 8'h12, 8'h11, 8'h10, 8'h09, 8'h08, 8'h07, 8'h06, 8'h05, 8'h04, 8'h03, 8'h02, 8'h01}, 128);
    send_usb_ack();

    #10000000;

    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h30, 8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36}, 
      /* Length */ 160
    );

    send_usb_out(0, 1);
    send_usb_data1({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h10, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data1({8'h36, 8'h35, 8'h34, 8'h33, 8'h32, 8'h31, 8'h30, 8'h29, 8'h28, 8'h27, 8'h26, 8'h25, 8'h24, 8'h23, 8'h22, 8'h21}, 128);
    send_usb_ack();

    #10000000;
    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h41, 8'h42, 8'h43, 8'h44, 8'h45, 8'h46, 8'h47, 8'h48, 8'h49, 8'h50, 8'h51, 8'h52, 8'h53, 8'h54, 8'h55, 8'h56}, 
      /* Length */ 160
    );

    send_usb_out(0, 1);
    send_usb_data0({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h10, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data0({8'h56, 8'h55, 8'h54, 8'h53, 8'h52, 8'h51, 8'h50, 8'h49, 8'h48, 8'h47, 8'h46, 8'h45, 8'h44, 8'h43, 8'h42, 8'h41}, 128);
    send_usb_ack();

    #10000000;

    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h61, 8'h62, 8'h63, 8'h64, 8'h65, 8'h66, 8'h67, 8'h68, 8'h69, 8'h70, 8'h71, 8'h72, 8'h73, 8'h74, 8'h75, 8'h76}, 
      /* Length */ 160
    );

    send_usb_out(0, 1);
    send_usb_data1({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h10, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data1({8'h76, 8'h75, 8'h74, 8'h73, 8'h72, 8'h71, 8'h70, 8'h69, 8'h68, 8'h67, 8'h66, 8'h65, 8'h64, 8'h63, 8'h62, 8'h61}, 128);
    send_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_nak();

    $finish(0);
  end
`include "top_tb_footer.vh"
