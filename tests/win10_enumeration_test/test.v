`include "top_tb_header.vh"
  initial begin
    #1000000;
    send_usb_port_reset();
    #1000000;

    ///////////////////////////////////
    // setup stage
    send_usb_setup(0, 0); 
    send_usb_data0({8'h00, 8'h40, 8'h00, 8'h00, 8'h01, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(0, 0);
    expect_usb_data1(
      {8'h01, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h61, 8'h30, 8'h1d, 
       8'h50, 8'h20, 8'h00, 8'h00, 8'h02, 8'h02, 8'h00, 8'h01, 8'h12}, 18 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(0, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();
    
    $display("LOCATION: %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    send_usb_port_reset();
    #1000000;


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    send_usb_address_device(8'h00, 8'h1e);


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h40, 8'h00, 8'h00, 8'h01, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1(
      {8'h01, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h61, 8'h30, 8'h1d, 
       8'h50, 8'h20, 8'h00, 8'h00, 8'h02, 8'h02, 8'h00, 8'h01, 8'h12}, 18 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'hFF, 8'h00, 8'h00, 8'h02, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1(
      {8'h06, 8'h02, 8'h24, 8'h04, 8'h01, 8'h00, 8'h01, 8'h24, 
       8'h05, 8'h01, 8'h10, 8'h00, 8'h24, 8'h05, 8'h00, 8'h01, 
       8'h02, 8'h02, 8'h01, 8'h00, 8'h00, 8'h04, 8'h09, 8'h32, 
       8'hC0, 8'h00, 8'h01, 8'h02, 8'h00, 8'h43, 8'h02, 8'h09}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data0(
      {8'h02, 8'h81, 8'h05, 8'h07, 8'h00, 8'h00, 8'h20, 8'h02, 
       8'h01, 8'h05, 8'h07, 8'h00, 8'h00, 8'h00, 8'h0A, 8'h02, 
       8'h00, 8'h01, 8'h04, 8'h09, 8'h40, 8'h00, 8'h08, 8'h03, 
       8'h82, 8'h05, 8'h07, 8'h01, 8'h00, 8'h06, 8'h24, 8'h05}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data1({8'h00, 8'h00, 8'h20}, 3 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h0A, 8'h00, 8'h00, 8'h06, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_stall();
    send_usb_ack();

    // status stage
    //send_usb_out(30, 0);
    //send_usb_data1(0, 0);
    //expect_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h12, 8'h00, 8'h00, 8'h01, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1(
      {8'h01, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h61, 8'h30, 8'h1d, 
       8'h50, 8'h20, 8'h00, 8'h00, 8'h02, 8'h02, 8'h00, 8'h01, 8'h12}, 18 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h09, 8'h00, 8'h00, 8'h02, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1({8'h32, 8'hC0, 8'h00, 8'h01, 8'h02, 8'h00, 8'h43, 8'h02, 8'h09}, 9 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h43, 8'h00, 8'h00, 8'h02, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1(
      {8'h06, 8'h02, 8'h24, 8'h04, 8'h01, 8'h00, 8'h01, 8'h24, 
       8'h05, 8'h01, 8'h10, 8'h00, 8'h24, 8'h05, 8'h00, 8'h01, 
       8'h02, 8'h02, 8'h01, 8'h00, 8'h00, 8'h04, 8'h09, 8'h32, 
       8'hC0, 8'h00, 8'h01, 8'h02, 8'h00, 8'h43, 8'h02, 8'h09}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data0(
      {8'h02, 8'h81, 8'h05, 8'h07, 8'h00, 8'h00, 8'h20, 8'h02, 
       8'h01, 8'h05, 8'h07, 8'h00, 8'h00, 8'h00, 8'h0A, 8'h02, 
       8'h00, 8'h01, 8'h04, 8'h09, 8'h40, 8'h00, 8'h08, 8'h03, 
       8'h82, 8'h05, 8'h07, 8'h01, 8'h00, 8'h06, 8'h24, 8'h05}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data1({8'h00, 8'h00, 8'h20}, 3 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h01, 8'h09, 8'h00, 8'h00, 8'h02, 8'h00, 8'h06, 8'h80}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1(
      {8'h06, 8'h02, 8'h24, 8'h04, 8'h01, 8'h00, 8'h01, 8'h24, 
       8'h05, 8'h01, 8'h10, 8'h00, 8'h24, 8'h05, 8'h00, 8'h01, 
       8'h02, 8'h02, 8'h01, 8'h00, 8'h00, 8'h04, 8'h09, 8'h32, 
       8'hC0, 8'h00, 8'h01, 8'h02, 8'h00, 8'h43, 8'h02, 8'h09}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data0(
      {8'h02, 8'h81, 8'h05, 8'h07, 8'h00, 8'h00, 8'h20, 8'h02, 
       8'h01, 8'h05, 8'h07, 8'h00, 8'h00, 8'h00, 8'h0A, 8'h02, 
       8'h00, 8'h01, 8'h04, 8'h09, 8'h40, 8'h00, 8'h08, 8'h03, 
       8'h82, 8'h05, 8'h07, 8'h01, 8'h00, 8'h06, 8'h24, 8'h05}, 32 * 8);
    send_usb_ack();

    send_usb_in(30, 0);
    expect_usb_data1({8'h00, 8'h00, 8'h20}, 3 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    $display("    %s:%d", `__FILE__, `__LINE__);
    send_usb_data0({8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h01, 8'h09, 8'h00}, 64);
    $display("    %s:%d", `__FILE__, `__LINE__);
    expect_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    // status stage
    send_usb_in(30, 0);
    $display("    %s:%d", `__FILE__, `__LINE__);
    expect_usb_data1(0, 0);
    $display("    %s:%d", `__FILE__, `__LINE__);
    send_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h07, 8'h00, 8'h00, 8'h00, 8'h00, 8'h21, 8'hA1}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1({8'h08, 8'h00, 8'h01, 8'h00, 8'h00, 8'h25, 8'h80}, 7 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();


    $display("    %s:%d", `__FILE__, `__LINE__);
    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h22, 8'h21}, 64);
    expect_usb_ack();

    // status stage
    send_usb_in(30, 0);
    expect_usb_data1(0, 0);
    send_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h07, 8'h00, 8'h00, 8'h00, 8'h00, 8'h20, 8'h21}, 64);
    expect_usb_ack();

    // data stage
    send_usb_out(30, 0);
    send_usb_data1({8'h08, 8'h00, 8'h01, 8'h00, 8'h00, 8'h25, 8'h80}, 7 * 8);
    expect_usb_ack();

    // status stage
    send_usb_in(30, 0);
    expect_usb_data1(0, 0);
    send_usb_ack();

    $display("    %s:%d", `__FILE__, `__LINE__);

    ///////////////////////////////////
    // setup stage
    send_usb_setup(30, 0); 
    send_usb_data0({8'h00, 8'h07, 8'h00, 8'h00, 8'h00, 8'h00, 8'h21, 8'hA1}, 64);
    expect_usb_ack();

    // data stage
    send_usb_in(30, 0);
    expect_usb_data1({8'h08, 8'h00, 8'h01, 8'h00, 8'h00, 8'h25, 8'h80}, 7 * 8);
    send_usb_ack();

    // status stage
    send_usb_out(30, 0);
    send_usb_data1(0, 0);
    expect_usb_ack();

    $finish(0);
  end
`include "top_tb_footer.vh"
