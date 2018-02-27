`include "top_tb_header.vh"
  initial begin
    prepare_spi_xfer(
      /* MOSI */ {8'h81, 8'h00}, 
      /* MISO */ {8'h00, 8'h65}, 
      /* Length */ 16
    );

    send_usb_out(0, 1);
    send_usb_data0({8'h81, 8'h00, 8'h01, 8'h00, 8'h01, 8'h01}, 6 * 8);
    expect_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data0({8'h65}, 8);
    send_usb_ack();

    #10000000;

    send_usb_in(0, 1);
    expect_usb_nak();

    $finish(0);
  end
`include "top_tb_footer.vh"
