`include "top_tb_header.vh"
  initial begin
    prepare_spi_xfer(
      /* MOSI */ {32'hcafebabe, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 
                                8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 
                                8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 
                                8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00}, 
      /* MISO */ {32'h00000000, 8'h01, 8'h02, 8'h03, 8'h04, 8'h05, 8'h06, 8'h07, 8'h08, 8'h09, 8'h0a, 8'h0b, 8'h0c, 8'h0d, 8'h0e, 8'h0f, 8'h10, 
                                8'h11, 8'h12, 8'h13, 8'h14, 8'h15, 8'h16, 8'h17, 8'h18, 8'h19, 8'h1a, 8'h1b, 8'h1c, 8'h1d, 8'h1e, 8'h1f, 8'h20, 
                                8'h21, 8'h22, 8'h23, 8'h24, 8'h25, 8'h26, 8'h27, 8'h28, 8'h29, 8'h2a, 8'h2b, 8'h2c, 8'h2d, 8'h2e, 8'h2f, 8'h30, 
                                8'h31, 8'h32, 8'h33, 8'h34, 8'h35, 8'h36, 8'h37, 8'h38, 8'h39, 8'h3a, 8'h3b, 8'h3c, 8'h3d, 8'h3e, 8'h3f, 8'h40}, 
      /* Length */ 544
    );

    send_usb_out(0, 1);
    send_usb_data0({8'hbe, 8'hba, 8'hfe, 8'hca, 8'h00, 8'h40, 8'h00, 8'h04, 8'h01}, 9 * 8);
    expect_usb_ack();

    send_usb_in(0, 1);
    expect_usb_nak();
    
    send_usb_in(0, 1);
    expect_usb_nak();
    
    send_usb_in(0, 1);
    expect_usb_data0({8'h20, 8'h1f, 8'h1e, 8'h1d, 8'h1c, 8'h1b, 8'h1a, 8'h19, 8'h18, 8'h17, 8'h16, 8'h15, 8'h14, 8'h13, 8'h12, 8'h11,
                      8'h10, 8'h0f, 8'h0e, 8'h0d, 8'h0c, 8'h0b, 8'h0a, 8'h09, 8'h08, 8'h07, 8'h06, 8'h05, 8'h04, 8'h03, 8'h02, 8'h01}, 256);
    send_usb_ack();
    
    send_usb_in(0, 1);
    expect_usb_nak();
    
    send_usb_in(0, 1);
    expect_usb_nak();


    send_usb_in(0, 1);
    expect_usb_data1({8'h40, 8'h3f, 8'h3e, 8'h3d, 8'h3c, 8'h3b, 8'h3a, 8'h39, 8'h38, 8'h37, 8'h36, 8'h35, 8'h34, 8'h33, 8'h32, 8'h31,
                      8'h30, 8'h2f, 8'h2e, 8'h2d, 8'h2c, 8'h2b, 8'h2a, 8'h29, 8'h28, 8'h27, 8'h26, 8'h25, 8'h24, 8'h23, 8'h22, 8'h21}, 256);
    send_usb_ack();


    send_usb_in(0, 1);
    expect_usb_nak();

    $finish(0);
  end
`include "top_tb_footer.vh"
