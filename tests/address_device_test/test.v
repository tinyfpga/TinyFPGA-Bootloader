`include "top_tb_header.vh"
  initial begin
    send_usb_address_device(8'h00, 8'h1e);
    `assert("new device address", dut.dev_addr, 7'h1e);

    $finish(0);
  end
`include "top_tb_footer.vh"
