`include "top_tb_header.vh"
  initial begin

    //Tap generator needs to know the number of tests beforehand
    vtg.set_numtests(3);

    /* File name can be set here to have a unique name for each
     target. Using this will however not allow run-time settings with
     the --tapfile= command-line argument */
    
    //vtg.set_file("simple_spi_in_test.tap");
     

    prepare_spi_xfer(
      /* MOSI */ {8'h81, 8'h00}, 
      /* MISO */ {8'h00, 8'h65}, 
      /* Length */ 16
    );

    send_usb_out(0, 1);
    send_usb_data0({8'h81, 8'h00, 8'h01, 8'h00, 8'h01, 8'h01}, 6 * 8);
    expect_usb_ack();

    /* We will only reach here if not the assert inside
     expect_usb_ack triggered. This means that successful runs will
     list all three ok lines in the tap file, while failed ones will
     only display as many lines as we have reached.
     
     As an alternative, we could let expect_usb_ack and friends set 
     an error signal instead of exit and use
     vtg.write_tc("6 bytes sent and acknowledged", !error); to
     continue running after a failed subtest. Of course, this only
     makes sense if there is a point to keep running after one subtest
     failed */

    //Arbitrary chosen string as I don't really know what you test :)
    vtg.ok("6 bytes sent and acknowledged");

    #10000000;

    send_usb_in(0, 1);
    expect_usb_data0({8'h65}, 8);
    send_usb_ack();

    vtg.ok("1 bytes sent and acknowledged");

    #10000000;

    send_usb_in(0, 1);
    expect_usb_nak();

    vtg.ok("Received nak");
    $finish(0);
  end
`include "top_tb_footer.vh"
