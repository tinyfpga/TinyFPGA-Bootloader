// Verilog netlist produced by program LSE :  version Diamond Version 0.0.0
// Netlist written on Mon Feb 19 15:07:14 2018
//
// Verilog Description of module bootloader
//

module bootloader (pin_clk, pin_usbp, pin_usbn, pin_pu, pin_led, pin_29_miso, 
            pin_30_cs, pin_31_mosi, pin_32_sck) /* synthesis syn_module_defined=1 */ ;   // ../bootloader.v(1[8:18])
    input pin_clk /* synthesis black_box_pad_pin=1 */ ;   // ../bootloader.v(2[10:17])
    inout pin_usbp;   // ../bootloader.v(4[10:18])
    inout pin_usbn;   // ../bootloader.v(5[10:18])
    output pin_pu;   // ../bootloader.v(6[10:16])
    output pin_led;   // ../bootloader.v(8[10:17])
    input pin_29_miso;   // ../bootloader.v(10[10:21])
    output pin_30_cs;   // ../bootloader.v(11[10:19])
    output pin_31_mosi;   // ../bootloader.v(12[10:21])
    output pin_32_sck;   // ../bootloader.v(13[10:20])
    
    wire pin_clk /* synthesis is_clock=1 */ ;   // ../bootloader.v(2[10:17])
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    
    wire GND_net, VCC_net, pin_led_c, pin_29_miso_c, pin_30_cs_c, 
        pin_31_mosi_c, pin_32_sck_c, boot, usb_p_tx, usb_n_tx, usb_tx_en, 
        n1292, n1289, n11551, n4;
    wire [9:0]\raw_setup_data[6] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    wire [7:0]bytes_sent;   // ../../../common/usb_serial_ctrl_ep.v(118[13:23])
    
    wire n11542, n12036, n8, pin_usbn_out, n12030, n12027, n14, 
        n4095;
    wire [1:0]\ep_state[0]_adj_2153 ;   // ../../../common/usb_fs_out_pe.v(55[13:21])
    wire [4:0]\ep_get_addr[1] ;   // ../../../common/usb_fs_out_pe.v(99[13:24])
    wire [4:0]\ep_get_addr[0] ;   // ../../../common/usb_fs_out_pe.v(99[13:24])
    wire [5:0]ep_state_next_0__1__N_1331;
    
    wire ep_state_next_1__1__N_1228, n10912, n12, n10, n8_adj_2095, 
        n12020, n8_adj_2096, n4_adj_2097, n11500, n11498, pin_usbp_out, 
        n6, n4_adj_2098, n11489, n12101, n12100, n12099, n12098, 
        n12049;
    
    VCC i2 (.Y(VCC_net));
    SB_WARMBOOT warmboot_inst (.BOOT(boot), .S1(GND_net), .S0(VCC_net)) /* synthesis syn_instantiated=1 */ ;
    SB_IO pin_led_pad (.PACKAGE_PIN(pin_led), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(pin_led_c));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_led_pad.PIN_TYPE = 6'b011001;
    defparam pin_led_pad.PULLUP = 1'b0;
    defparam pin_led_pad.NEG_TRIGGER = 1'b0;
    defparam pin_led_pad.IO_STANDARD = "SB_LVCMOS";
    SB_PLL40_PAD usb_pll_inst (.PACKAGEPIN(pin_clk), .PLLOUTCORE(clk_48mhz), 
            .BYPASS(GND_net), .RESETB(VCC_net)) /* synthesis syn_instantiated=1 */ ;
    defparam usb_pll_inst.FEEDBACK_PATH = "SIMPLE";
    defparam usb_pll_inst.DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED";
    defparam usb_pll_inst.DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED";
    defparam usb_pll_inst.SHIFTREG_DIV_MODE = 2'b00;
    defparam usb_pll_inst.FDA_FEEDBACK = 4'b0000;
    defparam usb_pll_inst.FDA_RELATIVE = 4'b0000;
    defparam usb_pll_inst.PLLOUT_SELECT = "GENCLK";
    defparam usb_pll_inst.DIVR = 4'b0000;
    defparam usb_pll_inst.DIVF = 7'b0111111;
    defparam usb_pll_inst.DIVQ = 3'b100;
    defparam usb_pll_inst.FILTER_RANGE = 3'b001;
    defparam usb_pll_inst.ENABLE_ICEGATE = 1'b0;
    defparam usb_pll_inst.TEST_MODE = 1'b0;
    defparam usb_pll_inst.EXTERNAL_DIVIDE_FACTOR = 1;
    SB_LUT4 LessThan_848_i4_4_lut (.I0(\ep_get_addr[0] [1]), .I1(\ep_get_addr[0] [0]), 
            .I2(ep_state_next_0__1__N_1331[1]), .I3(ep_state_next_0__1__N_1331[0]), 
            .O(n4));   // ../../../common/usb_fs_out_pe.v(180[19:77])
    defparam LessThan_848_i4_4_lut.LUT_INIT = 16'he8fa;
    SB_LUT4 LessThan_848_i10_4_lut (.I0(n4), .I1(n8), .I2(n12030), .I3(n11542), 
            .O(n1292));   // ../../../common/usb_fs_out_pe.v(180[19:77])
    defparam LessThan_848_i10_4_lut.LUT_INIT = 16'haccc;
    SB_IO pin_pu_pad (.PACKAGE_PIN(pin_pu), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(VCC_net));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_pu_pad.PIN_TYPE = 6'b011001;
    defparam pin_pu_pad.PULLUP = 1'b0;
    defparam pin_pu_pad.NEG_TRIGGER = 1'b0;
    defparam pin_pu_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_usbn_pad (.PACKAGE_PIN(pin_usbn), .OUTPUT_ENABLE(usb_tx_en), 
          .D_OUT_0(usb_n_tx), .D_IN_0(pin_usbn_out));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_usbn_pad.PIN_TYPE = 6'b101001;
    defparam pin_usbn_pad.PULLUP = 1'b0;
    defparam pin_usbn_pad.NEG_TRIGGER = 1'b0;
    defparam pin_usbn_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_30_cs_pad (.PACKAGE_PIN(pin_30_cs), .OUTPUT_ENABLE(VCC_net), 
          .D_OUT_0(pin_30_cs_c));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_30_cs_pad.PIN_TYPE = 6'b011001;
    defparam pin_30_cs_pad.PULLUP = 1'b0;
    defparam pin_30_cs_pad.NEG_TRIGGER = 1'b0;
    defparam pin_30_cs_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_usbp_pad (.PACKAGE_PIN(pin_usbp), .OUTPUT_ENABLE(usb_tx_en), 
          .D_OUT_0(usb_p_tx), .D_IN_0(pin_usbp_out));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_usbp_pad.PIN_TYPE = 6'b101001;
    defparam pin_usbp_pad.PULLUP = 1'b0;
    defparam pin_usbp_pad.NEG_TRIGGER = 1'b0;
    defparam pin_usbp_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_31_mosi_pad (.PACKAGE_PIN(pin_31_mosi), .OUTPUT_ENABLE(VCC_net), 
          .D_OUT_0(pin_31_mosi_c));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_31_mosi_pad.PIN_TYPE = 6'b011001;
    defparam pin_31_mosi_pad.PULLUP = 1'b0;
    defparam pin_31_mosi_pad.NEG_TRIGGER = 1'b0;
    defparam pin_31_mosi_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_32_sck_pad (.PACKAGE_PIN(pin_32_sck), .OUTPUT_ENABLE(VCC_net), 
          .D_OUT_0(pin_32_sck_c));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_32_sck_pad.PIN_TYPE = 6'b011001;
    defparam pin_32_sck_pad.PULLUP = 1'b0;
    defparam pin_32_sck_pad.NEG_TRIGGER = 1'b0;
    defparam pin_32_sck_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO pin_29_miso_pad (.PACKAGE_PIN(pin_29_miso), .OUTPUT_ENABLE(VCC_net), 
          .D_IN_0(pin_29_miso_c));   // C:/lscc/iCEcube2.2017.01/LSE/userware/NT/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam pin_29_miso_pad.PIN_TYPE = 6'b000001;
    defparam pin_29_miso_pad.PULLUP = 1'b0;
    defparam pin_29_miso_pad.NEG_TRIGGER = 1'b0;
    defparam pin_29_miso_pad.IO_STANDARD = "SB_LVCMOS";
    GND i1 (.Y(GND_net));
    SB_LUT4 LessThan_845_i4_4_lut (.I0(bytes_sent[0]), .I1(bytes_sent[1]), 
            .I2(\raw_setup_data[6] [1]), .I3(\raw_setup_data[6] [0]), .O(n4_adj_2098));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i4_4_lut.LUT_INIT = 16'h8ecf;
    SB_LUT4 i10211_4_lut (.I0(n12101), .I1(n12100), .I2(n12098), .I3(n11489), 
            .O(n11498));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam i10211_4_lut.LUT_INIT = 16'h1011;
    SB_LUT4 LessThan_845_i14_4_lut (.I0(n4_adj_2098), .I1(n12), .I2(n12099), 
            .I3(n11500), .O(n14));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i14_4_lut.LUT_INIT = 16'hcacc;
    SB_LUT4 LessThan_845_i16_4_lut (.I0(n8_adj_2095), .I1(n14), .I2(n12099), 
            .I3(n11498), .O(n1289));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i16_4_lut.LUT_INIT = 16'hcacc;
    SB_LUT4 i10264_4_lut (.I0(n12036), .I1(n12049), .I2(\ep_get_addr[1] [2]), 
            .I3(n10912), .O(n11551));   // ../../../common/usb_fs_out_pe.v(180[19:77])
    defparam i10264_4_lut.LUT_INIT = 16'h0880;
    SB_LUT4 LessThan_851_i4_4_lut (.I0(\ep_get_addr[1] [1]), .I1(\ep_get_addr[1] [0]), 
            .I2(ep_state_next_0__1__N_1331[1]), .I3(ep_state_next_0__1__N_1331[0]), 
            .O(n4_adj_2097));   // ../../../common/usb_fs_out_pe.v(180[19:77])
    defparam LessThan_851_i4_4_lut.LUT_INIT = 16'he8fa;
    SB_LUT4 i1_4_lut (.I0(n4_adj_2097), .I1(n12027), .I2(n8_adj_2096), 
            .I3(n11551), .O(ep_state_next_1__1__N_1228));
    defparam i1_4_lut.LUT_INIT = 16'h88c0;
    SB_LUT4 i10202_3_lut_4_lut (.I0(\raw_setup_data[6] [3]), .I1(bytes_sent[3]), 
            .I2(bytes_sent[2]), .I3(\raw_setup_data[6] [2]), .O(n11489));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam i10202_3_lut_4_lut.LUT_INIT = 16'h9009;
    SB_LUT4 LessThan_845_i6_3_lut_3_lut (.I0(\raw_setup_data[6] [3]), .I1(bytes_sent[3]), 
            .I2(bytes_sent[2]), .I3(GND_net), .O(n6));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i6_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 LessThan_845_i10_3_lut_3_lut (.I0(\raw_setup_data[6] [6]), .I1(bytes_sent[6]), 
            .I2(bytes_sent[5]), .I3(GND_net), .O(n10));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i10_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 i10213_2_lut_3_lut_4_lut (.I0(\raw_setup_data[6] [6]), .I1(bytes_sent[6]), 
            .I2(bytes_sent[5]), .I3(\raw_setup_data[6] [5]), .O(n11500));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam i10213_2_lut_3_lut_4_lut.LUT_INIT = 16'h9009;
    SB_LUT4 LessThan_845_i13_2_lut_rep_260 (.I0(\raw_setup_data[6] [6]), .I1(bytes_sent[6]), 
            .I2(GND_net), .I3(GND_net), .O(n12101));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i13_2_lut_rep_260.LUT_INIT = 16'h6666;
    SB_LUT4 LessThan_845_i11_2_lut_rep_259 (.I0(\raw_setup_data[6] [5]), .I1(bytes_sent[5]), 
            .I2(GND_net), .I3(GND_net), .O(n12100));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i11_2_lut_rep_259.LUT_INIT = 16'h6666;
    SB_LUT4 LessThan_845_i12_3_lut_3_lut (.I0(\raw_setup_data[6] [7]), .I1(bytes_sent[7]), 
            .I2(n10), .I3(GND_net), .O(n12));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i12_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 LessThan_845_i15_2_lut_rep_258 (.I0(\raw_setup_data[6] [7]), .I1(bytes_sent[7]), 
            .I2(GND_net), .I3(GND_net), .O(n12099));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i15_2_lut_rep_258.LUT_INIT = 16'h6666;
    SB_LUT4 LessThan_845_i8_3_lut_3_lut (.I0(\raw_setup_data[6] [4]), .I1(bytes_sent[4]), 
            .I2(n6), .I3(GND_net), .O(n8_adj_2095));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i8_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 LessThan_845_i9_2_lut_rep_257 (.I0(\raw_setup_data[6] [4]), .I1(bytes_sent[4]), 
            .I2(GND_net), .I3(GND_net), .O(n12098));   // ../../../common/usb_serial_ctrl_ep.v(99[5:28])
    defparam LessThan_845_i9_2_lut_rep_257.LUT_INIT = 16'h6666;
    SB_LUT4 i10403_3_lut_4_lut (.I0(n1292), .I1(n12027), .I2(\ep_state[0]_adj_2153 [1]), 
            .I3(\ep_state[0]_adj_2153 [0]), .O(n4095));
    defparam i10403_3_lut_4_lut.LUT_INIT = 16'h007f;
    SB_LUT4 i2_3_lut_rep_179_4_lut (.I0(n1292), .I1(n12027), .I2(\ep_state[0]_adj_2153 [1]), 
            .I3(\ep_state[0]_adj_2153 [0]), .O(n12020));
    defparam i2_3_lut_rep_179_4_lut.LUT_INIT = 16'h0070;
    tinyfpga_bootloader tinyfpga_bootloader_inst (.GND_net(GND_net), .VCC_net(VCC_net), 
            .clk_48mhz(clk_48mhz), .pin_led_c(pin_led_c), .pin_31_mosi_c(pin_31_mosi_c), 
            .pin_29_miso_c(pin_29_miso_c), .boot(boot), .pin_32_sck_c(pin_32_sck_c), 
            .pin_30_cs_c(pin_30_cs_c), .usb_n_tx(usb_n_tx), .usb_tx_en(usb_tx_en), 
            .usb_p_tx(usb_p_tx), .pin_usbn_out(pin_usbn_out), .pin_usbp_out(pin_usbp_out), 
            .n4095(n4095), .n12027(n12027), .n12036(n12036), .n12030(n12030), 
            .\ep_state[0] ({\ep_state[0]_adj_2153 }), .n1292(n1292), .\ep_get_addr[0][0] (\ep_get_addr[0] [0]), 
            .n12020(n12020), .\ep_state_next_0__1__N_1331[1] (ep_state_next_0__1__N_1331[1]), 
            .n10912(n10912), .\ep_get_addr[1][2] (\ep_get_addr[1] [2]), 
            .\ep_get_addr[0][1] (\ep_get_addr[0] [1]), .\ep_get_addr[1][1] (\ep_get_addr[1] [1]), 
            .\ep_get_addr[1][0] (\ep_get_addr[1] [0]), .\ep_state_next_0__1__N_1331[0] (ep_state_next_0__1__N_1331[0]), 
            .n11542(n11542), .n8(n8_adj_2096), .n8_adj_3(n8), .ep_state_next_1__1__N_1228(ep_state_next_1__1__N_1228), 
            .n12049(n12049), .n1289(n1289), .bytes_sent({bytes_sent}), 
            .\raw_setup_data[6][3] (\raw_setup_data[6] [3]), .\raw_setup_data[6][2] (\raw_setup_data[6] [2]), 
            .\raw_setup_data[6][7] (\raw_setup_data[6] [7]), .\raw_setup_data[6][6] (\raw_setup_data[6] [6]), 
            .\raw_setup_data[6][0] (\raw_setup_data[6] [0]), .\raw_setup_data[6][4] (\raw_setup_data[6] [4]), 
            .\raw_setup_data[6][5] (\raw_setup_data[6] [5]), .\raw_setup_data[6][1] (\raw_setup_data[6] [1])) /* synthesis syn_module_defined=1 */ ;   // ../bootloader.v(86[23] 100[4])
    
endmodule
//
// Verilog Description of module tinyfpga_bootloader
//

module tinyfpga_bootloader (GND_net, VCC_net, clk_48mhz, pin_led_c, 
            pin_31_mosi_c, pin_29_miso_c, boot, pin_32_sck_c, pin_30_cs_c, 
            usb_n_tx, usb_tx_en, usb_p_tx, pin_usbn_out, pin_usbp_out, 
            n4095, n12027, n12036, n12030, \ep_state[0] , n1292, 
            \ep_get_addr[0][0] , n12020, \ep_state_next_0__1__N_1331[1] , 
            n10912, \ep_get_addr[1][2] , \ep_get_addr[0][1] , \ep_get_addr[1][1] , 
            \ep_get_addr[1][0] , \ep_state_next_0__1__N_1331[0] , n11542, 
            n8, n8_adj_3, ep_state_next_1__1__N_1228, n12049, n1289, 
            bytes_sent, \raw_setup_data[6][3] , \raw_setup_data[6][2] , 
            \raw_setup_data[6][7] , \raw_setup_data[6][6] , \raw_setup_data[6][0] , 
            \raw_setup_data[6][4] , \raw_setup_data[6][5] , \raw_setup_data[6][1] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input clk_48mhz;
    output pin_led_c;
    output pin_31_mosi_c;
    input pin_29_miso_c;
    output boot;
    output pin_32_sck_c;
    output pin_30_cs_c;
    output usb_n_tx;
    output usb_tx_en;
    output usb_p_tx;
    input pin_usbn_out;
    input pin_usbp_out;
    input n4095;
    output n12027;
    output n12036;
    output n12030;
    output [1:0]\ep_state[0] ;
    input n1292;
    output \ep_get_addr[0][0] ;
    input n12020;
    output \ep_state_next_0__1__N_1331[1] ;
    output n10912;
    output \ep_get_addr[1][2] ;
    output \ep_get_addr[0][1] ;
    output \ep_get_addr[1][1] ;
    output \ep_get_addr[1][0] ;
    output \ep_state_next_0__1__N_1331[0] ;
    output n11542;
    output n8;
    output n8_adj_3;
    input ep_state_next_1__1__N_1228;
    output n12049;
    input n1289;
    output [7:0]bytes_sent;
    output \raw_setup_data[6][3] ;
    output \raw_setup_data[6][2] ;
    output \raw_setup_data[6][7] ;
    output \raw_setup_data[6][6] ;
    output \raw_setup_data[6][0] ;
    output \raw_setup_data[6][4] ;
    output \raw_setup_data[6][5] ;
    output \raw_setup_data[6][1] ;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    wire [31:0]host_presence_timer;   // ../../../common/tinyfpga_bootloader.v(141[14:33])
    wire [31:0]n1;
    wire [31:0]n133;
    
    wire n9732, n9733, n9731, n9783, n9784, n9707;
    wire [7:0]pwm_cnt;   // ../../../common/tinyfpga_bootloader.v(37[13:20])
    
    wire n9708, n9782;
    wire [7:0]n37;
    
    wire n9706;
    wire [5:0]n46;
    wire [5:0]ns_cnt;   // ../../../common/tinyfpga_bootloader.v(39[13:19])
    
    wire n12075, n9781, n9649, n9650, n9646, n9730, n9780, n9729, 
        n9705, n9779, n9778, n9777, n9704, n9648, n9776, n9775, 
        n9774, n9703, n9728;
    wire [9:0]n57;
    wire [9:0]us_cnt;   // ../../../common/tinyfpga_bootloader.v(49[13:19])
    
    wire n9674, n9773;
    wire [7:0]led_pwm;   // ../../../common/tinyfpga_bootloader.v(36[13:20])
    
    wire n10_adj_2066, n12_adj_2067, n4566, host_presence_timeout, n9673, 
        n4, n9772, n4138, us_rst, n12014, n12019, n12023, n11509, 
        n11518, n12006, n11520, n14_adj_2068, n9727, n8_c, n9771, 
        n9672, n9770, n9769, n9768, n1266, n256;
    wire [8:0]n2809;
    
    wire n9702, count_down, n15_adj_2071, sof_valid, n2820, n9726, 
        n9767, n9671, count_down_N_123, n9766, n9725, n9765, n9724, 
        n9764, n9763, n11999, n9762, n9723, n9761, n9722, n9670;
    wire [8:0]n2798;
    
    wire n9721, n9720, n9647, n9669, n9719, n9668, n9718, n9717, 
        n9667, n9716, n9666, n9715, n9714, n10_adj_2083, n6_adj_2084, 
        n9713, n9712, n9799, n9798, n9711, n9797, n9796, n9795, 
        n9794, n9739, n9738, n9737, n9793, n9710, n9736, n9792, 
        n9709, n9735, n9790, cout, n9789, n9734, n9788, n9787, 
        n9786, n9785, n10_adj_2085, n14_adj_2086, n10_adj_2087, n14_adj_2088, 
        n16_adj_2089, n17_adj_2090;
    wire [2:0]in_ep_req;   // ../../../common/usb_fs_pe.v(37[26:35])
    wire [2:0]in_ep_data_done;   // ../../../common/usb_fs_pe.v(42[26:41])
    wire [1:0]out_ep_grant;   // ../../../common/usb_fs_pe.v(25[28:40])
    
    wire get_cmd_out_data;
    wire [8:0]n115;
    wire [7:0]out_ep_data;   // ../../../common/tinyfpga_bootloader.v(101[14:25])
    wire [7:0]serial_in_ep_data;   // ../../../common/tinyfpga_bootloader.v(133[14:31])
    
    wire spi_byte_in_xfr_ready;
    wire [3:0]in_ep_num_1__N_1088;
    
    wire n11064;
    wire [1:0]out_ep_setup;   // ../../../common/usb_fs_pe.v(27[28:40])
    wire [5:0]ctrl_xfr_state_next_5__N_168;
    
    wire out_ep_data_valid, n12017;
    wire [2:0]in_ep_stall;   // ../../../common/usb_fs_pe.v(43[26:37])
    
    wire in_ep_req_0__N_914;
    wire [2:0]in_ep_data_put;   // ../../../common/usb_fs_pe.v(40[26:40])
    wire [5:0]ctrl_xfr_state;   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    
    wire all_data_sent, n5_adj_2093, n5383, in_q;
    wire [2:0]n1851;
    
    wire n12112;
    wire [5:0]ctrl_xfr_state_next_5__N_150;
    
    wire n3826, n14_adj_2094, n10174;
    wire [6:0]dev_addr;   // ../../../common/tinyfpga_bootloader.v(100[14:22])
    
    wire n12007, n10212, has_data_stage;
    wire [2:0]n1855;
    
    wire status_stage_end, save_dev_addr, n275;
    wire [7:0]ctrl_in_ep_data;   // ../../../common/tinyfpga_bootloader.v(115[14:29])
    
    SB_LUT4 sub_951_inv_0_i24_1_lut (.I0(host_presence_timer[23]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[23]));
    defparam sub_951_inv_0_i24_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 host_presence_timer_1253_add_4_26_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[24]), .I3(n9732), .O(n133[24])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_26_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_26 (.CI(n9732), .I0(GND_net), 
            .I1(host_presence_timer[24]), .CO(n9733));
    SB_LUT4 host_presence_timer_1253_add_4_25_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[23]), .I3(n9731), .O(n133[23])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_25_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_25 (.CI(n9731), .I0(GND_net), 
            .I1(host_presence_timer[23]), .CO(n9732));
    SB_CARRY add_8504_25 (.CI(n9783), .I0(GND_net), .I1(n1[24]), .CO(n9784));
    SB_CARRY pwm_cnt_1252_add_4_8 (.CI(n9707), .I0(GND_net), .I1(pwm_cnt[6]), 
            .CO(n9708));
    SB_CARRY add_8504_24 (.CI(n9782), .I0(VCC_net), .I1(n1[23]), .CO(n9783));
    SB_LUT4 pwm_cnt_1252_add_4_7_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[5]), 
            .I3(n9706), .O(n37[5])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_DFFSR ns_cnt_1251__i0 (.Q(ns_cnt[0]), .C(clk_48mhz), .D(n46[0]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_CARRY pwm_cnt_1252_add_4_7 (.CI(n9706), .I0(GND_net), .I1(pwm_cnt[5]), 
            .CO(n9707));
    SB_CARRY add_8504_23 (.CI(n9781), .I0(VCC_net), .I1(n1[22]), .CO(n9782));
    SB_CARRY ns_cnt_1251_add_4_6 (.CI(n9649), .I0(GND_net), .I1(ns_cnt[4]), 
            .CO(n9650));
    SB_LUT4 ns_cnt_1251_add_4_3_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[1]), 
            .I3(n9646), .O(n46[1])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_24_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[22]), .I3(n9730), .O(n133[22])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_24_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_22 (.CI(n9780), .I0(GND_net), .I1(n1[21]), .CO(n9781));
    SB_CARRY host_presence_timer_1253_add_4_24 (.CI(n9730), .I0(GND_net), 
            .I1(host_presence_timer[22]), .CO(n9731));
    SB_LUT4 host_presence_timer_1253_add_4_23_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[21]), .I3(n9729), .O(n133[21])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_23_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 pwm_cnt_1252_add_4_6_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[4]), 
            .I3(n9705), .O(n37[4])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 sub_951_inv_0_i15_1_lut (.I0(host_presence_timer[14]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[14]));
    defparam sub_951_inv_0_i15_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i25_1_lut (.I0(host_presence_timer[24]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[24]));
    defparam sub_951_inv_0_i25_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY add_8504_21 (.CI(n9779), .I0(VCC_net), .I1(n1[20]), .CO(n9780));
    SB_CARRY add_8504_20 (.CI(n9778), .I0(VCC_net), .I1(n1[19]), .CO(n9779));
    SB_LUT4 ns_cnt_1251_add_4_2_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[0]), 
            .I3(VCC_net), .O(n46[0])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_19 (.CI(n9777), .I0(VCC_net), .I1(n1[18]), .CO(n9778));
    SB_CARRY pwm_cnt_1252_add_4_6 (.CI(n9705), .I0(GND_net), .I1(pwm_cnt[4]), 
            .CO(n9706));
    SB_LUT4 pwm_cnt_1252_add_4_5_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[3]), 
            .I3(n9704), .O(n37[3])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_23 (.CI(n9729), .I0(GND_net), 
            .I1(host_presence_timer[21]), .CO(n9730));
    SB_LUT4 ns_cnt_1251_add_4_5_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[3]), 
            .I3(n9648), .O(n46[3])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_DFFSR ns_cnt_1251__i5 (.Q(ns_cnt[5]), .C(clk_48mhz), .D(n46[5]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_CARRY add_8504_18 (.CI(n9776), .I0(GND_net), .I1(n1[17]), .CO(n9777));
    SB_CARRY add_8504_17 (.CI(n9775), .I0(GND_net), .I1(n1[16]), .CO(n9776));
    SB_DFFSR ns_cnt_1251__i4 (.Q(ns_cnt[4]), .C(clk_48mhz), .D(n46[4]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_CARRY pwm_cnt_1252_add_4_5 (.CI(n9704), .I0(GND_net), .I1(pwm_cnt[3]), 
            .CO(n9705));
    SB_CARRY add_8504_16 (.CI(n9774), .I0(GND_net), .I1(n1[15]), .CO(n9775));
    SB_DFFSR ns_cnt_1251__i3 (.Q(ns_cnt[3]), .C(clk_48mhz), .D(n46[3]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_DFFSR ns_cnt_1251__i2 (.Q(ns_cnt[2]), .C(clk_48mhz), .D(n46[2]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_DFFSR ns_cnt_1251__i1 (.Q(ns_cnt[1]), .C(clk_48mhz), .D(n46[1]), 
            .R(n12075));   // ../../../common/tinyfpga_bootloader.v(45[17:30])
    SB_LUT4 pwm_cnt_1252_add_4_4_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[2]), 
            .I3(n9703), .O(n37[2])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_22_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[20]), .I3(n9728), .O(n133[20])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_22_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8_add_4_11_lut (.I0(GND_net), .I1(us_cnt[9]), .I2(GND_net), 
            .I3(n9674), .O(n57[9])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_11_lut.LUT_INIT = 16'hC33C;
    SB_CARRY pwm_cnt_1252_add_4_4 (.CI(n9703), .I0(GND_net), .I1(pwm_cnt[2]), 
            .CO(n9704));
    SB_CARRY add_8504_15 (.CI(n9773), .I0(VCC_net), .I1(n1[14]), .CO(n9774));
    SB_LUT4 pwm_cnt_7__I_0_i12_3_lut_3_lut (.I0(pwm_cnt[7]), .I1(led_pwm[7]), 
            .I2(n10_adj_2066), .I3(GND_net), .O(n12_adj_2067));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i12_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_DFF host_presence_timeout_50 (.Q(host_presence_timeout), .C(clk_48mhz), 
           .D(n4566));   // ../../../common/tinyfpga_bootloader.v(266[10] 277[6])
    SB_LUT4 add_8_add_4_10_lut (.I0(GND_net), .I1(us_cnt[8]), .I2(GND_net), 
            .I3(n9673), .O(n57[8])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_10_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 pwm_cnt_7__I_0_i4_4_lut (.I0(led_pwm[0]), .I1(led_pwm[1]), .I2(pwm_cnt[1]), 
            .I3(pwm_cnt[0]), .O(n4));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i4_4_lut.LUT_INIT = 16'h0c8e;
    SB_CARRY host_presence_timer_1253_add_4_22 (.CI(n9728), .I0(GND_net), 
            .I1(host_presence_timer[20]), .CO(n9729));
    SB_CARRY add_8504_14 (.CI(n9772), .I0(VCC_net), .I1(n1[13]), .CO(n9773));
    SB_DFFESR us_cnt__i5 (.Q(us_cnt[5]), .C(clk_48mhz), .E(n4138), .D(n57[5]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_LUT4 i10231_4_lut (.I0(n12014), .I1(n12019), .I2(n12023), .I3(n11509), 
            .O(n11518));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam i10231_4_lut.LUT_INIT = 16'h1011;
    SB_LUT4 pwm_cnt_7__I_0_i14_4_lut (.I0(n4), .I1(n12_adj_2067), .I2(n12006), 
            .I3(n11520), .O(n14_adj_2068));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i14_4_lut.LUT_INIT = 16'hcacc;
    SB_LUT4 pwm_cnt_7__I_0_i15_2_lut_rep_165 (.I0(pwm_cnt[7]), .I1(led_pwm[7]), 
            .I2(GND_net), .I3(GND_net), .O(n12006));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i15_2_lut_rep_165.LUT_INIT = 16'h6666;
    SB_LUT4 host_presence_timer_1253_add_4_21_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[19]), .I3(n9727), .O(n133[19])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_21_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8_add_4_10 (.CI(n9673), .I0(us_cnt[8]), .I1(GND_net), 
            .CO(n9674));
    SB_CARRY host_presence_timer_1253_add_4_21 (.CI(n9727), .I0(GND_net), 
            .I1(host_presence_timer[19]), .CO(n9728));
    SB_DFFESR us_cnt__i1 (.Q(us_cnt[1]), .C(clk_48mhz), .E(n4138), .D(n57[1]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_LUT4 pwm_cnt_7__I_0_i16_4_lut (.I0(n8_c), .I1(n14_adj_2068), .I2(n12006), 
            .I3(n11518), .O(pin_led_c));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i16_4_lut.LUT_INIT = 16'hcacc;
    SB_LUT4 sub_951_inv_0_i16_1_lut (.I0(host_presence_timer[15]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[15]));
    defparam sub_951_inv_0_i16_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY add_8504_13 (.CI(n9771), .I0(GND_net), .I1(n1[12]), .CO(n9772));
    SB_LUT4 sub_951_inv_0_i17_1_lut (.I0(host_presence_timer[16]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[16]));
    defparam sub_951_inv_0_i17_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 add_8_add_4_9_lut (.I0(GND_net), .I1(us_cnt[7]), .I2(GND_net), 
            .I3(n9672), .O(n57[7])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 sub_951_inv_0_i18_1_lut (.I0(host_presence_timer[17]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[17]));
    defparam sub_951_inv_0_i18_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY add_8504_12 (.CI(n9770), .I0(VCC_net), .I1(n1[11]), .CO(n9771));
    SB_CARRY add_8504_11 (.CI(n9769), .I0(VCC_net), .I1(n1[10]), .CO(n9770));
    SB_CARRY add_8504_10 (.CI(n9768), .I0(GND_net), .I1(n1[9]), .CO(n9769));
    SB_CARRY add_8_add_4_9 (.CI(n9672), .I0(us_cnt[7]), .I1(GND_net), 
            .CO(n9673));
    SB_DFFE led_pwm_res1_ret1_i0_i1 (.Q(n2809[1]), .C(clk_48mhz), .E(n256), 
            .D(n1266));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_LUT4 pwm_cnt_1252_add_4_3_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[1]), 
            .I3(n9702), .O(n37[1])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_DFF pwm_cnt_1252__i0 (.Q(pwm_cnt[0]), .C(clk_48mhz), .D(n37[0]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_LUT4 i978_1_lut_2_lut (.I0(count_down), .I1(n15_adj_2071), .I2(GND_net), 
            .I3(GND_net), .O(n1266));   // ../../../common/tinyfpga_bootloader.v(78[16] 84[10])
    defparam i978_1_lut_2_lut.LUT_INIT = 16'h7777;
    SB_DFFSR host_presence_timer_1253__i0 (.Q(host_presence_timer[0]), .C(clk_48mhz), 
            .D(n133[0]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFF count_down_46 (.Q(count_down), .C(clk_48mhz), .D(n2820));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_CARRY ns_cnt_1251_add_4_5 (.CI(n9648), .I0(GND_net), .I1(ns_cnt[3]), 
            .CO(n9649));
    SB_DFFESR us_cnt__i0 (.Q(us_cnt[0]), .C(clk_48mhz), .E(n4138), .D(n57[0]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_LUT4 host_presence_timer_1253_add_4_20_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[18]), .I3(n9726), .O(n133[18])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_20_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_9 (.CI(n9767), .I0(GND_net), .I1(n1[8]), .CO(n9768));
    SB_LUT4 sub_951_inv_0_i19_1_lut (.I0(host_presence_timer[18]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[18]));
    defparam sub_951_inv_0_i19_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY pwm_cnt_1252_add_4_3 (.CI(n9702), .I0(GND_net), .I1(pwm_cnt[1]), 
            .CO(n9703));
    SB_LUT4 add_8_add_4_8_lut (.I0(GND_net), .I1(us_cnt[6]), .I2(GND_net), 
            .I3(n9671), .O(n57[6])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1718_4_lut_4_lut (.I0(count_down), .I1(n15_adj_2071), .I2(us_rst), 
            .I3(count_down_N_123), .O(n2820));   // ../../../common/tinyfpga_bootloader.v(78[16] 84[10])
    defparam i1718_4_lut_4_lut.LUT_INIT = 16'hda8a;
    SB_CARRY add_8504_8 (.CI(n9766), .I0(GND_net), .I1(n1[7]), .CO(n9767));
    SB_CARRY host_presence_timer_1253_add_4_20 (.CI(n9726), .I0(GND_net), 
            .I1(host_presence_timer[18]), .CO(n9727));
    SB_LUT4 host_presence_timer_1253_add_4_19_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[17]), .I3(n9725), .O(n133[17])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_19_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_7 (.CI(n9765), .I0(GND_net), .I1(n1[6]), .CO(n9766));
    SB_CARRY host_presence_timer_1253_add_4_19 (.CI(n9725), .I0(GND_net), 
            .I1(host_presence_timer[17]), .CO(n9726));
    SB_LUT4 sub_951_inv_0_i20_1_lut (.I0(host_presence_timer[19]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[19]));
    defparam sub_951_inv_0_i20_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 host_presence_timer_1253_add_4_18_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[16]), .I3(n9724), .O(n133[16])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_18_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_6 (.CI(n9764), .I0(GND_net), .I1(n1[5]), .CO(n9765));
    SB_CARRY add_8504_5 (.CI(n9763), .I0(GND_net), .I1(n1[4]), .CO(n9764));
    SB_LUT4 i259_2_lut_rep_158 (.I0(count_down), .I1(n15_adj_2071), .I2(GND_net), 
            .I3(GND_net), .O(n11999));   // ../../../common/tinyfpga_bootloader.v(78[16] 84[10])
    defparam i259_2_lut_rep_158.LUT_INIT = 16'h8888;
    SB_CARRY host_presence_timer_1253_add_4_18 (.CI(n9724), .I0(GND_net), 
            .I1(host_presence_timer[16]), .CO(n9725));
    SB_CARRY add_8504_4 (.CI(n9762), .I0(GND_net), .I1(n1[3]), .CO(n9763));
    SB_LUT4 host_presence_timer_1253_add_4_17_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[15]), .I3(n9723), .O(n133[15])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_17_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 pwm_cnt_1252_add_4_2_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[0]), 
            .I3(VCC_net), .O(n37[0])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8504_3 (.CI(n9761), .I0(GND_net), .I1(n1[2]), .CO(n9762));
    SB_CARRY add_8504_2 (.CI(GND_net), .I0(n1[0]), .I1(n1[1]), .CO(n9761));
    SB_CARRY pwm_cnt_1252_add_4_2 (.CI(VCC_net), .I0(GND_net), .I1(pwm_cnt[0]), 
            .CO(n9702));
    SB_CARRY host_presence_timer_1253_add_4_17 (.CI(n9723), .I0(GND_net), 
            .I1(host_presence_timer[15]), .CO(n9724));
    SB_CARRY add_8_add_4_8 (.CI(n9671), .I0(us_cnt[6]), .I1(GND_net), 
            .CO(n9672));
    SB_LUT4 sub_951_inv_0_i21_1_lut (.I0(host_presence_timer[20]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[20]));
    defparam sub_951_inv_0_i21_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 host_presence_timer_1253_add_4_16_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[14]), .I3(n9722), .O(n133[14])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_16_lut.LUT_INIT = 16'hC33C;
    SB_DFFESR us_cnt__i6 (.Q(us_cnt[6]), .C(clk_48mhz), .E(n4138), .D(n57[6]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_CARRY host_presence_timer_1253_add_4_16 (.CI(n9722), .I0(GND_net), 
            .I1(host_presence_timer[14]), .CO(n9723));
    SB_LUT4 add_8_add_4_7_lut (.I0(GND_net), .I1(us_cnt[5]), .I2(GND_net), 
            .I3(n9670), .O(n57[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_DFFESR us_cnt__i2 (.Q(us_cnt[2]), .C(clk_48mhz), .E(n4138), .D(n57[2]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_DFFE led_pwm_res1_ret1_i0_i8 (.Q(n2798[0]), .C(clk_48mhz), .E(n256), 
            .D(n11999));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFF pwm_cnt_1252__i1 (.Q(pwm_cnt[1]), .C(clk_48mhz), .D(n37[1]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i2 (.Q(pwm_cnt[2]), .C(clk_48mhz), .D(n37[2]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i3 (.Q(pwm_cnt[3]), .C(clk_48mhz), .D(n37[3]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i4 (.Q(pwm_cnt[4]), .C(clk_48mhz), .D(n37[4]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i5 (.Q(pwm_cnt[5]), .C(clk_48mhz), .D(n37[5]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i6 (.Q(pwm_cnt[6]), .C(clk_48mhz), .D(n37[6]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFF pwm_cnt_1252__i7 (.Q(pwm_cnt[7]), .C(clk_48mhz), .D(n37[7]));   // ../../../common/tinyfpga_bootloader.v(87[42:56])
    SB_DFFSR host_presence_timer_1253__i1 (.Q(host_presence_timer[1]), .C(clk_48mhz), 
            .D(n133[1]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i2 (.Q(host_presence_timer[2]), .C(clk_48mhz), 
            .D(n133[2]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i3 (.Q(host_presence_timer[3]), .C(clk_48mhz), 
            .D(n133[3]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i4 (.Q(host_presence_timer[4]), .C(clk_48mhz), 
            .D(n133[4]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i5 (.Q(host_presence_timer[5]), .C(clk_48mhz), 
            .D(n133[5]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i6 (.Q(host_presence_timer[6]), .C(clk_48mhz), 
            .D(n133[6]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i7 (.Q(host_presence_timer[7]), .C(clk_48mhz), 
            .D(n133[7]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i8 (.Q(host_presence_timer[8]), .C(clk_48mhz), 
            .D(n133[8]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i9 (.Q(host_presence_timer[9]), .C(clk_48mhz), 
            .D(n133[9]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i10 (.Q(host_presence_timer[10]), .C(clk_48mhz), 
            .D(n133[10]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i11 (.Q(host_presence_timer[11]), .C(clk_48mhz), 
            .D(n133[11]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i12 (.Q(host_presence_timer[12]), .C(clk_48mhz), 
            .D(n133[12]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i13 (.Q(host_presence_timer[13]), .C(clk_48mhz), 
            .D(n133[13]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i14 (.Q(host_presence_timer[14]), .C(clk_48mhz), 
            .D(n133[14]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i15 (.Q(host_presence_timer[15]), .C(clk_48mhz), 
            .D(n133[15]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i16 (.Q(host_presence_timer[16]), .C(clk_48mhz), 
            .D(n133[16]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i17 (.Q(host_presence_timer[17]), .C(clk_48mhz), 
            .D(n133[17]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i18 (.Q(host_presence_timer[18]), .C(clk_48mhz), 
            .D(n133[18]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i19 (.Q(host_presence_timer[19]), .C(clk_48mhz), 
            .D(n133[19]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i20 (.Q(host_presence_timer[20]), .C(clk_48mhz), 
            .D(n133[20]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i21 (.Q(host_presence_timer[21]), .C(clk_48mhz), 
            .D(n133[21]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i22 (.Q(host_presence_timer[22]), .C(clk_48mhz), 
            .D(n133[22]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i23 (.Q(host_presence_timer[23]), .C(clk_48mhz), 
            .D(n133[23]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i24 (.Q(host_presence_timer[24]), .C(clk_48mhz), 
            .D(n133[24]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i25 (.Q(host_presence_timer[25]), .C(clk_48mhz), 
            .D(n133[25]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i26 (.Q(host_presence_timer[26]), .C(clk_48mhz), 
            .D(n133[26]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i27 (.Q(host_presence_timer[27]), .C(clk_48mhz), 
            .D(n133[27]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i28 (.Q(host_presence_timer[28]), .C(clk_48mhz), 
            .D(n133[28]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i29 (.Q(host_presence_timer[29]), .C(clk_48mhz), 
            .D(n133[29]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i30 (.Q(host_presence_timer[30]), .C(clk_48mhz), 
            .D(n133[30]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFSR host_presence_timer_1253__i31 (.Q(host_presence_timer[31]), .C(clk_48mhz), 
            .D(n133[31]), .R(sof_valid));   // ../../../common/tinyfpga_bootloader.v(271[30:53])
    SB_DFFE led_pwm_res1_ret0_i0_i1 (.Q(n2798[1]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[0]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i2 (.Q(n2798[2]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[1]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i3 (.Q(n2798[3]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[2]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i4 (.Q(n2798[4]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[3]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i5 (.Q(n2798[5]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[4]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i6 (.Q(n2798[6]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[5]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i7 (.Q(n2798[7]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[6]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_DFFE led_pwm_res1_ret0_i0_i8 (.Q(n2798[8]), .C(clk_48mhz), .E(n256), 
            .D(led_pwm[7]));   // ../../../common/tinyfpga_bootloader.v(70[10] 86[6])
    SB_LUT4 host_presence_timer_1253_add_4_15_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[13]), .I3(n9721), .O(n133[13])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_15_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 sub_951_inv_0_i22_1_lut (.I0(host_presence_timer[21]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[21]));
    defparam sub_951_inv_0_i22_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY host_presence_timer_1253_add_4_15 (.CI(n9721), .I0(GND_net), 
            .I1(host_presence_timer[13]), .CO(n9722));
    SB_LUT4 host_presence_timer_1253_add_4_14_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[12]), .I3(n9720), .O(n133[12])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_14_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 sub_951_inv_0_i26_1_lut (.I0(host_presence_timer[25]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[25]));
    defparam sub_951_inv_0_i26_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY ns_cnt_1251_add_4_3 (.CI(n9646), .I0(GND_net), .I1(ns_cnt[1]), 
            .CO(n9647));
    SB_LUT4 sub_951_inv_0_i27_1_lut (.I0(host_presence_timer[26]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[26]));
    defparam sub_951_inv_0_i27_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i28_1_lut (.I0(host_presence_timer[27]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[27]));
    defparam sub_951_inv_0_i28_1_lut.LUT_INIT = 16'h5555;
    SB_DFFESR us_cnt__i7 (.Q(us_cnt[7]), .C(clk_48mhz), .E(n4138), .D(n57[7]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_DFFESR us_cnt__i3 (.Q(us_cnt[3]), .C(clk_48mhz), .E(n4138), .D(n57[3]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_DFFESR us_cnt__i8 (.Q(us_cnt[8]), .C(clk_48mhz), .E(n4138), .D(n57[8]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_LUT4 sub_951_inv_0_i29_1_lut (.I0(host_presence_timer[28]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[28]));
    defparam sub_951_inv_0_i29_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i30_1_lut (.I0(host_presence_timer[29]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[29]));
    defparam sub_951_inv_0_i30_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i31_1_lut (.I0(host_presence_timer[30]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[30]));
    defparam sub_951_inv_0_i31_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i32_1_lut (.I0(host_presence_timer[31]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[31]));
    defparam sub_951_inv_0_i32_1_lut.LUT_INIT = 16'h5555;
    SB_DFFESR us_cnt__i9 (.Q(us_cnt[9]), .C(clk_48mhz), .E(n4138), .D(n57[9]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_DFFESR us_cnt__i4 (.Q(us_cnt[4]), .C(clk_48mhz), .E(n4138), .D(n57[4]), 
            .R(us_rst));   // ../../../common/tinyfpga_bootloader.v(51[10] 57[6])
    SB_CARRY add_8_add_4_7 (.CI(n9670), .I0(us_cnt[5]), .I1(GND_net), 
            .CO(n9671));
    SB_CARRY host_presence_timer_1253_add_4_14 (.CI(n9720), .I0(GND_net), 
            .I1(host_presence_timer[12]), .CO(n9721));
    SB_LUT4 add_8_add_4_6_lut (.I0(GND_net), .I1(us_cnt[4]), .I2(GND_net), 
            .I3(n9669), .O(n57[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8_add_4_6 (.CI(n9669), .I0(us_cnt[4]), .I1(GND_net), 
            .CO(n9670));
    SB_LUT4 host_presence_timer_1253_add_4_13_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[11]), .I3(n9719), .O(n133[11])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_13_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8_add_4_5_lut (.I0(GND_net), .I1(us_cnt[3]), .I2(GND_net), 
            .I3(n9668), .O(n57[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_13 (.CI(n9719), .I0(GND_net), 
            .I1(host_presence_timer[11]), .CO(n9720));
    SB_LUT4 host_presence_timer_1253_add_4_12_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[10]), .I3(n9718), .O(n133[10])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_12_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_12 (.CI(n9718), .I0(GND_net), 
            .I1(host_presence_timer[10]), .CO(n9719));
    SB_CARRY add_8_add_4_5 (.CI(n9668), .I0(us_cnt[3]), .I1(GND_net), 
            .CO(n9669));
    SB_LUT4 ns_cnt_1251_add_4_4_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[2]), 
            .I3(n9647), .O(n46[2])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_11_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[9]), .I3(n9717), .O(n133[9])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_11_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8_add_4_4_lut (.I0(GND_net), .I1(us_cnt[2]), .I2(GND_net), 
            .I3(n9667), .O(n57[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_11 (.CI(n9717), .I0(GND_net), 
            .I1(host_presence_timer[9]), .CO(n9718));
    SB_LUT4 host_presence_timer_1253_add_4_10_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[8]), .I3(n9716), .O(n133[8])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_10_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8_add_4_4 (.CI(n9667), .I0(us_cnt[2]), .I1(GND_net), 
            .CO(n9668));
    SB_CARRY host_presence_timer_1253_add_4_10 (.CI(n9716), .I0(GND_net), 
            .I1(host_presence_timer[8]), .CO(n9717));
    SB_LUT4 add_8_add_4_3_lut (.I0(GND_net), .I1(us_cnt[1]), .I2(GND_net), 
            .I3(n9666), .O(n57[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_9_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[7]), .I3(n9715), .O(n133[7])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_9 (.CI(n9715), .I0(GND_net), 
            .I1(host_presence_timer[7]), .CO(n9716));
    SB_LUT4 host_presence_timer_1253_add_4_8_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[6]), .I3(n9714), .O(n133[6])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 sub_951_inv_0_i23_1_lut (.I0(host_presence_timer[22]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[22]));
    defparam sub_951_inv_0_i23_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 i4_4_lut (.I0(ns_cnt[0]), .I1(ns_cnt[1]), .I2(ns_cnt[4]), 
            .I3(ns_cnt[3]), .O(n10_adj_2083));
    defparam i4_4_lut.LUT_INIT = 16'hffef;
    SB_LUT4 i10222_3_lut_4_lut (.I0(pwm_cnt[3]), .I1(led_pwm[3]), .I2(led_pwm[2]), 
            .I3(pwm_cnt[2]), .O(n11509));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam i10222_3_lut_4_lut.LUT_INIT = 16'h9009;
    SB_LUT4 pwm_cnt_7__I_0_i6_3_lut_3_lut (.I0(pwm_cnt[3]), .I1(led_pwm[3]), 
            .I2(led_pwm[2]), .I3(GND_net), .O(n6_adj_2084));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i6_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 sub_951_inv_0_i2_1_lut (.I0(host_presence_timer[1]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[1]));
    defparam sub_951_inv_0_i2_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i1_1_lut (.I0(host_presence_timer[0]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[0]));
    defparam sub_951_inv_0_i1_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i3_1_lut (.I0(host_presence_timer[2]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[2]));
    defparam sub_951_inv_0_i3_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i4_1_lut (.I0(host_presence_timer[3]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[3]));
    defparam sub_951_inv_0_i4_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i5_1_lut (.I0(host_presence_timer[4]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[4]));
    defparam sub_951_inv_0_i5_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i6_1_lut (.I0(host_presence_timer[5]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[5]));
    defparam sub_951_inv_0_i6_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY host_presence_timer_1253_add_4_8 (.CI(n9714), .I0(GND_net), 
            .I1(host_presence_timer[6]), .CO(n9715));
    SB_LUT4 host_presence_timer_1253_add_4_7_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[5]), .I3(n9713), .O(n133[5])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_7 (.CI(n9713), .I0(GND_net), 
            .I1(host_presence_timer[5]), .CO(n9714));
    SB_LUT4 host_presence_timer_1253_add_4_6_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[4]), .I3(n9712), .O(n133[4])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_6 (.CI(n9712), .I0(GND_net), 
            .I1(host_presence_timer[4]), .CO(n9713));
    SB_LUT4 sub_951_inv_0_i7_1_lut (.I0(host_presence_timer[6]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[6]));
    defparam sub_951_inv_0_i7_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY add_8_add_4_3 (.CI(n9666), .I0(us_cnt[1]), .I1(GND_net), 
            .CO(n9667));
    SB_LUT4 add_8503_9_lut (.I0(GND_net), .I1(n2798[8]), .I2(n2798[0]), 
            .I3(n9799), .O(led_pwm[7])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8503_8_lut (.I0(GND_net), .I1(n2798[7]), .I2(n2798[0]), 
            .I3(n9798), .O(led_pwm[6])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_8_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_8 (.CI(n9798), .I0(n2798[7]), .I1(n2798[0]), .CO(n9799));
    SB_LUT4 sub_951_inv_0_i8_1_lut (.I0(host_presence_timer[7]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[7]));
    defparam sub_951_inv_0_i8_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 host_presence_timer_1253_add_4_5_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[3]), .I3(n9711), .O(n133[3])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8503_7_lut (.I0(GND_net), .I1(n2798[6]), .I2(n2798[0]), 
            .I3(n9797), .O(led_pwm[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8_add_4_2_lut (.I0(GND_net), .I1(us_cnt[0]), .I2(GND_net), 
            .I3(VCC_net), .O(n57[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_7 (.CI(n9797), .I0(n2798[6]), .I1(n2798[0]), .CO(n9798));
    SB_LUT4 add_8503_6_lut (.I0(GND_net), .I1(n2798[5]), .I2(n2798[0]), 
            .I3(n9796), .O(led_pwm[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 pwm_cnt_7__I_0_i8_3_lut_3_lut (.I0(pwm_cnt[4]), .I1(led_pwm[4]), 
            .I2(n6_adj_2084), .I3(GND_net), .O(n8_c));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i8_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_CARRY add_8503_6 (.CI(n9796), .I0(n2798[5]), .I1(n2798[0]), .CO(n9797));
    SB_LUT4 add_8503_5_lut (.I0(GND_net), .I1(n2798[4]), .I2(n2798[0]), 
            .I3(n9795), .O(led_pwm[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_5 (.CI(n9795), .I0(n2798[4]), .I1(n2798[0]), .CO(n9796));
    SB_LUT4 pwm_cnt_7__I_0_i9_2_lut_rep_182 (.I0(pwm_cnt[4]), .I1(led_pwm[4]), 
            .I2(GND_net), .I3(GND_net), .O(n12023));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i9_2_lut_rep_182.LUT_INIT = 16'h6666;
    SB_LUT4 add_8503_4_lut (.I0(GND_net), .I1(n2798[3]), .I2(n2798[0]), 
            .I3(n9794), .O(led_pwm[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 ns_cnt_1251_add_4_7_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[5]), 
            .I3(n9650), .O(n46[5])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_4 (.CI(n9794), .I0(n2798[3]), .I1(n2798[0]), .CO(n9795));
    SB_CARRY host_presence_timer_1253_add_4_5 (.CI(n9711), .I0(GND_net), 
            .I1(host_presence_timer[3]), .CO(n9712));
    SB_LUT4 host_presence_timer_1253_add_4_33_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[31]), .I3(n9739), .O(n133[31])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_33_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_32_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[30]), .I3(n9738), .O(n133[30])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_32_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_32 (.CI(n9738), .I0(GND_net), 
            .I1(host_presence_timer[30]), .CO(n9739));
    SB_LUT4 host_presence_timer_1253_add_4_31_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[29]), .I3(n9737), .O(n133[29])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_31_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8_add_4_2 (.CI(VCC_net), .I0(us_cnt[0]), .I1(GND_net), 
            .CO(n9666));
    SB_LUT4 add_8503_3_lut (.I0(GND_net), .I1(n2798[2]), .I2(n2798[0]), 
            .I3(n9793), .O(led_pwm[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_3_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_31 (.CI(n9737), .I0(GND_net), 
            .I1(host_presence_timer[29]), .CO(n9738));
    SB_LUT4 host_presence_timer_1253_add_4_4_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[2]), .I3(n9710), .O(n133[2])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_3 (.CI(n9793), .I0(n2798[2]), .I1(n2798[0]), .CO(n9794));
    SB_LUT4 sub_951_inv_0_i9_1_lut (.I0(host_presence_timer[8]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[8]));
    defparam sub_951_inv_0_i9_1_lut.LUT_INIT = 16'h5555;
    SB_CARRY host_presence_timer_1253_add_4_4 (.CI(n9710), .I0(GND_net), 
            .I1(host_presence_timer[2]), .CO(n9711));
    SB_LUT4 host_presence_timer_1253_add_4_30_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[28]), .I3(n9736), .O(n133[28])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_30_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_8503_2_lut (.I0(GND_net), .I1(n2798[1]), .I2(n2809[1]), 
            .I3(n9792), .O(led_pwm[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_8503_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_30 (.CI(n9736), .I0(GND_net), 
            .I1(host_presence_timer[28]), .CO(n9737));
    SB_LUT4 host_presence_timer_1253_add_4_3_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[1]), .I3(n9709), .O(n133[1])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_29_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[27]), .I3(n9735), .O(n133[27])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_29_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_8503_2 (.CI(n9792), .I0(n2798[1]), .I1(n2809[1]), .CO(n9793));
    SB_CARRY add_8503_1 (.CI(GND_net), .I0(n2798[0]), .I1(n2798[0]), .CO(n9792));
    SB_CARRY add_8504_32 (.CI(n9790), .I0(GND_net), .I1(n1[31]), .CO(cout));
    SB_CARRY host_presence_timer_1253_add_4_3 (.CI(n9709), .I0(GND_net), 
            .I1(host_presence_timer[1]), .CO(n9710));
    SB_CARRY add_8504_31 (.CI(n9789), .I0(GND_net), .I1(n1[30]), .CO(n9790));
    SB_LUT4 host_presence_timer_1253_add_4_2_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[0]), .I3(VCC_net), .O(n133[0])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_29 (.CI(n9735), .I0(GND_net), 
            .I1(host_presence_timer[27]), .CO(n9736));
    SB_LUT4 host_presence_timer_1253_add_4_28_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[26]), .I3(n9734), .O(n133[26])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_28_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 ns_cnt_1251_add_4_6_lut (.I0(GND_net), .I1(GND_net), .I2(ns_cnt[4]), 
            .I3(n9649), .O(n46[4])) /* synthesis syn_instantiated=1 */ ;
    defparam ns_cnt_1251_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY ns_cnt_1251_add_4_4 (.CI(n9647), .I0(GND_net), .I1(ns_cnt[2]), 
            .CO(n9648));
    SB_CARRY add_8504_30 (.CI(n9788), .I0(GND_net), .I1(n1[29]), .CO(n9789));
    SB_CARRY host_presence_timer_1253_add_4_2 (.CI(VCC_net), .I0(GND_net), 
            .I1(host_presence_timer[0]), .CO(n9709));
    SB_CARRY add_8504_29 (.CI(n9787), .I0(GND_net), .I1(n1[28]), .CO(n9788));
    SB_CARRY ns_cnt_1251_add_4_2 (.CI(VCC_net), .I0(GND_net), .I1(ns_cnt[0]), 
            .CO(n9646));
    SB_CARRY add_8504_28 (.CI(n9786), .I0(GND_net), .I1(n1[27]), .CO(n9787));
    SB_CARRY host_presence_timer_1253_add_4_28 (.CI(n9734), .I0(GND_net), 
            .I1(host_presence_timer[26]), .CO(n9735));
    SB_CARRY add_8504_27 (.CI(n9785), .I0(GND_net), .I1(n1[26]), .CO(n9786));
    SB_CARRY add_8504_26 (.CI(n9784), .I0(VCC_net), .I1(n1[25]), .CO(n9785));
    SB_LUT4 pwm_cnt_1252_add_4_9_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[7]), 
            .I3(n9708), .O(n37[7])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 pwm_cnt_1252_add_4_8_lut (.I0(GND_net), .I1(GND_net), .I2(pwm_cnt[6]), 
            .I3(n9707), .O(n37[6])) /* synthesis syn_instantiated=1 */ ;
    defparam pwm_cnt_1252_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 host_presence_timer_1253_add_4_27_lut (.I0(GND_net), .I1(GND_net), 
            .I2(host_presence_timer[25]), .I3(n9733), .O(n133[25])) /* synthesis syn_instantiated=1 */ ;
    defparam host_presence_timer_1253_add_4_27_lut.LUT_INIT = 16'hC33C;
    SB_CARRY host_presence_timer_1253_add_4_27 (.CI(n9733), .I0(GND_net), 
            .I1(host_presence_timer[25]), .CO(n9734));
    SB_LUT4 i10233_2_lut_3_lut_4_lut (.I0(pwm_cnt[5]), .I1(led_pwm[5]), 
            .I2(led_pwm[6]), .I3(pwm_cnt[6]), .O(n11520));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam i10233_2_lut_3_lut_4_lut.LUT_INIT = 16'h9009;
    SB_LUT4 pwm_cnt_7__I_0_i11_2_lut_rep_178 (.I0(pwm_cnt[5]), .I1(led_pwm[5]), 
            .I2(GND_net), .I3(GND_net), .O(n12019));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i11_2_lut_rep_178.LUT_INIT = 16'h6666;
    SB_LUT4 i2_2_lut (.I0(led_pwm[1]), .I1(led_pwm[2]), .I2(GND_net), 
            .I3(GND_net), .O(n10_adj_2085));   // ../../../common/tinyfpga_bootloader.v(73[13:25])
    defparam i2_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i6_4_lut (.I0(led_pwm[7]), .I1(led_pwm[4]), .I2(led_pwm[5]), 
            .I3(led_pwm[6]), .O(n14_adj_2086));   // ../../../common/tinyfpga_bootloader.v(73[13:25])
    defparam i6_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i7_4_lut (.I0(led_pwm[0]), .I1(n14_adj_2086), .I2(n10_adj_2085), 
            .I3(led_pwm[3]), .O(n15_adj_2071));   // ../../../common/tinyfpga_bootloader.v(73[13:25])
    defparam i7_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i2_2_lut_adj_239 (.I0(led_pwm[1]), .I1(led_pwm[2]), .I2(GND_net), 
            .I3(GND_net), .O(n10_adj_2087));
    defparam i2_2_lut_adj_239.LUT_INIT = 16'h8888;
    SB_LUT4 i6_4_lut_adj_240 (.I0(led_pwm[7]), .I1(led_pwm[4]), .I2(led_pwm[5]), 
            .I3(led_pwm[6]), .O(n14_adj_2088));
    defparam i6_4_lut_adj_240.LUT_INIT = 16'h8000;
    SB_LUT4 i7_4_lut_adj_241 (.I0(led_pwm[0]), .I1(n14_adj_2088), .I2(n10_adj_2087), 
            .I3(led_pwm[3]), .O(count_down_N_123));
    defparam i7_4_lut_adj_241.LUT_INIT = 16'h8000;
    SB_LUT4 i266_4_lut (.I0(count_down_N_123), .I1(us_rst), .I2(n15_adj_2071), 
            .I3(count_down), .O(n256));   // ../../../common/tinyfpga_bootloader.v(71[5] 85[8])
    defparam i266_4_lut.LUT_INIT = 16'hc044;
    SB_LUT4 sub_951_inv_0_i10_1_lut (.I0(host_presence_timer[9]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[9]));
    defparam sub_951_inv_0_i10_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i11_1_lut (.I0(host_presence_timer[10]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[10]));
    defparam sub_951_inv_0_i11_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 sub_951_inv_0_i12_1_lut (.I0(host_presence_timer[11]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[11]));
    defparam sub_951_inv_0_i12_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 pwm_cnt_7__I_0_i10_3_lut_3_lut (.I0(pwm_cnt[6]), .I1(led_pwm[6]), 
            .I2(led_pwm[5]), .I3(GND_net), .O(n10_adj_2066));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i10_3_lut_3_lut.LUT_INIT = 16'hd4d4;
    SB_LUT4 sub_951_inv_0_i13_1_lut (.I0(host_presence_timer[12]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[12]));
    defparam sub_951_inv_0_i13_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 i10302_2_lut_4_lut (.I0(ns_cnt[2]), .I1(n10_adj_2083), .I2(ns_cnt[5]), 
            .I3(us_rst), .O(n4138));   // ../../../common/tinyfpga_bootloader.v(40[17:31])
    defparam i10302_2_lut_4_lut.LUT_INIT = 16'hff10;
    SB_LUT4 i10335_3_lut_rep_234 (.I0(ns_cnt[2]), .I1(n10_adj_2083), .I2(ns_cnt[5]), 
            .I3(GND_net), .O(n12075));   // ../../../common/tinyfpga_bootloader.v(40[17:31])
    defparam i10335_3_lut_rep_234.LUT_INIT = 16'h1010;
    SB_LUT4 pwm_cnt_7__I_0_i13_2_lut_rep_173 (.I0(pwm_cnt[6]), .I1(led_pwm[6]), 
            .I2(GND_net), .I3(GND_net), .O(n12014));   // ../../../common/tinyfpga_bootloader.v(88[16:33])
    defparam pwm_cnt_7__I_0_i13_2_lut_rep_173.LUT_INIT = 16'h6666;
    SB_LUT4 i6_4_lut_adj_242 (.I0(us_cnt[2]), .I1(us_cnt[4]), .I2(us_cnt[6]), 
            .I3(us_cnt[1]), .O(n16_adj_2089));
    defparam i6_4_lut_adj_242.LUT_INIT = 16'hffef;
    SB_LUT4 i7_4_lut_adj_243 (.I0(us_cnt[0]), .I1(us_cnt[5]), .I2(us_cnt[7]), 
            .I3(us_cnt[9]), .O(n17_adj_2090));
    defparam i7_4_lut_adj_243.LUT_INIT = 16'hbfff;
    SB_LUT4 i10340_4_lut (.I0(n17_adj_2090), .I1(us_cnt[3]), .I2(n16_adj_2089), 
            .I3(us_cnt[8]), .O(us_rst));   // ../../../common/tinyfpga_bootloader.v(50[17:33])
    defparam i10340_4_lut.LUT_INIT = 16'h0400;
    SB_LUT4 sub_951_inv_0_i14_1_lut (.I0(host_presence_timer[13]), .I1(GND_net), 
            .I2(GND_net), .I3(GND_net), .O(n1[13]));
    defparam sub_951_inv_0_i14_1_lut.LUT_INIT = 16'h5555;
    usb_spi_bridge_ep usb_spi_bridge_ep_inst (.pin_31_mosi_c(pin_31_mosi_c), 
            .clk_48mhz(clk_48mhz), .VCC_net(VCC_net), .GND_net(GND_net), 
            .serial_in_ep_req(in_ep_req[1]), .serial_in_ep_data_done(in_ep_data_done[1]), 
            .serial_out_ep_grant(out_ep_grant[1]), .get_cmd_out_data(get_cmd_out_data), 
            .get_spi_out_data(n115[1]), .out_ep_data({out_ep_data}), .pin_29_miso_c(pin_29_miso_c), 
            .serial_in_ep_data({serial_in_ep_data}), .spi_byte_in_xfr_ready(spi_byte_in_xfr_ready), 
            .\in_ep_num_1__N_1088[0] (in_ep_num_1__N_1088[0]), .n11064(n11064), 
            .host_presence_timeout(host_presence_timeout), .boot(boot), 
            .sof_valid(sof_valid), .cout(cout), .n4566(n4566), .pin_32_sck_c(pin_32_sck_c), 
            .pin_30_cs_c(pin_30_cs_c)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/tinyfpga_bootloader.v(178[21] 214[4])
    \usb_fs_pe(NUM_OUT_EPS=5'b010,NUM_IN_EPS=5'b011)  usb_fs_pe_inst (.GND_net(GND_net), 
            .clk_48mhz(clk_48mhz), .usb_n_tx(usb_n_tx), .usb_tx_en(usb_tx_en), 
            .usb_p_tx(usb_p_tx), .pin_usbn_out(pin_usbn_out), .pin_usbp_out(pin_usbp_out), 
            .n4095(n4095), .n12027(n12027), .n12036(n12036), .n12030(n12030), 
            .\ep_state[0] ({\ep_state[0] }), .n1292(n1292), .\ep_get_addr[0][0] (\ep_get_addr[0][0] ), 
            .n12020(n12020), .\ep_state_next_0__1__N_1331[1] (\ep_state_next_0__1__N_1331[1] ), 
            .n10912(n10912), .\ep_get_addr[1][2] (\ep_get_addr[1][2] ), 
            .\ep_get_addr[0][1] (\ep_get_addr[0][1] ), .\ep_get_addr[1][1] (\ep_get_addr[1][1] ), 
            .\ep_get_addr[1][0] (\ep_get_addr[1][0] ), .\ep_state_next_0__1__N_1331[0] (\ep_state_next_0__1__N_1331[0] ), 
            .out_ep_data({out_ep_data}), .VCC_net(VCC_net), .ctrl_out_ep_setup(out_ep_setup[0]), 
            .n11542(n11542), .n8(n8), .n8_adj_2(n8_adj_3), .ep_state_next_1__1__N_1228(ep_state_next_1__1__N_1228), 
            .\ctrl_xfr_state_next_5__N_168[2] (ctrl_xfr_state_next_5__N_168[2]), 
            .out_ep_data_valid(out_ep_data_valid), .n12017(n12017), .n12049(n12049), 
            .get_spi_out_data(n115[1]), .serial_out_ep_grant(out_ep_grant[1]), 
            .get_cmd_out_data(get_cmd_out_data), .ctrl_in_ep_stall(in_ep_stall[0]), 
            .\in_ep_num_1__N_1088[0] (in_ep_num_1__N_1088[0]), .in_ep_req_0__N_914(in_ep_req_0__N_914), 
            .ctrl_in_ep_data_put(in_ep_data_put[0]), .\ctrl_xfr_state[2] (ctrl_xfr_state[2]), 
            .all_data_sent(all_data_sent), .serial_in_ep_data_done(in_ep_data_done[1]), 
            .n5(n5_adj_2093), .n5383(n5383), .in_q(in_q), .\ctrl_xfr_state[0] (ctrl_xfr_state[0]), 
            .\ctrl_xfr_state[1] (ctrl_xfr_state[1]), .n1854(n1851[0]), .n12112(n12112), 
            .\ctrl_xfr_state_next_5__N_150[0] (ctrl_xfr_state_next_5__N_150[0]), 
            .n1289(n1289), .\bytes_sent[7] (bytes_sent[7]), .n3826(n3826), 
            .n14(n14_adj_2094), .n10174(n10174), .n11064(n11064), .dev_addr({dev_addr}), 
            .n12007(n12007), .n10212(n10212), .has_data_stage(has_data_stage), 
            .n1857(n1855[1]), .status_stage_end(status_stage_end), .save_dev_addr(save_dev_addr), 
            .n275(n275), .sof_valid(sof_valid), .serial_in_ep_req(in_ep_req[1]), 
            .serial_in_ep_data({serial_in_ep_data}), .ctrl_in_ep_data({ctrl_in_ep_data}), 
            .spi_byte_in_xfr_ready(spi_byte_in_xfr_ready)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/tinyfpga_bootloader.v(223[5] 258[4])
    usb_serial_ctrl_ep ctrl_ep_inst (.status_stage_end(status_stage_end), 
            .GND_net(GND_net), .clk_48mhz(clk_48mhz), .n275(n275), .dev_addr({dev_addr}), 
            .save_dev_addr(save_dev_addr), .n12020(n12020), .out_ep_data_valid(out_ep_data_valid), 
            .bytes_sent({bytes_sent}), .ctrl_in_ep_stall(in_ep_stall[0]), 
            .has_data_stage(has_data_stage), .n12017(n12017), .\ctrl_xfr_state[1] (ctrl_xfr_state[1]), 
            .\ctrl_xfr_state_next_5__N_168[2] (ctrl_xfr_state_next_5__N_168[2]), 
            .n5383(n5383), .VCC_net(VCC_net), .ctrl_in_ep_data({ctrl_in_ep_data}), 
            .\raw_setup_data[6][3] (\raw_setup_data[6][3] ), .\raw_setup_data[6][2] (\raw_setup_data[6][2] ), 
            .n3826(n3826), .\raw_setup_data[6][7] (\raw_setup_data[6][7] ), 
            .\raw_setup_data[6][6] (\raw_setup_data[6][6] ), .\raw_setup_data[6][0] (\raw_setup_data[6][0] ), 
            .\raw_setup_data[6][4] (\raw_setup_data[6][4] ), .\raw_setup_data[6][5] (\raw_setup_data[6][5] ), 
            .\raw_setup_data[6][1] (\raw_setup_data[6][1] ), .all_data_sent(all_data_sent), 
            .n5(n5_adj_2093), .out_ep_data({out_ep_data}), .n1857(n1855[1]), 
            .\ctrl_xfr_state[2] (ctrl_xfr_state[2]), .n10212(n10212), .ctrl_out_ep_setup(out_ep_setup[0]), 
            .n10174(n10174), .\ctrl_xfr_state[0] (ctrl_xfr_state[0]), .n14(n14_adj_2094), 
            .in_ep_req_0__N_914(in_ep_req_0__N_914), .ctrl_in_ep_data_put(in_ep_data_put[0]), 
            .n12112(n12112), .\ctrl_xfr_state_next_5__N_150[0] (ctrl_xfr_state_next_5__N_150[0]), 
            .n1854(n1851[0]), .n12007(n12007), .in_q(in_q)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/tinyfpga_bootloader.v(151[22] 176[4])
    
endmodule
//
// Verilog Description of module usb_spi_bridge_ep
//

module usb_spi_bridge_ep (pin_31_mosi_c, clk_48mhz, VCC_net, GND_net, 
            serial_in_ep_req, serial_in_ep_data_done, serial_out_ep_grant, 
            get_cmd_out_data, get_spi_out_data, out_ep_data, pin_29_miso_c, 
            serial_in_ep_data, spi_byte_in_xfr_ready, \in_ep_num_1__N_1088[0] , 
            n11064, host_presence_timeout, boot, sof_valid, cout, 
            n4566, pin_32_sck_c, pin_30_cs_c) /* synthesis syn_module_defined=1 */ ;
    output pin_31_mosi_c;
    input clk_48mhz;
    input VCC_net;
    input GND_net;
    output serial_in_ep_req;
    output serial_in_ep_data_done;
    input serial_out_ep_grant;
    output get_cmd_out_data;
    output get_spi_out_data;
    input [7:0]out_ep_data;
    input pin_29_miso_c;
    output [7:0]serial_in_ep_data;
    input spi_byte_in_xfr_ready;
    output \in_ep_num_1__N_1088[0] ;
    input n11064;
    input host_presence_timeout;
    output boot;
    input sof_valid;
    input cout;
    output n4566;
    output pin_32_sck_c;
    output pin_30_cs_c;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    wire [8:0]spi_out_data_7__N_882;
    
    wire n4076, n4579, n2988, n4176;
    wire [15:0]data_out_length;   // ../../../common/usb_spi_bridge_ep.v(57[14:29])
    wire [15:0]n69;
    
    wire n9664;
    wire [3:0]cmd_state;   // ../../../common/usb_spi_bridge_ep.v(67[13:22])
    
    wire n100, in_ep_req_i, spi_dir_transition_N_908, in_ep_data_done_q, 
        n1121;
    wire [3:0]cmd_state_next_3__N_753;
    
    wire n9655;
    wire [8:0]spi_out_data_7__N_732;
    wire [8:0]spi_out_data;   // ../../../common/usb_spi_bridge_ep.v(60[13:25])
    
    wire n12041, n3840, n9837, n9656, n9665, n10, n10771, n10_adj_2040;
    wire [2:0]spi_state_next;   // ../../../common/usb_spi_bridge_ep.v(92[13:27])
    wire [2:0]spi_state;   // ../../../common/usb_spi_bridge_ep.v(91[13:22])
    
    wire n3;
    wire [3:0]cmd_state_next;   // ../../../common/usb_spi_bridge_ep.v(68[13:27])
    
    wire n1247, get_spi_out_data_q, n3104, spi_get_bit_q, n5818, in_ep_req_i_N_903;
    wire [3:0]n2;
    wire [3:0]spi_bit_counter;   // ../../../common/usb_spi_bridge_ep.v(107[13:28])
    
    wire n12025;
    wire [3:0]n1412;
    
    wire n12022, n9663, n12050, n3298, n12085, n7, n11751, n9662, 
        n17, n30, n26, n18, n12115, n5, n11748, n2942, n2985, 
        n2944, n2946, n2948, n2950, n2952, n9661, n2954, n2956, 
        n2959, n2961, n2963, n2965, n2967, n2969, n2972, n3083, 
        n4187;
    wire [15:0]data_in_length;   // ../../../common/usb_spi_bridge_ep.v(58[14:28])
    
    wire n11301, n12056;
    wire [3:0]cmd_state_next_3__N_745;
    
    wire n4, n9654, n9660, n9653, n9659, n9652;
    wire [15:0]n69_adj_2065;
    
    wire n9760, n9759, n12082, n12055, n5_adj_2042, n3408, n3410, 
        n3412, n3414, n3416, n3418, n3420, n3423, n4443, n3425, 
        n3427, n3429, n3431, n3433, n3435, n3437, n12028, n11278, 
        n24, n8748, n12083, n12081, n4_adj_2043, n19, n33, n20, 
        n11419, n11461;
    wire [3:0]cmd_state_next_3__N_765;
    
    wire n14, n11476, n11477, n11475, n9758, n9757, n9658, n14_adj_2046, 
        n13, n12059, n14_adj_2047, n15, n9756, n9755, n9754, n9657, 
        n8, n7_adj_2051;
    wire [8:0]n115;
    
    wire n12102, n9753, n1206, n10_adj_2053, n9651, n9752, n9751, 
        n11283, n4_adj_2060, n9750, n9749, n9748, n9747, n8_adj_2061, 
        n22, n28, n9746, n11111, n1;
    wire [2:0]spi_state_next_2__N_776;
    
    SB_DFFESR spi_out_data_i8 (.Q(pin_31_mosi_c), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_882[8]), .R(n4579));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE data_out_length_1257__i0 (.Q(data_out_length[0]), .C(clk_48mhz), 
            .E(n4176), .D(n2988));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_LUT4 data_out_length_1257_add_4_16_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[14]), .I3(n9664), .O(n69[14])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_16_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2_3_lut (.I0(cmd_state[3]), .I1(cmd_state[1]), .I2(cmd_state[0]), 
            .I3(GND_net), .O(n100));
    defparam i2_3_lut.LUT_INIT = 16'h0404;
    SB_DFF in_ep_req_832 (.Q(serial_in_ep_req), .C(clk_48mhz), .D(in_ep_req_i));   // ../../../common/usb_spi_bridge_ep.v(117[10:50])
    SB_DFFSR in_ep_data_done_q_834 (.Q(in_ep_data_done_q), .C(clk_48mhz), 
            .D(spi_dir_transition_N_908), .R(n1121));   // ../../../common/usb_spi_bridge_ep.v(127[10:64])
    SB_DFF in_ep_data_done_835 (.Q(serial_in_ep_data_done), .C(clk_48mhz), 
           .D(in_ep_data_done_q));   // ../../../common/usb_spi_bridge_ep.v(128[10:62])
    SB_DFF out_data_ready_836 (.Q(cmd_state_next_3__N_753[1]), .C(clk_48mhz), 
           .D(serial_out_ep_grant));   // ../../../common/usb_spi_bridge_ep.v(131[10:77])
    SB_LUT4 data_out_length_1257_add_4_7_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[5]), .I3(n9655), .O(n69[5])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_DFFE spi_out_data_i7 (.Q(spi_out_data[7]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[7]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 i2_4_lut (.I0(n100), .I1(n12041), .I2(cmd_state_next_3__N_753[1]), 
            .I3(n3840), .O(get_cmd_out_data));
    defparam i2_4_lut.LUT_INIT = 16'h1110;
    SB_LUT4 i2_3_lut_adj_215 (.I0(cmd_state[0]), .I1(cmd_state[2]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n9837));
    defparam i2_3_lut_adj_215.LUT_INIT = 16'h8080;
    SB_CARRY data_out_length_1257_add_4_7 (.CI(n9655), .I0(VCC_net), .I1(data_out_length[5]), 
            .CO(n9656));
    SB_CARRY data_out_length_1257_add_4_16 (.CI(n9664), .I0(VCC_net), .I1(data_out_length[14]), 
            .CO(n9665));
    SB_LUT4 i1_4_lut (.I0(n10), .I1(n9837), .I2(get_cmd_out_data), .I3(n10771), 
            .O(n10_adj_2040));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1_4_lut.LUT_INIT = 16'heca0;
    SB_DFFE spi_out_data_i6 (.Q(spi_out_data[6]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[6]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_out_data_i5 (.Q(spi_out_data[5]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[5]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_out_data_i4 (.Q(spi_out_data[4]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[4]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_out_data_i3 (.Q(spi_out_data[3]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[3]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_out_data_i2 (.Q(spi_out_data[2]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[2]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_out_data_i1 (.Q(spi_out_data[1]), .C(clk_48mhz), .E(n4076), 
            .D(spi_out_data_7__N_732[1]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFF spi_state_i2 (.Q(spi_state[2]), .C(clk_48mhz), .D(spi_state_next[2]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFSR spi_state_i1 (.Q(spi_state[1]), .C(clk_48mhz), .D(n3), .R(spi_state[2]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFF cmd_state_i0 (.Q(cmd_state[0]), .C(clk_48mhz), .D(cmd_state_next[0]));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    SB_DFF spi_state_i0 (.Q(spi_state[0]), .C(clk_48mhz), .D(spi_state_next[0]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 i2_4_lut_adj_216 (.I0(cmd_state[2]), .I1(cmd_state[3]), .I2(n1247), 
            .I3(n10_adj_2040), .O(n4176));
    defparam i2_4_lut_adj_216.LUT_INIT = 16'h3100;
    SB_DFF get_spi_out_data_q_906 (.Q(get_spi_out_data_q), .C(clk_48mhz), 
           .D(get_spi_out_data));   // ../../../common/usb_spi_bridge_ep.v(395[10:64])
    SB_LUT4 i1885_3_lut (.I0(out_ep_data[0]), .I1(n69[0]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2988));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1885_3_lut.LUT_INIT = 16'hcaca;
    SB_DFFSR spi_get_bit_q_907 (.Q(spi_get_bit_q), .C(clk_48mhz), .D(n3104), 
            .R(n5818));   // ../../../common/usb_spi_bridge_ep.v(398[10:54])
    SB_DFF in_ep_req_i_831 (.Q(in_ep_req_i), .C(clk_48mhz), .D(in_ep_req_i_N_903));   // ../../../common/usb_spi_bridge_ep.v(116[10:107])
    SB_DFFSR spi_bit_counter__i0 (.Q(spi_bit_counter[0]), .C(clk_48mhz), 
            .D(n2[0]), .R(n12025));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFESR spi_bit_counter__i1 (.Q(spi_bit_counter[1]), .C(clk_48mhz), 
            .E(n12022), .D(n1412[1]), .R(n12025));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 data_out_length_1257_add_4_15_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[13]), .I3(n9663), .O(n69[13])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_15_lut.LUT_INIT = 16'hC33C;
    SB_DFFSR cmd_state_i3 (.Q(cmd_state[3]), .C(clk_48mhz), .D(n12050), 
            .R(n3298));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    SB_LUT4 spi_out_data_7__I_0_i5_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[4]), .I3(out_ep_data[4]), .O(spi_out_data_7__N_732[4]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i5_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_DFFSR cmd_state_i2 (.Q(cmd_state[2]), .C(clk_48mhz), .D(n7), .R(cmd_state[3]));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    SB_LUT4 spi_out_data_7__I_0_i6_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[5]), .I3(out_ep_data[5]), .O(spi_out_data_7__N_732[5]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i6_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_LUT4 spi_out_data_7__I_0_i7_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[6]), .I3(out_ep_data[6]), .O(spi_out_data_7__N_732[6]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i7_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_DFFSR cmd_state_i1 (.Q(cmd_state[1]), .C(clk_48mhz), .D(n11751), 
            .R(cmd_state[3]));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    SB_LUT4 spi_out_data_7__I_0_i3_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[2]), .I3(out_ep_data[2]), .O(spi_out_data_7__N_732[2]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i3_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_LUT4 spi_out_data_7__I_0_i4_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[3]), .I3(out_ep_data[3]), .O(spi_out_data_7__N_732[3]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i4_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_LUT4 spi_out_data_7__I_0_i8_3_lut_4_lut (.I0(spi_state[1]), .I1(n12085), 
            .I2(spi_out_data_7__N_882[7]), .I3(out_ep_data[7]), .O(spi_out_data_7__N_732[7]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam spi_out_data_7__I_0_i8_3_lut_4_lut.LUT_INIT = 16'hfd20;
    SB_CARRY data_out_length_1257_add_4_15 (.CI(n9663), .I0(VCC_net), .I1(data_out_length[13]), 
            .CO(n9664));
    SB_LUT4 mux_964_i8_3_lut (.I0(spi_out_data[7]), .I1(out_ep_data[7]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[8]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i8_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_out_length_1257_add_4_14_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[12]), .I3(n9662), .O(n69[12])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_14_lut.LUT_INIT = 16'hC33C;
    SB_DFFE spi_in_data__0_i0_i0 (.Q(serial_in_ep_data[0]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(pin_29_miso_c));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_CARRY data_out_length_1257_add_4_14 (.CI(n9662), .I0(VCC_net), .I1(data_out_length[12]), 
            .CO(n9663));
    SB_LUT4 data_in_length_15__I_0_i32_1_lut_4_lut (.I0(n17), .I1(n30), 
            .I2(n26), .I3(n18), .O(spi_dir_transition_N_908));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam data_in_length_15__I_0_i32_1_lut_4_lut.LUT_INIT = 16'h0001;
    SB_DFFESR spi_bit_counter__i2 (.Q(spi_bit_counter[2]), .C(clk_48mhz), 
            .E(n12022), .D(n1412[2]), .R(n12025));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 i15_4_lut_rep_209 (.I0(n17), .I1(n30), .I2(n26), .I3(n18), 
            .O(n12050));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i15_4_lut_rep_209.LUT_INIT = 16'hfffe;
    SB_LUT4 cmd_state_1__bdd_4_lut (.I0(cmd_state[1]), .I1(n12115), .I2(n5), 
            .I3(cmd_state[2]), .O(n11748));
    defparam cmd_state_1__bdd_4_lut.LUT_INIT = 16'he4aa;
    SB_DFFE data_out_length_1257__i15 (.Q(data_out_length[15]), .C(clk_48mhz), 
            .E(n2985), .D(n2942));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i14 (.Q(data_out_length[14]), .C(clk_48mhz), 
            .E(n2985), .D(n2944));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i13 (.Q(data_out_length[13]), .C(clk_48mhz), 
            .E(n2985), .D(n2946));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i12 (.Q(data_out_length[12]), .C(clk_48mhz), 
            .E(n2985), .D(n2948));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i11 (.Q(data_out_length[11]), .C(clk_48mhz), 
            .E(n2985), .D(n2950));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i10 (.Q(data_out_length[10]), .C(clk_48mhz), 
            .E(n2985), .D(n2952));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_LUT4 data_out_length_1257_add_4_13_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[11]), .I3(n9661), .O(n69[11])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_13_lut.LUT_INIT = 16'hC33C;
    SB_DFFE data_out_length_1257__i9 (.Q(data_out_length[9]), .C(clk_48mhz), 
            .E(n2985), .D(n2954));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i8 (.Q(data_out_length[8]), .C(clk_48mhz), 
            .E(n2985), .D(n2956));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i7 (.Q(data_out_length[7]), .C(clk_48mhz), 
            .E(n4176), .D(n2959));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i6 (.Q(data_out_length[6]), .C(clk_48mhz), 
            .E(n4176), .D(n2961));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i5 (.Q(data_out_length[5]), .C(clk_48mhz), 
            .E(n4176), .D(n2963));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i4 (.Q(data_out_length[4]), .C(clk_48mhz), 
            .E(n4176), .D(n2965));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i3 (.Q(data_out_length[3]), .C(clk_48mhz), 
            .E(n4176), .D(n2967));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i2 (.Q(data_out_length[2]), .C(clk_48mhz), 
            .E(n4176), .D(n2969));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_out_length_1257__i1 (.Q(data_out_length[1]), .C(clk_48mhz), 
            .E(n4176), .D(n2972));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    SB_DFFE data_in_length_1255__i0 (.Q(data_in_length[0]), .C(clk_48mhz), 
            .E(n4187), .D(n3083));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFSR in_ep_data_put_833 (.Q(\in_ep_num_1__N_1088[0] ), .C(clk_48mhz), 
            .D(spi_byte_in_xfr_ready), .R(n11301));   // ../../../common/usb_spi_bridge_ep.v(118[10:59])
    SB_LUT4 i2_3_lut_4_lut (.I0(n12056), .I1(cmd_state[3]), .I2(n11064), 
            .I3(n1121), .O(in_ep_req_i_N_903));   // ../../../common/usb_spi_bridge_ep.v(67[13:22])
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h000e;
    SB_LUT4 i1_4_lut_4_lut (.I0(n12056), .I1(cmd_state[3]), .I2(cmd_state_next_3__N_745[1]), 
            .I3(n1121), .O(n4));   // ../../../common/usb_spi_bridge_ep.v(67[13:22])
    defparam i1_4_lut_4_lut.LUT_INIT = 16'h02ee;
    SB_LUT4 data_out_length_1257_add_4_6_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[4]), .I3(n9654), .O(n69[4])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_DFFESR spi_bit_counter__i3 (.Q(spi_bit_counter[3]), .C(clk_48mhz), 
            .E(n12022), .D(n1412[3]), .R(n12025));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_CARRY data_out_length_1257_add_4_13 (.CI(n9661), .I0(VCC_net), .I1(data_out_length[11]), 
            .CO(n9662));
    SB_LUT4 data_out_length_1257_add_4_12_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[10]), .I3(n9660), .O(n69[10])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_12_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_out_length_1257_add_4_12 (.CI(n9660), .I0(VCC_net), .I1(data_out_length[10]), 
            .CO(n9661));
    SB_CARRY data_out_length_1257_add_4_6 (.CI(n9654), .I0(VCC_net), .I1(data_out_length[4]), 
            .CO(n9655));
    SB_LUT4 data_out_length_1257_add_4_5_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[3]), .I3(n9653), .O(n69[3])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_DFFE spi_in_data__0_i0_i1 (.Q(serial_in_ep_data[1]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[0]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i2 (.Q(serial_in_ep_data[2]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[1]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i3 (.Q(serial_in_ep_data[3]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[2]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i4 (.Q(serial_in_ep_data[4]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[3]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i5 (.Q(serial_in_ep_data[5]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[4]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i6 (.Q(serial_in_ep_data[6]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[5]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_DFFE spi_in_data__0_i0_i7 (.Q(serial_in_ep_data[7]), .C(clk_48mhz), 
            .E(spi_get_bit_q), .D(serial_in_ep_data[6]));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 data_out_length_1257_add_4_11_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[9]), .I3(n9659), .O(n69[9])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_11_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_out_length_1257_add_4_11 (.CI(n9659), .I0(VCC_net), .I1(data_out_length[9]), 
            .CO(n9660));
    SB_CARRY data_out_length_1257_add_4_5 (.CI(n9653), .I0(VCC_net), .I1(data_out_length[3]), 
            .CO(n9654));
    SB_LUT4 data_out_length_1257_add_4_4_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[2]), .I3(n9652), .O(n69[2])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 data_in_length_1255_add_4_17_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[15]), .I3(n9760), .O(n69_adj_2065[15])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_17_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 data_in_length_1255_add_4_16_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[14]), .I3(n9759), .O(n69_adj_2065[14])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_16_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 cmd_state_3__I_0_1042_Mux_2_i7_4_lut (.I0(cmd_state_next_3__N_753[1]), 
            .I1(cmd_state_next_3__N_745[1]), .I2(cmd_state[2]), .I3(n12082), 
            .O(n7));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam cmd_state_3__I_0_1042_Mux_2_i7_4_lut.LUT_INIT = 16'hcaf0;
    SB_LUT4 i2185_4_lut (.I0(cmd_state_next_3__N_745[1]), .I1(n12055), .I2(cmd_state[3]), 
            .I3(n9837), .O(n3298));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i2185_4_lut.LUT_INIT = 16'h3a3f;
    SB_LUT4 i1428_2_lut (.I0(spi_bit_counter[1]), .I1(spi_bit_counter[0]), 
            .I2(GND_net), .I3(GND_net), .O(n1412[1]));   // ../../../common/usb_spi_bridge_ep.v(404[26:48])
    defparam i1428_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 cmd_state_3__I_0_1042_Mux_0_i5_3_lut_4_lut (.I0(n12050), .I1(cmd_state_next_3__N_745[1]), 
            .I2(cmd_state[0]), .I3(cmd_state_next_3__N_753[1]), .O(n5_adj_2042));   // ../../../common/usb_spi_bridge_ep.v(244[18] 247[12])
    defparam cmd_state_3__I_0_1042_Mux_0_i5_3_lut_4_lut.LUT_INIT = 16'hefe0;
    SB_DFFE data_in_length_1255__i1 (.Q(data_in_length[1]), .C(clk_48mhz), 
            .E(n4187), .D(n3408));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i2 (.Q(data_in_length[2]), .C(clk_48mhz), 
            .E(n4187), .D(n3410));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i3 (.Q(data_in_length[3]), .C(clk_48mhz), 
            .E(n4187), .D(n3412));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i4 (.Q(data_in_length[4]), .C(clk_48mhz), 
            .E(n4187), .D(n3414));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i5 (.Q(data_in_length[5]), .C(clk_48mhz), 
            .E(n4187), .D(n3416));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i6 (.Q(data_in_length[6]), .C(clk_48mhz), 
            .E(n4187), .D(n3418));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i7 (.Q(data_in_length[7]), .C(clk_48mhz), 
            .E(n4187), .D(n3420));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i8 (.Q(data_in_length[8]), .C(clk_48mhz), 
            .E(n4443), .D(n3423));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i9 (.Q(data_in_length[9]), .C(clk_48mhz), 
            .E(n4443), .D(n3425));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i10 (.Q(data_in_length[10]), .C(clk_48mhz), 
            .E(n4443), .D(n3427));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i11 (.Q(data_in_length[11]), .C(clk_48mhz), 
            .E(n4443), .D(n3429));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i12 (.Q(data_in_length[12]), .C(clk_48mhz), 
            .E(n4443), .D(n3431));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i13 (.Q(data_in_length[13]), .C(clk_48mhz), 
            .E(n4443), .D(n3433));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i14 (.Q(data_in_length[14]), .C(clk_48mhz), 
            .E(n4443), .D(n3435));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_DFFE data_in_length_1255__i15 (.Q(data_in_length[15]), .C(clk_48mhz), 
            .E(n4443), .D(n3437));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    SB_CARRY data_in_length_1255_add_4_16 (.CI(n9759), .I0(VCC_net), .I1(data_in_length[14]), 
            .CO(n9760));
    SB_LUT4 i10114_2_lut_rep_187_3_lut (.I0(n12050), .I1(cmd_state_next_3__N_745[1]), 
            .I2(cmd_state[3]), .I3(GND_net), .O(n12028));   // ../../../common/usb_spi_bridge_ep.v(244[18] 247[12])
    defparam i10114_2_lut_rep_187_3_lut.LUT_INIT = 16'h0e0e;
    SB_LUT4 i1_3_lut_2_lut_2_lut (.I0(n11278), .I1(cmd_state[3]), .I2(GND_net), 
            .I3(GND_net), .O(n24));   // ../../../common/usb_spi_bridge_ep.v(244[18] 247[12])
    defparam i1_3_lut_2_lut_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i4699_1_lut (.I0(spi_state[0]), .I1(GND_net), .I2(GND_net), 
            .I3(GND_net), .O(n5818));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i4699_1_lut.LUT_INIT = 16'h5555;
    SB_LUT4 i1_2_lut (.I0(spi_state[1]), .I1(spi_state[2]), .I2(GND_net), 
            .I3(GND_net), .O(n3104));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i3_4_lut (.I0(cmd_state_next_3__N_745[1]), .I1(n8748), .I2(spi_state[1]), 
            .I3(n12083), .O(get_spi_out_data));
    defparam i3_4_lut.LUT_INIT = 16'h0008;
    SB_LUT4 i3_4_lut_adj_217 (.I0(spi_byte_in_xfr_ready), .I1(n12081), .I2(cmd_state[1]), 
            .I3(n12050), .O(n11278));   // ../../../common/usb_spi_bridge_ep.v(303[5] 391[12])
    defparam i3_4_lut_adj_217.LUT_INIT = 16'h0800;
    SB_LUT4 i1_4_lut_adj_218 (.I0(n12028), .I1(spi_state[1]), .I2(n24), 
            .I3(n12056), .O(n4_adj_2043));
    defparam i1_4_lut_adj_218.LUT_INIT = 16'h3230;
    SB_LUT4 i46_4_lut (.I0(spi_state[1]), .I1(n19), .I2(spi_state[0]), 
            .I3(n33), .O(n20));   // ../../../common/usb_spi_bridge_ep.v(303[5] 391[12])
    defparam i46_4_lut.LUT_INIT = 16'h1f1a;
    SB_LUT4 i45_4_lut (.I0(n20), .I1(spi_state[0]), .I2(spi_state[2]), 
            .I3(n4_adj_2043), .O(spi_state_next[0]));   // ../../../common/usb_spi_bridge_ep.v(303[5] 391[12])
    defparam i45_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 i1_3_lut_4_lut (.I0(n12041), .I1(n100), .I2(cmd_state[2]), 
            .I3(cmd_state_next_3__N_753[1]), .O(n33));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_3_lut_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i10136_2_lut (.I0(out_ep_data[4]), .I1(out_ep_data[6]), .I2(GND_net), 
            .I3(GND_net), .O(n11419));
    defparam i10136_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i1_3_lut_4_lut_adj_219 (.I0(n12041), .I1(n100), .I2(host_presence_timeout), 
            .I3(cmd_state[2]), .O(boot));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_3_lut_4_lut_adj_219.LUT_INIT = 16'hf0f4;
    SB_LUT4 i10177_4_lut (.I0(out_ep_data[5]), .I1(out_ep_data[3]), .I2(out_ep_data[2]), 
            .I3(out_ep_data[1]), .O(n11461));
    defparam i10177_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i7_4_lut (.I0(cmd_state_next_3__N_753[1]), .I1(n11461), .I2(n11419), 
            .I3(out_ep_data[7]), .O(cmd_state_next_3__N_765[1]));
    defparam i7_4_lut.LUT_INIT = 16'h0002;
    SB_LUT4 i10189_4_lut (.I0(cmd_state_next_3__N_753[1]), .I1(n14), .I2(cmd_state[3]), 
            .I3(cmd_state[0]), .O(n11476));
    defparam i10189_4_lut.LUT_INIT = 16'hc5ca;
    SB_LUT4 i2_2_lut (.I0(cmd_state_next_3__N_765[1]), .I1(out_ep_data[0]), 
            .I2(GND_net), .I3(GND_net), .O(cmd_state_next_3__N_765[0]));   // ../../../common/usb_spi_bridge_ep.v(166[18] 182[12])
    defparam i2_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i10190_4_lut (.I0(n5_adj_2042), .I1(n11476), .I2(cmd_state[3]), 
            .I3(cmd_state[1]), .O(n11477));
    defparam i10190_4_lut.LUT_INIT = 16'hcacc;
    SB_CARRY data_out_length_1257_add_4_4 (.CI(n9652), .I0(VCC_net), .I1(data_out_length[2]), 
            .CO(n9653));
    SB_LUT4 i10188_4_lut (.I0(cmd_state_next_3__N_753[1]), .I1(cmd_state[1]), 
            .I2(cmd_state_next_3__N_765[0]), .I3(cmd_state[0]), .O(n11475));
    defparam i10188_4_lut.LUT_INIT = 16'h7422;
    SB_LUT4 cmd_state_3__I_0_1042_Mux_0_i15_4_lut (.I0(n11475), .I1(n11477), 
            .I2(cmd_state[3]), .I3(cmd_state[2]), .O(cmd_state_next[0]));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam cmd_state_3__I_0_1042_Mux_0_i15_4_lut.LUT_INIT = 16'hccca;
    SB_LUT4 data_in_length_1255_add_4_15_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[13]), .I3(n9758), .O(n69_adj_2065[13])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_15_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1_4_lut_adj_220 (.I0(cmd_state_next_3__N_745[1]), .I1(n12050), 
            .I2(n8748), .I3(n4), .O(n19));   // ../../../common/usb_spi_bridge_ep.v(67[13:22])
    defparam i1_4_lut_adj_220.LUT_INIT = 16'heca0;
    SB_CARRY data_in_length_1255_add_4_15 (.CI(n9758), .I0(VCC_net), .I1(data_in_length[13]), 
            .CO(n9759));
    SB_LUT4 data_in_length_1255_add_4_14_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[12]), .I3(n9757), .O(n69_adj_2065[12])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_14_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 data_out_length_1257_add_4_10_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[8]), .I3(n9658), .O(n69[8])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_10_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i6_4_lut (.I0(data_out_length[12]), .I1(data_out_length[15]), 
            .I2(data_out_length[9]), .I3(data_out_length[14]), .O(n14_adj_2046));   // ../../../common/usb_spi_bridge_ep.v(236[13:37])
    defparam i6_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i6729_2_lut_rep_274 (.I0(cmd_state_next_3__N_753[1]), .I1(cmd_state[0]), 
            .I2(GND_net), .I3(GND_net), .O(n12115));
    defparam i6729_2_lut_rep_274.LUT_INIT = 16'h8888;
    SB_LUT4 i5_4_lut (.I0(data_out_length[10]), .I1(data_out_length[2]), 
            .I2(data_out_length[11]), .I3(data_out_length[7]), .O(n13));   // ../../../common/usb_spi_bridge_ep.v(236[13:37])
    defparam i5_4_lut.LUT_INIT = 16'hfffe;
    SB_DFFESR spi_out_data_i0 (.Q(spi_out_data[0]), .C(clk_48mhz), .E(n4076), 
            .D(out_ep_data[0]), .R(n12059));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    SB_LUT4 i5_4_lut_adj_221 (.I0(data_out_length[6]), .I1(data_out_length[0]), 
            .I2(n13), .I3(n14_adj_2046), .O(n14_adj_2047));   // ../../../common/usb_spi_bridge_ep.v(236[13:37])
    defparam i5_4_lut_adj_221.LUT_INIT = 16'hfffe;
    SB_LUT4 i6_4_lut_adj_222 (.I0(data_out_length[8]), .I1(data_out_length[5]), 
            .I2(data_out_length[3]), .I3(data_out_length[13]), .O(n15));   // ../../../common/usb_spi_bridge_ep.v(236[13:37])
    defparam i6_4_lut_adj_222.LUT_INIT = 16'hfffe;
    SB_LUT4 i8_4_lut (.I0(n15), .I1(data_out_length[1]), .I2(n14_adj_2047), 
            .I3(data_out_length[4]), .O(cmd_state_next_3__N_745[1]));   // ../../../common/usb_spi_bridge_ep.v(236[13:37])
    defparam i8_4_lut.LUT_INIT = 16'hfffe;
    SB_CARRY data_in_length_1255_add_4_14 (.CI(n9757), .I0(VCC_net), .I1(data_in_length[12]), 
            .CO(n9758));
    SB_LUT4 data_in_length_1255_add_4_13_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[11]), .I3(n9756), .O(n69_adj_2065[11])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_13_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_out_length_1257_add_4_10 (.CI(n9658), .I0(VCC_net), .I1(data_out_length[8]), 
            .CO(n9659));
    SB_CARRY data_in_length_1255_add_4_13 (.CI(n9756), .I0(VCC_net), .I1(data_in_length[11]), 
            .CO(n9757));
    SB_LUT4 data_in_length_1255_add_4_12_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[10]), .I3(n9755), .O(n69_adj_2065[10])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_12_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_in_length_1255_add_4_12 (.CI(n9755), .I0(VCC_net), .I1(data_in_length[10]), 
            .CO(n9756));
    SB_LUT4 data_in_length_1255_add_4_11_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[9]), .I3(n9754), .O(n69_adj_2065[9])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_11_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2324_3_lut (.I0(n69_adj_2065[15]), .I1(out_ep_data[7]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3437));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2324_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_out_length_1257_add_4_9_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[7]), .I3(n9657), .O(n69[7])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i10400_2_lut_3_lut_4_lut (.I0(cmd_state[3]), .I1(cmd_state[1]), 
            .I2(cmd_state[2]), .I3(cmd_state[0]), .O(n1121));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i10400_2_lut_3_lut_4_lut.LUT_INIT = 16'hfdff;
    SB_LUT4 i3_4_lut_adj_223 (.I0(n12041), .I1(spi_state[2]), .I2(n12028), 
            .I3(n1121), .O(n8));
    defparam i3_4_lut_adj_223.LUT_INIT = 16'h004c;
    SB_LUT4 i2322_3_lut (.I0(n69_adj_2065[14]), .I1(out_ep_data[6]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3435));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2322_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_2_lut_3_lut (.I0(cmd_state[3]), .I1(cmd_state[1]), .I2(cmd_state[0]), 
            .I3(GND_net), .O(n7_adj_2051));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h2020;
    SB_LUT4 i1_4_lut_adj_224 (.I0(spi_byte_in_xfr_ready), .I1(n115[3]), 
            .I2(n8), .I3(n12102), .O(spi_state_next[2]));
    defparam i1_4_lut_adj_224.LUT_INIT = 16'hccdc;
    SB_LUT4 i2320_3_lut (.I0(n69_adj_2065[13]), .I1(out_ep_data[5]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3433));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2320_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2318_3_lut (.I0(n69_adj_2065[12]), .I1(out_ep_data[4]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3431));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2318_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2316_3_lut (.I0(n69_adj_2065[11]), .I1(out_ep_data[3]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3429));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2316_3_lut.LUT_INIT = 16'hcaca;
    SB_CARRY data_in_length_1255_add_4_11 (.CI(n9754), .I0(VCC_net), .I1(data_in_length[9]), 
            .CO(n9755));
    SB_LUT4 i2314_3_lut (.I0(n69_adj_2065[10]), .I1(out_ep_data[2]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3427));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2314_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_in_length_1255_add_4_10_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[8]), .I3(n9753), .O(n69_adj_2065[8])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_10_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2312_3_lut (.I0(n69_adj_2065[9]), .I1(out_ep_data[1]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3425));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2312_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_3_lut (.I0(n1206), .I1(n10_adj_2053), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n4443));
    defparam i1_3_lut.LUT_INIT = 16'hc8c8;
    SB_CARRY data_in_length_1255_add_4_10 (.CI(n9753), .I0(VCC_net), .I1(data_in_length[8]), 
            .CO(n9754));
    SB_LUT4 data_out_length_1257_add_4_3_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[1]), .I3(n9651), .O(n69[1])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2310_3_lut (.I0(n69_adj_2065[8]), .I1(out_ep_data[0]), .I2(cmd_state[1]), 
            .I3(GND_net), .O(n3423));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2310_3_lut.LUT_INIT = 16'hcaca;
    SB_CARRY data_out_length_1257_add_4_9 (.CI(n9657), .I0(VCC_net), .I1(data_out_length[7]), 
            .CO(n9658));
    SB_CARRY data_out_length_1257_add_4_3 (.CI(n9651), .I0(VCC_net), .I1(data_out_length[1]), 
            .CO(n9652));
    SB_LUT4 i2307_3_lut (.I0(out_ep_data[7]), .I1(n69_adj_2065[7]), .I2(n1206), 
            .I3(GND_net), .O(n3420));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2307_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_in_length_1255_add_4_9_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[7]), .I3(n9752), .O(n69_adj_2065[7])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2305_3_lut (.I0(out_ep_data[6]), .I1(n69_adj_2065[6]), .I2(n1206), 
            .I3(GND_net), .O(n3418));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2305_3_lut.LUT_INIT = 16'hcaca;
    SB_CARRY data_in_length_1255_add_4_9 (.CI(n9752), .I0(VCC_net), .I1(data_in_length[7]), 
            .CO(n9753));
    SB_LUT4 i2303_3_lut (.I0(out_ep_data[5]), .I1(n69_adj_2065[5]), .I2(n1206), 
            .I3(GND_net), .O(n3416));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2303_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2301_3_lut (.I0(out_ep_data[4]), .I1(n69_adj_2065[4]), .I2(n1206), 
            .I3(GND_net), .O(n3414));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2301_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_in_length_1255_add_4_8_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[6]), .I3(n9751), .O(n69_adj_2065[6])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2299_3_lut (.I0(out_ep_data[3]), .I1(n69_adj_2065[3]), .I2(n1206), 
            .I3(GND_net), .O(n3412));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2299_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2297_3_lut (.I0(out_ep_data[2]), .I1(n69_adj_2065[2]), .I2(n1206), 
            .I3(GND_net), .O(n3410));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2297_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2295_3_lut (.I0(out_ep_data[1]), .I1(n69_adj_2065[1]), .I2(n1206), 
            .I3(GND_net), .O(n3408));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i2295_3_lut.LUT_INIT = 16'hcaca;
    SB_CARRY data_in_length_1255_add_4_8 (.CI(n9751), .I0(VCC_net), .I1(data_in_length[6]), 
            .CO(n9752));
    SB_LUT4 mux_964_i1_3_lut (.I0(spi_out_data[0]), .I1(out_ep_data[0]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[1]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i4749_4_lut (.I0(spi_state[2]), .I1(n11283), .I2(out_ep_data[1]), 
            .I3(n4_adj_2060), .O(spi_out_data_7__N_732[1]));   // ../../../common/tinyfpga_bootloader.v(101[14:25])
    defparam i4749_4_lut.LUT_INIT = 16'hc5c0;
    SB_LUT4 mux_964_i2_3_lut (.I0(spi_out_data[1]), .I1(out_ep_data[1]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[2]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i2_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_out_length_1257_add_4_2_lut (.I0(GND_net), .I1(GND_net), 
            .I2(data_out_length[0]), .I3(VCC_net), .O(n69[0])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 mux_964_i3_3_lut (.I0(spi_out_data[2]), .I1(out_ep_data[2]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[3]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i3_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_2_lut_3_lut_adj_225 (.I0(spi_state[1]), .I1(spi_state[0]), 
            .I2(spi_out_data_7__N_882[1]), .I3(GND_net), .O(n4_adj_2060));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_3_lut_adj_225.LUT_INIT = 16'h2020;
    SB_LUT4 data_in_length_1255_add_4_7_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[5]), .I3(n9750), .O(n69_adj_2065[5])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 mux_964_i4_3_lut (.I0(spi_out_data[3]), .I1(out_ep_data[3]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[4]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i4_3_lut.LUT_INIT = 16'hcaca;
    SB_CARRY data_in_length_1255_add_4_7 (.CI(n9750), .I0(VCC_net), .I1(data_in_length[5]), 
            .CO(n9751));
    SB_LUT4 mux_964_i5_3_lut (.I0(spi_out_data[4]), .I1(out_ep_data[4]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[5]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i5_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 mux_964_i6_3_lut (.I0(spi_out_data[5]), .I1(out_ep_data[5]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[6]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i6_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_in_length_1255_add_4_6_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[4]), .I3(n9749), .O(n69_adj_2065[4])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_in_length_1255_add_4_6 (.CI(n9749), .I0(VCC_net), .I1(data_in_length[4]), 
            .CO(n9750));
    SB_LUT4 data_in_length_1255_add_4_5_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[3]), .I3(n9748), .O(n69_adj_2065[3])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_in_length_1255_add_4_5 (.CI(n9748), .I0(VCC_net), .I1(data_in_length[3]), 
            .CO(n9749));
    SB_LUT4 mux_964_i7_3_lut (.I0(spi_out_data[6]), .I1(out_ep_data[6]), 
            .I2(get_spi_out_data_q), .I3(GND_net), .O(spi_out_data_7__N_882[7]));   // ../../../common/usb_spi_bridge_ep.v(414[16] 416[10])
    defparam mux_964_i7_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 data_in_length_1255_add_4_4_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[2]), .I3(n9747), .O(n69_adj_2065[2])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2_2_lut_3_lut (.I0(spi_state[1]), .I1(spi_state[0]), .I2(spi_state[2]), 
            .I3(GND_net), .O(n8_adj_2061));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i2_2_lut_3_lut.LUT_INIT = 16'h1010;
    SB_LUT4 i1_3_lut_rep_184_4_lut (.I0(spi_state[1]), .I1(spi_state[0]), 
            .I2(spi_state[2]), .I3(n33), .O(n12025));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_3_lut_rep_184_4_lut.LUT_INIT = 16'h1110;
    SB_LUT4 i1_2_lut_rep_261 (.I0(spi_state[1]), .I1(spi_state[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12102));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_rep_261.LUT_INIT = 16'heeee;
    SB_LUT4 i1333_2_lut_rep_181_4_lut (.I0(n33), .I1(n12102), .I2(spi_state[2]), 
            .I3(spi_get_bit_q), .O(n12022));   // ../../../common/usb_spi_bridge_ep.v(68[13:27])
    defparam i1333_2_lut_rep_181_4_lut.LUT_INIT = 16'hff32;
    SB_LUT4 i6_2_lut (.I0(data_in_length[7]), .I1(data_in_length[12]), .I2(GND_net), 
            .I3(GND_net), .O(n22));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i6_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i12_4_lut (.I0(data_in_length[5]), .I1(data_in_length[4]), .I2(data_in_length[13]), 
            .I3(data_in_length[6]), .O(n28));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i12_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i2_2_lut_adj_226 (.I0(data_in_length[11]), .I1(data_in_length[8]), 
            .I2(GND_net), .I3(GND_net), .O(n18));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i2_2_lut_adj_226.LUT_INIT = 16'heeee;
    SB_LUT4 i10_4_lut (.I0(data_in_length[9]), .I1(data_in_length[3]), .I2(data_in_length[2]), 
            .I3(data_in_length[1]), .O(n26));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i10_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i14_4_lut (.I0(data_in_length[15]), .I1(n28), .I2(n22), .I3(data_in_length[14]), 
            .O(n30));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i14_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_2_lut_adj_227 (.I0(data_in_length[0]), .I1(data_in_length[10]), 
            .I2(GND_net), .I3(GND_net), .O(n17));   // ../../../common/usb_spi_bridge_ep.v(237[15:38])
    defparam i1_2_lut_adj_227.LUT_INIT = 16'heeee;
    SB_CARRY data_in_length_1255_add_4_4 (.CI(n9747), .I0(VCC_net), .I1(data_in_length[2]), 
            .CO(n9748));
    SB_LUT4 data_in_length_1255_add_4_3_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_in_length[1]), .I3(n9746), .O(n69_adj_2065[1])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_in_length_1255_add_4_3 (.CI(n9746), .I0(VCC_net), .I1(data_in_length[1]), 
            .CO(n9747));
    SB_LUT4 data_in_length_1255_add_4_2_lut (.I0(GND_net), .I1(GND_net), 
            .I2(data_in_length[0]), .I3(VCC_net), .O(n69_adj_2065[0])) /* synthesis syn_instantiated=1 */ ;
    defparam data_in_length_1255_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_in_length_1255_add_4_2 (.CI(VCC_net), .I0(GND_net), .I1(data_in_length[0]), 
            .CO(n9746));
    SB_LUT4 data_out_length_1257_add_4_8_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[6]), .I3(n9656), .O(n69[6])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1774_2_lut_3_lut (.I0(spi_get_bit_q), .I1(n12025), .I2(spi_bit_counter[0]), 
            .I3(GND_net), .O(n2[0]));
    defparam i1774_2_lut_3_lut.LUT_INIT = 16'h1e1e;
    SB_CARRY data_out_length_1257_add_4_2 (.CI(VCC_net), .I0(GND_net), .I1(data_out_length[0]), 
            .CO(n9651));
    SB_LUT4 data_out_length_1257_add_4_17_lut (.I0(GND_net), .I1(VCC_net), 
            .I2(data_out_length[15]), .I3(n9665), .O(n69[15])) /* synthesis syn_instantiated=1 */ ;
    defparam data_out_length_1257_add_4_17_lut.LUT_INIT = 16'hC33C;
    SB_CARRY data_out_length_1257_add_4_8 (.CI(n9656), .I0(VCC_net), .I1(data_out_length[6]), 
            .CO(n9657));
    SB_LUT4 i10412_4_lut (.I0(cmd_state[3]), .I1(n7_adj_2051), .I2(cmd_state[2]), 
            .I3(n8_adj_2061), .O(n11301));
    defparam i10412_4_lut.LUT_INIT = 16'hf7ff;
    SB_LUT4 i2_4_lut_adj_228 (.I0(cmd_state[0]), .I1(get_cmd_out_data), 
            .I2(cmd_state[1]), .I3(cmd_state[3]), .O(n11111));   // ../../../common/usb_spi_bridge_ep.v(280[5] 285[8])
    defparam i2_4_lut_adj_228.LUT_INIT = 16'h0048;
    SB_LUT4 i18_4_lut (.I0(n10771), .I1(n11111), .I2(cmd_state[2]), .I3(n7_adj_2051), 
            .O(n10_adj_2053));   // ../../../common/usb_spi_bridge_ep.v(280[5] 285[8])
    defparam i18_4_lut.LUT_INIT = 16'hcac0;
    SB_LUT4 i10358_2_lut (.I0(cmd_state[1]), .I1(n10_adj_2053), .I2(GND_net), 
            .I3(GND_net), .O(n4187));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i10358_2_lut.LUT_INIT = 16'h4444;
    SB_LUT4 i1974_3_lut (.I0(out_ep_data[0]), .I1(n69_adj_2065[0]), .I2(n1206), 
            .I3(GND_net), .O(n3083));   // ../../../common/usb_spi_bridge_ep.v(283[39:61])
    defparam i1974_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1869_3_lut (.I0(out_ep_data[1]), .I1(n69[1]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2972));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1869_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1866_3_lut (.I0(out_ep_data[2]), .I1(n69[2]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2969));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1866_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1864_3_lut (.I0(out_ep_data[3]), .I1(n69[3]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2967));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1864_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1862_3_lut (.I0(out_ep_data[4]), .I1(n69[4]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2965));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1862_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1860_3_lut (.I0(out_ep_data[5]), .I1(n69[5]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2963));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1860_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1858_3_lut (.I0(out_ep_data[6]), .I1(n69[6]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2961));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1858_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1856_3_lut (.I0(out_ep_data[7]), .I1(n69[7]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2959));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1856_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1853_3_lut (.I0(out_ep_data[0]), .I1(n69[8]), .I2(n1247), 
            .I3(GND_net), .O(n2956));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1853_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1851_3_lut (.I0(out_ep_data[1]), .I1(n69[9]), .I2(n1247), 
            .I3(GND_net), .O(n2954));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1851_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1849_3_lut (.I0(out_ep_data[2]), .I1(n69[10]), .I2(n1247), 
            .I3(GND_net), .O(n2952));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1849_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1847_3_lut (.I0(out_ep_data[3]), .I1(n69[11]), .I2(n1247), 
            .I3(GND_net), .O(n2950));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1847_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1845_3_lut (.I0(out_ep_data[4]), .I1(n69[12]), .I2(n1247), 
            .I3(GND_net), .O(n2948));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1845_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1843_3_lut (.I0(out_ep_data[5]), .I1(n69[13]), .I2(n1247), 
            .I3(GND_net), .O(n2946));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1843_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2_3_lut_4_lut_adj_229 (.I0(spi_state[2]), .I1(spi_state[0]), 
            .I2(spi_out_data_7__N_882[1]), .I3(spi_state[1]), .O(n11283));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i2_3_lut_4_lut_adj_229.LUT_INIT = 16'hfeff;
    SB_LUT4 i1_2_lut_rep_218_3_lut (.I0(spi_state[2]), .I1(spi_state[0]), 
            .I2(spi_state[1]), .I3(GND_net), .O(n12059));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_rep_218_3_lut.LUT_INIT = 16'h1010;
    SB_LUT4 i1_2_lut_3_lut_4_lut (.I0(spi_state[2]), .I1(spi_state[0]), 
            .I2(get_spi_out_data_q), .I3(spi_state[1]), .O(n4076));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_3_lut_4_lut.LUT_INIT = 16'hf1f0;
    SB_LUT4 i1841_3_lut (.I0(out_ep_data[6]), .I1(n69[14]), .I2(n1247), 
            .I3(GND_net), .O(n2944));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1841_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i2_3_lut_adj_230 (.I0(cmd_state[3]), .I1(n10_adj_2040), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n2985));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i2_3_lut_adj_230.LUT_INIT = 16'h4040;
    SB_LUT4 i3455_2_lut_3_lut_4_lut (.I0(spi_state[2]), .I1(spi_state[0]), 
            .I2(get_spi_out_data_q), .I3(spi_state[1]), .O(n4579));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i3455_2_lut_3_lut_4_lut.LUT_INIT = 16'he0f0;
    SB_LUT4 i1839_3_lut (.I0(out_ep_data[7]), .I1(n69[15]), .I2(n1247), 
            .I3(GND_net), .O(n2942));   // ../../../common/usb_spi_bridge_ep.v(282[41:64])
    defparam i1839_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_2_lut_rep_244 (.I0(spi_state[2]), .I1(spi_state[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12085));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_rep_244.LUT_INIT = 16'heeee;
    SB_LUT4 i6443_2_lut (.I0(cmd_state_next_3__N_765[1]), .I1(cmd_state[0]), 
            .I2(GND_net), .I3(GND_net), .O(n1));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i6443_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i1_2_lut_adj_231 (.I0(cmd_state[0]), .I1(cmd_state_next_3__N_745[1]), 
            .I2(GND_net), .I3(GND_net), .O(n5));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_2_lut_adj_231.LUT_INIT = 16'hdddd;
    SB_LUT4 i21_4_lut_3_lut (.I0(cmd_state[1]), .I1(cmd_state[0]), .I2(cmd_state[2]), 
            .I3(GND_net), .O(n10));
    defparam i21_4_lut_3_lut.LUT_INIT = 16'h1818;
    SB_LUT4 i2_3_lut_4_lut_adj_232 (.I0(spi_state[2]), .I1(spi_state[0]), 
            .I2(spi_state[1]), .I3(spi_state_next_2__N_776[1]), .O(n10771));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i2_3_lut_4_lut_adj_232.LUT_INIT = 16'h0040;
    SB_LUT4 i1_2_lut_rep_242 (.I0(spi_state[2]), .I1(spi_state[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12083));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_2_lut_rep_242.LUT_INIT = 16'hbbbb;
    SB_LUT4 i1442_3_lut_4_lut (.I0(spi_bit_counter[1]), .I1(spi_bit_counter[0]), 
            .I2(spi_bit_counter[2]), .I3(spi_bit_counter[3]), .O(n1412[3]));
    defparam i1442_3_lut_4_lut.LUT_INIT = 16'h7f80;
    SB_LUT4 i1435_2_lut_3_lut (.I0(spi_bit_counter[1]), .I1(spi_bit_counter[0]), 
            .I2(spi_bit_counter[2]), .I3(GND_net), .O(n1412[2]));
    defparam i1435_2_lut_3_lut.LUT_INIT = 16'h7878;
    SB_LUT4 i3_3_lut_4_lut (.I0(spi_bit_counter[1]), .I1(spi_bit_counter[0]), 
            .I2(spi_bit_counter[2]), .I3(spi_bit_counter[3]), .O(spi_state_next_2__N_776[1]));
    defparam i3_3_lut_4_lut.LUT_INIT = 16'hff7f;
    SB_LUT4 i1_2_lut_rep_200_3_lut_4_lut (.I0(cmd_state[0]), .I1(cmd_state[1]), 
            .I2(cmd_state[3]), .I3(cmd_state[2]), .O(n12041));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i1_2_lut_rep_200_3_lut_4_lut.LUT_INIT = 16'hf8f0;
    SB_LUT4 i1_2_lut_3_lut_4_lut_adj_233 (.I0(cmd_state[0]), .I1(cmd_state[1]), 
            .I2(cmd_state[3]), .I3(cmd_state[2]), .O(n8748));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i1_2_lut_3_lut_4_lut_adj_233.LUT_INIT = 16'h0800;
    SB_LUT4 i804_2_lut_rep_215_3_lut (.I0(cmd_state[0]), .I1(cmd_state[1]), 
            .I2(cmd_state[2]), .I3(GND_net), .O(n12056));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i804_2_lut_rep_215_3_lut.LUT_INIT = 16'h8080;
    SB_LUT4 i2_3_lut_4_lut_adj_234 (.I0(cmd_state[0]), .I1(cmd_state[1]), 
            .I2(cmd_state[3]), .I3(n115[3]), .O(n1247));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i2_3_lut_4_lut_adj_234.LUT_INIT = 16'h0800;
    SB_LUT4 i2186_2_lut_rep_241 (.I0(cmd_state[0]), .I1(cmd_state[1]), .I2(GND_net), 
            .I3(GND_net), .O(n12082));   // ../../../common/usb_spi_bridge_ep.v(149[5] 265[12])
    defparam i2186_2_lut_rep_241.LUT_INIT = 16'h8888;
    SB_LUT4 i2_3_lut_4_lut_adj_235 (.I0(cmd_state[0]), .I1(cmd_state[2]), 
            .I2(n115[3]), .I3(cmd_state[3]), .O(n1206));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i2_3_lut_4_lut_adj_235.LUT_INIT = 16'h2000;
    SB_LUT4 i1_2_lut_rep_214_3_lut (.I0(cmd_state[0]), .I1(cmd_state[2]), 
            .I2(cmd_state[1]), .I3(GND_net), .O(n12055));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_2_lut_rep_214_3_lut.LUT_INIT = 16'h0202;
    SB_LUT4 i6559_2_lut_3_lut_4_lut (.I0(cmd_state[0]), .I1(cmd_state[2]), 
            .I2(n12050), .I3(cmd_state[1]), .O(n14));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i6559_2_lut_3_lut_4_lut.LUT_INIT = 16'h0020;
    SB_LUT4 i1_2_lut_3_lut_4_lut_adj_236 (.I0(cmd_state[0]), .I1(cmd_state[2]), 
            .I2(cmd_state[3]), .I3(cmd_state[1]), .O(n3840));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_2_lut_3_lut_4_lut_adj_236.LUT_INIT = 16'h0002;
    SB_LUT4 i1_2_lut_rep_240 (.I0(cmd_state[0]), .I1(cmd_state[2]), .I2(GND_net), 
            .I3(GND_net), .O(n12081));   // ../../../common/usb_spi_bridge_ep.v(268[10] 287[6])
    defparam i1_2_lut_rep_240.LUT_INIT = 16'h2222;
    SB_LUT4 i2_3_lut_4_lut_adj_237 (.I0(spi_state[1]), .I1(spi_state[0]), 
            .I2(spi_state_next_2__N_776[1]), .I3(spi_state[2]), .O(n115[3]));   // ../../../common/usb_spi_bridge_ep.v(91[13:22])
    defparam i2_3_lut_4_lut_adj_237.LUT_INIT = 16'h0008;
    SB_LUT4 n11748_bdd_4_lut_4_lut (.I0(n12115), .I1(cmd_state[2]), .I2(n1), 
            .I3(n11748), .O(n11751));
    defparam n11748_bdd_4_lut_4_lut.LUT_INIT = 16'hdd30;
    SB_LUT4 i1_3_lut_adj_238 (.I0(sof_valid), .I1(cout), .I2(host_presence_timeout), 
            .I3(GND_net), .O(n4566));   // ../../../common/tinyfpga_bootloader.v(138[8:17])
    defparam i1_3_lut_adj_238.LUT_INIT = 16'h7373;
    SB_LUT4 i10416_4_lut_4_lut_4_lut (.I0(spi_state[2]), .I1(spi_state[1]), 
            .I2(spi_state[0]), .I3(pin_32_sck_c), .O(pin_32_sck_c));
    defparam i10416_4_lut_4_lut_4_lut.LUT_INIT = 16'hbf17;
    SB_LUT4 i10414_4_lut_4_lut (.I0(pin_30_cs_c), .I1(spi_state[1]), .I2(spi_state[0]), 
            .I3(spi_state[2]), .O(pin_30_cs_c));   // ../../../common/usb_spi_bridge_ep.v(292[3] 392[6])
    defparam i10414_4_lut_4_lut.LUT_INIT = 16'ha803;
    SB_LUT4 i1_4_lut_4_lut_4_lut (.I0(spi_state[1]), .I1(spi_state[0]), 
            .I2(spi_state_next_2__N_776[1]), .I3(n19), .O(n3));   // ../../../common/usb_spi_bridge_ep.v(399[10] 420[6])
    defparam i1_4_lut_4_lut_4_lut.LUT_INIT = 16'he6a2;
    
endmodule
//
// Verilog Description of module \usb_fs_pe(NUM_OUT_EPS=5'b010,NUM_IN_EPS=5'b011) 
//

module \usb_fs_pe(NUM_OUT_EPS=5'b010,NUM_IN_EPS=5'b011)  (GND_net, clk_48mhz, 
            usb_n_tx, usb_tx_en, usb_p_tx, pin_usbn_out, pin_usbp_out, 
            n4095, n12027, n12036, n12030, \ep_state[0] , n1292, 
            \ep_get_addr[0][0] , n12020, \ep_state_next_0__1__N_1331[1] , 
            n10912, \ep_get_addr[1][2] , \ep_get_addr[0][1] , \ep_get_addr[1][1] , 
            \ep_get_addr[1][0] , \ep_state_next_0__1__N_1331[0] , out_ep_data, 
            VCC_net, ctrl_out_ep_setup, n11542, n8, n8_adj_2, ep_state_next_1__1__N_1228, 
            \ctrl_xfr_state_next_5__N_168[2] , out_ep_data_valid, n12017, 
            n12049, get_spi_out_data, serial_out_ep_grant, get_cmd_out_data, 
            ctrl_in_ep_stall, \in_ep_num_1__N_1088[0] , in_ep_req_0__N_914, 
            ctrl_in_ep_data_put, \ctrl_xfr_state[2] , all_data_sent, serial_in_ep_data_done, 
            n5, n5383, in_q, \ctrl_xfr_state[0] , \ctrl_xfr_state[1] , 
            n1854, n12112, \ctrl_xfr_state_next_5__N_150[0] , n1289, 
            \bytes_sent[7] , n3826, n14, n10174, n11064, dev_addr, 
            n12007, n10212, has_data_stage, n1857, status_stage_end, 
            save_dev_addr, n275, sof_valid, serial_in_ep_req, serial_in_ep_data, 
            ctrl_in_ep_data, spi_byte_in_xfr_ready) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input clk_48mhz;
    output usb_n_tx;
    output usb_tx_en;
    output usb_p_tx;
    input pin_usbn_out;
    input pin_usbp_out;
    input n4095;
    output n12027;
    output n12036;
    output n12030;
    output [1:0]\ep_state[0] ;
    input n1292;
    output \ep_get_addr[0][0] ;
    input n12020;
    output \ep_state_next_0__1__N_1331[1] ;
    output n10912;
    output \ep_get_addr[1][2] ;
    output \ep_get_addr[0][1] ;
    output \ep_get_addr[1][1] ;
    output \ep_get_addr[1][0] ;
    output \ep_state_next_0__1__N_1331[0] ;
    output [7:0]out_ep_data;
    input VCC_net;
    output ctrl_out_ep_setup;
    output n11542;
    output n8;
    output n8_adj_2;
    input ep_state_next_1__1__N_1228;
    output \ctrl_xfr_state_next_5__N_168[2] ;
    input out_ep_data_valid;
    output n12017;
    output n12049;
    input get_spi_out_data;
    output serial_out_ep_grant;
    input get_cmd_out_data;
    input ctrl_in_ep_stall;
    input \in_ep_num_1__N_1088[0] ;
    input in_ep_req_0__N_914;
    output ctrl_in_ep_data_put;
    input \ctrl_xfr_state[2] ;
    output all_data_sent;
    input serial_in_ep_data_done;
    input n5;
    input n5383;
    input in_q;
    input \ctrl_xfr_state[0] ;
    input \ctrl_xfr_state[1] ;
    input n1854;
    output n12112;
    output \ctrl_xfr_state_next_5__N_150[0] ;
    input n1289;
    input \bytes_sent[7] ;
    input n3826;
    input n14;
    output n10174;
    output n11064;
    input [6:0]dev_addr;
    input n12007;
    output n10212;
    input has_data_stage;
    output n1857;
    output status_stage_end;
    input save_dev_addr;
    output n275;
    output sof_valid;
    input serial_in_ep_req;
    input [7:0]serial_in_ep_data;
    input [7:0]ctrl_in_ep_data;
    output spi_byte_in_xfr_ready;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    
    wire rx_pkt_end, rx_pkt_valid, n12108, n3, ack_received, n4, 
        n3407, n12074;
    wire [7:0]se0_shift_reg;   // ../../../common/usb_fs_tx.v(61[13:26])
    
    wire n3405;
    wire [3:0]in_tx_pid;   // ../../../common/usb_fs_pe.v(85[14:23])
    
    wire n12105, n3080, n4212, n12072;
    wire [2:0]bit_count_2__N_1895;
    wire [2:0]bit_count;   // ../../../common/usb_fs_tx.v(41[13:22])
    
    wire n12040, n12053, tx_data_avail, n4562;
    wire [2:0]dp_eop;   // ../../../common/usb_fs_tx.v(212[13:19])
    
    wire n12035, n12079;
    wire [7:0]tx_data;   // ../../../common/usb_fs_pe.v(95[14:21])
    
    wire n12097;
    wire [3:0]rx_pid;   // ../../../common/usb_fs_pe.v(75[14:20])
    
    wire n12029, n12103, n12104, n12015, n12000;
    wire [7:0]rx_data;   // ../../../common/usb_fs_pe.v(80[14:21])
    
    wire rx_data_put;
    wire [6:0]rx_addr;   // ../../../common/usb_fs_pe.v(76[14:21])
    wire [3:0]rx_endp;   // ../../../common/usb_fs_pe.v(77[14:21])
    
    wire n12024, n12107, token_received_N_1149, n12057, n11210, n12106, 
        n10867, n10901;
    wire [1:0]\ep_state[1] ;   // ../../../common/usb_fs_out_pe.v(55[13:21])
    
    wire n12001;
    wire [3:0]out_ep_num;   // ../../../common/usb_fs_out_pe.v(80[13:23])
    wire [1:0]out_xfr_state;   // ../../../common/usb_fs_out_pe.v(67[13:26])
    
    wire n11451, n12005, n41, n12073, n12011, n12060;
    wire [7:0]arb_in_ep_data;   // ../../../common/usb_fs_pe.v(69[14:28])
    
    SB_LUT4 i2_3_lut_4_lut (.I0(rx_pkt_end), .I1(rx_pkt_valid), .I2(n12108), 
            .I3(n3), .O(ack_received));   // ../../../common/usb_fs_pe.v(98[22:48])
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h0008;
    SB_LUT4 i1_2_lut_3_lut_2_lut (.I0(rx_pkt_end), .I1(rx_pkt_valid), .I2(GND_net), 
            .I3(GND_net), .O(n4));   // ../../../common/usb_fs_pe.v(98[22:48])
    defparam i1_2_lut_3_lut_2_lut.LUT_INIT = 16'h8888;
    usb_fs_tx usb_fs_tx_inst (.n3407(n3407), .n12074(n12074), .clk_48mhz(clk_48mhz), 
            .\se0_shift_reg[0] (se0_shift_reg[0]), .usb_n_tx(usb_n_tx), 
            .n3405(n3405), .\in_tx_pid[1] (in_tx_pid[1]), .n12105(n12105), 
            .n3080(n3080), .n4212(n4212), .n12072(n12072), .\bit_count_2__N_1895[0] (bit_count_2__N_1895[0]), 
            .bit_count({Open_0, Open_1, bit_count[0]}), .n12040(n12040), 
            .n12053(n12053), .usb_tx_en(usb_tx_en), .GND_net(GND_net), 
            .tx_data_avail(tx_data_avail), .n4562(n4562), .\dp_eop[2] (dp_eop[2]), 
            .usb_p_tx(usb_p_tx), .n12035(n12035), .n12079(n12079), .tx_data({tx_data}), 
            .n12097(n12097)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(218[13] 231[4])
    usb_fs_rx usb_fs_rx_inst (.rx_pid({rx_pid}), .clk_48mhz(clk_48mhz), 
            .n12029(n12029), .n12103(n12103), .n12104(n12104), .n12015(n12015), 
            .n12000(n12000), .GND_net(GND_net), .rx_data({rx_data}), .rx_data_put(rx_data_put), 
            .rx_addr({rx_addr}), .rx_endp({rx_endp}), .pin_usbn_out(pin_usbn_out), 
            .usb_tx_en(usb_tx_en), .rx_pkt_end(rx_pkt_end), .pin_usbp_out(pin_usbp_out), 
            .rx_pkt_valid(rx_pkt_valid), .n12024(n12024), .n12107(n12107), 
            .token_received_N_1149(token_received_N_1149), .n12057(n12057), 
            .n11210(n11210), .n3(n3), .\se0_shift_reg[0] (se0_shift_reg[0]), 
            .n12079(n12079), .n12105(n12105), .n12106(n12106), .n12053(n12053), 
            .n4212(n4212), .\bit_count[0] (bit_count[0]), .n12072(n12072), 
            .\bit_count_2__N_1895[0] (bit_count_2__N_1895[0]), .\dp_eop[2] (dp_eop[2]), 
            .n4562(n4562), .n12097(n12097), .n10867(n10867), .n10901(n10901)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(187[13] 202[4])
    \usb_fs_out_pe(NUM_OUT_EPS=5'b010)  usb_fs_out_pe_inst (.n4095(n4095), 
            .clk_48mhz(clk_48mhz), .n12027(n12027), .n12036(n12036), .n12030(n12030), 
            .rx_endp({rx_endp}), .\ep_state[1] ({\ep_state[1] }), .n12105(n12105), 
            .GND_net(GND_net), .\ep_state[0] ({\ep_state[0] }), .n1292(n1292), 
            .\ep_get_addr[0][0] (\ep_get_addr[0][0] ), .n12020(n12020), 
            .\ep_state_next_0__1__N_1331[1] (\ep_state_next_0__1__N_1331[1] ), 
            .n10912(n10912), .n11210(n11210), .n12001(n12001), .\out_ep_num[0] (out_ep_num[0]), 
            .\ep_get_addr[1][2] (\ep_get_addr[1][2] ), .\ep_get_addr[0][1] (\ep_get_addr[0][1] ), 
            .\ep_get_addr[1][1] (\ep_get_addr[1][1] ), .\ep_get_addr[1][0] (\ep_get_addr[1][0] ), 
            .\ep_state_next_0__1__N_1331[0] (\ep_state_next_0__1__N_1331[0] ), 
            .rx_data({rx_data}), .out_ep_data({out_ep_data}), .VCC_net(VCC_net), 
            .ctrl_out_ep_setup(ctrl_out_ep_setup), .out_xfr_state({out_xfr_state}), 
            .n12015(n12015), .n12104(n12104), .n11451(n11451), .n11542(n11542), 
            .n8(n8), .n8_adj_1(n8_adj_2), .n12005(n12005), .n12057(n12057), 
            .ep_state_next_1__1__N_1228(ep_state_next_1__1__N_1228), .\ctrl_xfr_state_next_5__N_168[2] (\ctrl_xfr_state_next_5__N_168[2] ), 
            .\in_tx_pid[0] (in_tx_pid[0]), .n3080(n3080), .\in_tx_pid[2] (in_tx_pid[2]), 
            .n3405(n3405), .\in_tx_pid[3] (in_tx_pid[3]), .n3407(n3407), 
            .n41(n41), .n12029(n12029), .out_ep_data_valid(out_ep_data_valid), 
            .n12017(n12017), .rx_data_put(rx_data_put), .n12049(n12049), 
            .n12106(n12106), .n12072(n12072), .n12097(n12097), .n12035(n12035), 
            .n12040(n12040), .n12073(n12073), .n12011(n12011), .n12060(n12060), 
            .n4(n4), .n12000(n12000)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(157[5] 185[4])
    \usb_fs_out_arb(NUM_OUT_EPS=5'b010)  usb_fs_out_arb_inst (.get_spi_out_data(get_spi_out_data), 
            .serial_out_ep_grant(serial_out_ep_grant), .get_cmd_out_data(get_cmd_out_data), 
            .\out_ep_num[0] (out_ep_num[0]), .GND_net(GND_net), .n12020(n12020), 
            .\ep_state[1] ({\ep_state[1] }), .ep_state_next_1__1__N_1228(ep_state_next_1__1__N_1228)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(116[5] 120[4])
    \usb_fs_in_pe(NUM_IN_EPS=5'b011)  usb_fs_in_pe_inst (.rx_endp({rx_endp}), 
            .clk_48mhz(clk_48mhz), .rx_pid({rx_pid}), .rx_pkt_valid(rx_pkt_valid), 
            .rx_pkt_end(rx_pkt_end), .n41(n41), .ctrl_in_ep_stall(ctrl_in_ep_stall), 
            .\in_ep_num_1__N_1088[0] (\in_ep_num_1__N_1088[0] ), .GND_net(GND_net), 
            .arb_in_ep_data({arb_in_ep_data}), .tx_data({tx_data}), .VCC_net(VCC_net), 
            .in_ep_req_0__N_914(in_ep_req_0__N_914), .ctrl_in_ep_data_put(ctrl_in_ep_data_put), 
            .ack_received(ack_received), .\ctrl_xfr_state[2] (\ctrl_xfr_state[2] ), 
            .all_data_sent(all_data_sent), .n11210(n11210), .tx_data_avail(tx_data_avail), 
            .serial_in_ep_data_done(serial_in_ep_data_done), .n5(n5), .n5383(n5383), 
            .in_q(in_q), .\ctrl_xfr_state[0] (\ctrl_xfr_state[0] ), .\ctrl_xfr_state[1] (\ctrl_xfr_state[1] ), 
            .\ctrl_xfr_state_next_5__N_168[2] (\ctrl_xfr_state_next_5__N_168[2] ), 
            .n1854(n1854), .n12112(n12112), .out_ep_data_valid(out_ep_data_valid), 
            .ctrl_out_ep_setup(ctrl_out_ep_setup), .n12020(n12020), .\ctrl_xfr_state_next_5__N_150[0] (\ctrl_xfr_state_next_5__N_150[0] ), 
            .n1289(n1289), .\bytes_sent[7] (\bytes_sent[7] ), .n3826(n3826), 
            .n14(n14), .n12073(n12073), .n10174(n10174), .n11451(n11451), 
            .n12108(n12108), .n11064(n11064), .token_received_N_1149(token_received_N_1149), 
            .n12103(n12103), .n10867(n10867), .rx_addr({rx_addr}), .dev_addr({dev_addr}), 
            .in_tx_pid({in_tx_pid}), .out_xfr_state({out_xfr_state}), .n12074(n12074), 
            .n12106(n12106), .n12024(n12024), .n12015(n12015), .n12001(n12001), 
            .n12007(n12007), .n10212(n10212), .n12104(n12104), .has_data_stage(has_data_stage), 
            .n12017(n12017), .n1857(n1857), .status_stage_end(status_stage_end), 
            .save_dev_addr(save_dev_addr), .n275(n275), .n4(n4), .n12107(n12107), 
            .sof_valid(sof_valid), .n10901(n10901), .n12060(n12060), .n12011(n12011), 
            .n12005(n12005)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(124[5] 153[4])
    \usb_fs_in_arb(NUM_IN_EPS=5'b011)  usb_fs_in_arb_inst (.serial_in_ep_req(serial_in_ep_req), 
            .in_ep_req_0__N_914(in_ep_req_0__N_914), .serial_in_ep_data({serial_in_ep_data}), 
            .ctrl_in_ep_data({ctrl_in_ep_data}), .arb_in_ep_data({arb_in_ep_data}), 
            .n11064(n11064), .spi_byte_in_xfr_ready(spi_byte_in_xfr_ready), 
            .GND_net(GND_net)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_fs_pe.v(104[5] 112[4])
    
endmodule
//
// Verilog Description of module usb_fs_tx
//

module usb_fs_tx (n3407, n12074, clk_48mhz, \se0_shift_reg[0] , usb_n_tx, 
            n3405, \in_tx_pid[1] , n12105, n3080, n4212, n12072, 
            \bit_count_2__N_1895[0] , bit_count, n12040, n12053, usb_tx_en, 
            GND_net, tx_data_avail, n4562, \dp_eop[2] , usb_p_tx, 
            n12035, n12079, tx_data, n12097) /* synthesis syn_module_defined=1 */ ;
    input n3407;
    input n12074;
    input clk_48mhz;
    output \se0_shift_reg[0] ;
    output usb_n_tx;
    input n3405;
    input \in_tx_pid[1] ;
    input n12105;
    input n3080;
    input n4212;
    output n12072;
    input \bit_count_2__N_1895[0] ;
    output [2:0]bit_count;
    input n12040;
    input n12053;
    output usb_tx_en;
    input GND_net;
    input tx_data_avail;
    input n4562;
    output \dp_eop[2] ;
    output usb_p_tx;
    input n12035;
    input n12079;
    input [7:0]tx_data;
    input n12097;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    wire [3:0]pidq;   // ../../../common/usb_fs_tx.v(30[13:17])
    wire [5:0]bit_history;   // ../../../common/usb_fs_tx.v(44[14:25])
    
    wire n11107, n12047, byte_strobe, n11249, n2828, data_payload;
    wire [2:0]n2403;
    
    wire n4137;
    wire [31:0]pkt_state;   // ../../../common/usb_fs_tx.v(72[14:23])
    
    wire bitstuff_q, bitstuff_qq, bitstuff_qqq, bitstuff_qqqq, n7496;
    wire [7:0]oe_shift_reg_7__N_1629;
    
    wire n4150;
    wire [7:0]oe_shift_reg;   // ../../../common/usb_fs_tx.v(60[13:25])
    wire [7:0]se0_shift_reg_7__N_1637;
    
    wire crc16_15__N_1967, n4152;
    wire [15:0]crc16;   // ../../../common/usb_fs_tx.v(184[14:19])
    
    wire n7490;
    wire [2:0]dp_eop;   // ../../../common/usb_fs_tx.v(212[13:19])
    
    wire crc16_15__N_1968;
    wire [7:0]se0_shift_reg_7__N_1943;
    wire [7:0]se0_shift_reg;   // ../../../common/usb_fs_tx.v(61[13:26])
    wire [7:0]oe_shift_reg_7__N_1927;
    
    wire n10264, n11138, n6, n12094;
    wire [4:0]bit_history_q;   // ../../../common/usb_fs_tx.v(43[13:26])
    
    wire n11394, n10;
    wire [2:0]bit_count_c;   // ../../../common/usb_fs_tx.v(41[13:22])
    wire [7:0]bit_history_5__N_1621;
    
    wire n4340;
    wire [7:0]data_shift_reg;   // ../../../common/usb_fs_tx.v(59[13:27])
    
    wire n7652, n7650, n7597;
    wire [7:0]n874;
    wire [7:0]bit_history_5__N_1911;
    
    wire n7555, n1051, n12117, crc16_invert, dp_N_1983, n12048;
    wire [7:0]n852;
    
    wire n2607, n929, n12080, n7551, n4;
    wire [2:0]n2390;
    
    wire n7, n11483, n3, n7873, n7789, n7874;
    wire [2:0]n2399;
    
    SB_DFFE pidq_i0_i3 (.Q(pidq[3]), .C(clk_48mhz), .E(n12074), .D(n3407));   // ../../../common/usb_fs_tx.v(32[10] 36[6])
    SB_LUT4 i10331_4_lut (.I0(\se0_shift_reg[0] ), .I1(n12074), .I2(usb_n_tx), 
            .I3(bit_history[5]), .O(n11107));
    defparam i10331_4_lut.LUT_INIT = 16'h1001;
    SB_DFFE pidq_i0_i2 (.Q(pidq[2]), .C(clk_48mhz), .E(n12074), .D(n3405));   // ../../../common/usb_fs_tx.v(32[10] 36[6])
    SB_DFFESS pidq_i0_i1 (.Q(pidq[1]), .C(clk_48mhz), .E(n12074), .D(\in_tx_pid[1] ), 
            .S(n12105));   // ../../../common/usb_fs_tx.v(32[10] 36[6])
    SB_DFFE pidq_i0_i0 (.Q(pidq[0]), .C(clk_48mhz), .E(n12074), .D(n3080));   // ../../../common/usb_fs_tx.v(32[10] 36[6])
    SB_DFFSR byte_strobe_126 (.Q(byte_strobe), .C(clk_48mhz), .D(n12047), 
            .R(n11249));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFF data_payload_124 (.Q(data_payload), .C(clk_48mhz), .D(n2828));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE dn_131 (.Q(usb_n_tx), .C(clk_48mhz), .E(n4212), .D(n11107));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_DFFE pkt_state__i1 (.Q(pkt_state[0]), .C(clk_48mhz), .E(n4137), 
            .D(n2403[0]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFF bitstuff_q_116 (.Q(bitstuff_q), .C(clk_48mhz), .D(n12072));   // ../../../common/usb_fs_tx.v(52[10] 57[6])
    SB_DFF bitstuff_qq_117 (.Q(bitstuff_qq), .C(clk_48mhz), .D(bitstuff_q));   // ../../../common/usb_fs_tx.v(52[10] 57[6])
    SB_DFF bitstuff_qqq_118 (.Q(bitstuff_qqq), .C(clk_48mhz), .D(bitstuff_qq));   // ../../../common/usb_fs_tx.v(52[10] 57[6])
    SB_DFF bitstuff_qqqq_119 (.Q(bitstuff_qqqq), .C(clk_48mhz), .D(bitstuff_qqq));   // ../../../common/usb_fs_tx.v(52[10] 57[6])
    SB_DFF data_shift_reg_i1 (.Q(bit_history[5]), .C(clk_48mhz), .D(n7496));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i0 (.Q(oe_shift_reg[0]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[0]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE se0_shift_reg_i0 (.Q(\se0_shift_reg[0] ), .C(clk_48mhz), .E(n4150), 
            .D(se0_shift_reg_7__N_1637[0]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFSS bit_count_i0 (.Q(bit_count[0]), .C(clk_48mhz), .D(\bit_count_2__N_1895[0] ), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFESS crc16_i15 (.Q(crc16[15]), .C(clk_48mhz), .E(n4152), .D(crc16_15__N_1967), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFF dp_eop_i0 (.Q(dp_eop[0]), .C(clk_48mhz), .D(n7490));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_DFFESS crc16_i14 (.Q(crc16[14]), .C(clk_48mhz), .E(n4152), .D(crc16[13]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i13 (.Q(crc16[13]), .C(clk_48mhz), .E(n4152), .D(crc16[12]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i12 (.Q(crc16[12]), .C(clk_48mhz), .E(n4152), .D(crc16[11]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i11 (.Q(crc16[11]), .C(clk_48mhz), .E(n4152), .D(crc16[10]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i10 (.Q(crc16[10]), .C(clk_48mhz), .E(n4152), .D(crc16[9]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i9 (.Q(crc16[9]), .C(clk_48mhz), .E(n4152), .D(crc16[8]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i8 (.Q(crc16[8]), .C(clk_48mhz), .E(n4152), .D(crc16[7]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i7 (.Q(crc16[7]), .C(clk_48mhz), .E(n4152), .D(crc16[6]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i6 (.Q(crc16[6]), .C(clk_48mhz), .E(n4152), .D(crc16[5]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i5 (.Q(crc16[5]), .C(clk_48mhz), .E(n4152), .D(crc16[4]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i4 (.Q(crc16[4]), .C(clk_48mhz), .E(n4152), .D(crc16[3]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i3 (.Q(crc16[3]), .C(clk_48mhz), .E(n4152), .D(crc16[2]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i2 (.Q(crc16[2]), .C(clk_48mhz), .E(n4152), .D(crc16_15__N_1968), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESS crc16_i1 (.Q(crc16[1]), .C(clk_48mhz), .E(n4152), .D(crc16[0]), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_DFFESR se0_shift_reg_i2 (.Q(se0_shift_reg[2]), .C(clk_48mhz), .E(n4150), 
            .D(se0_shift_reg_7__N_1943[0]), .R(n12040));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFESR oe_shift_reg_i7 (.Q(oe_shift_reg[7]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1927[7]), .R(n12040));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_133 (.Q(usb_tx_en), .C(clk_48mhz), .E(n12053), .D(oe_shift_reg[0]));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_DFFESR pkt_state__i2 (.Q(pkt_state[1]), .C(clk_48mhz), .E(n4137), 
            .D(n10264), .R(n11138));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_LUT4 i2_2_lut (.I0(pkt_state[1]), .I1(pkt_state[2]), .I2(GND_net), 
            .I3(GND_net), .O(n6));
    defparam i2_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i1960_4_lut (.I0(data_payload), .I1(tx_data_avail), .I2(n12094), 
            .I3(n6), .O(n2828));
    defparam i1960_4_lut.LUT_INIT = 16'hcaaa;
    SB_DFFESR bit_history_q__i4 (.Q(bit_history_q[4]), .C(clk_48mhz), .E(n4212), 
            .D(bit_history[5]), .R(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFESR bit_history_q__i3 (.Q(bit_history_q[3]), .C(clk_48mhz), .E(n4212), 
            .D(bit_history_q[4]), .R(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFESR bit_history_q__i2 (.Q(bit_history_q[2]), .C(clk_48mhz), .E(n4212), 
            .D(bit_history_q[3]), .R(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFESR bit_history_q__i1 (.Q(bit_history_q[1]), .C(clk_48mhz), .E(n4212), 
            .D(bit_history_q[2]), .R(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_LUT4 mux_64_i2_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(se0_shift_reg_7__N_1943[0]), 
            .I3(se0_shift_reg[2]), .O(se0_shift_reg_7__N_1637[1]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_64_i2_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_63_i7_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(oe_shift_reg_7__N_1927[7]), 
            .I3(oe_shift_reg[7]), .O(oe_shift_reg_7__N_1629[6]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i7_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_DFFESR bit_history_q__i0 (.Q(bit_history_q[0]), .C(clk_48mhz), .E(n4212), 
            .D(bit_history_q[1]), .R(n12074));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_LUT4 mux_63_i6_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(oe_shift_reg_7__N_1927[7]), 
            .I3(oe_shift_reg[6]), .O(oe_shift_reg_7__N_1629[5]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i6_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_63_i5_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(oe_shift_reg_7__N_1927[7]), 
            .I3(oe_shift_reg[5]), .O(oe_shift_reg_7__N_1629[4]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i5_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_63_i4_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(oe_shift_reg_7__N_1927[7]), 
            .I3(oe_shift_reg[4]), .O(oe_shift_reg_7__N_1629[3]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i4_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_64_i1_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(se0_shift_reg_7__N_1943[0]), 
            .I3(se0_shift_reg[1]), .O(se0_shift_reg_7__N_1637[0]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_64_i1_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_DFFE pkt_state__i3 (.Q(pkt_state[2]), .C(clk_48mhz), .E(n4137), 
            .D(n11394));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_LUT4 mux_63_i2_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(byte_strobe), 
            .I3(oe_shift_reg[2]), .O(oe_shift_reg_7__N_1629[1]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i2_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_63_i3_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(byte_strobe), 
            .I3(oe_shift_reg[3]), .O(oe_shift_reg_7__N_1629[2]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i3_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 mux_63_i1_3_lut_4_lut (.I0(n12047), .I1(n12074), .I2(byte_strobe), 
            .I3(oe_shift_reg[1]), .O(oe_shift_reg_7__N_1629[0]));   // ../../../common/usb_fs_tx.v(162[14] 178[8])
    defparam mux_63_i1_3_lut_4_lut.LUT_INIT = 16'hf2d0;
    SB_LUT4 i4_4_lut (.I0(bit_history_q[3]), .I1(bit_history_q[4]), .I2(bit_history_q[2]), 
            .I3(bit_history[5]), .O(n10));
    defparam i4_4_lut.LUT_INIT = 16'h8000;
    SB_LUT4 i2_3_lut (.I0(bit_count[0]), .I1(bit_count_c[1]), .I2(bit_count_c[2]), 
            .I3(GND_net), .O(n11249));   // ../../../common/usb_fs_tx.v(153[22:43])
    defparam i2_3_lut.LUT_INIT = 16'hfefe;
    SB_DFFE data_shift_reg_i2 (.Q(data_shift_reg[1]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[1]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i3 (.Q(data_shift_reg[2]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[2]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i4 (.Q(data_shift_reg[3]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[3]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i5 (.Q(data_shift_reg[4]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[4]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i6 (.Q(data_shift_reg[5]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[5]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i7 (.Q(data_shift_reg[6]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[6]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE data_shift_reg_i8 (.Q(data_shift_reg[7]), .C(clk_48mhz), .E(n4340), 
            .D(bit_history_5__N_1621[7]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i1 (.Q(oe_shift_reg[1]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[1]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i2 (.Q(oe_shift_reg[2]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[2]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i3 (.Q(oe_shift_reg[3]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[3]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i4 (.Q(oe_shift_reg[4]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[4]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i5 (.Q(oe_shift_reg[5]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[5]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE oe_shift_reg_i6 (.Q(oe_shift_reg[6]), .C(clk_48mhz), .E(n4150), 
            .D(oe_shift_reg_7__N_1629[6]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFFE se0_shift_reg_i1 (.Q(se0_shift_reg[1]), .C(clk_48mhz), .E(n4150), 
            .D(se0_shift_reg_7__N_1637[1]));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFF bit_count_i1 (.Q(bit_count_c[1]), .C(clk_48mhz), .D(n7652));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFF bit_count_i2 (.Q(bit_count_c[2]), .C(clk_48mhz), .D(n7650));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    SB_DFF dp_eop_i1 (.Q(dp_eop[1]), .C(clk_48mhz), .D(n7597));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_LUT4 mux_583_i7_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[7]), 
            .I3(n874[6]), .O(bit_history_5__N_1911[6]));
    defparam mux_583_i7_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_LUT4 mux_583_i6_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[6]), 
            .I3(n874[5]), .O(bit_history_5__N_1911[5]));
    defparam mux_583_i6_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_LUT4 mux_583_i5_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[5]), 
            .I3(n874[4]), .O(bit_history_5__N_1911[4]));
    defparam mux_583_i5_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_DFFSS dp_eop_i2 (.Q(\dp_eop[2] ), .C(clk_48mhz), .D(n4562), .S(n12074));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_LUT4 mux_583_i4_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[4]), 
            .I3(n874[3]), .O(bit_history_5__N_1911[3]));
    defparam mux_583_i4_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_LUT4 mux_583_i3_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[3]), 
            .I3(n874[2]), .O(bit_history_5__N_1911[2]));
    defparam mux_583_i3_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_LUT4 mux_583_i2_3_lut_4_lut (.I0(n12072), .I1(n12053), .I2(data_shift_reg[2]), 
            .I3(n874[1]), .O(bit_history_5__N_1911[1]));
    defparam mux_583_i2_3_lut_4_lut.LUT_INIT = 16'hfb40;
    SB_LUT4 i2_3_lut_4_lut (.I0(pkt_state[2]), .I1(pkt_state[1]), .I2(byte_strobe), 
            .I3(n7555), .O(n11138));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h2000;
    SB_LUT4 i2_3_lut_4_lut_adj_212 (.I0(pkt_state[2]), .I1(pkt_state[1]), 
            .I2(pkt_state[0]), .I3(byte_strobe), .O(n1051));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i2_3_lut_4_lut_adj_212.LUT_INIT = 16'h0200;
    SB_LUT4 i1828_2_lut_4_lut (.I0(pkt_state[1]), .I1(pkt_state[2]), .I2(pkt_state[0]), 
            .I3(byte_strobe), .O(oe_shift_reg_7__N_1927[7]));   // ../../../common/usb_fs_tx.v(143[7:10])
    defparam i1828_2_lut_4_lut.LUT_INIT = 16'hbf00;
    SB_LUT4 i1208_2_lut_4_lut (.I0(pkt_state[1]), .I1(pkt_state[2]), .I2(pkt_state[0]), 
            .I3(byte_strobe), .O(se0_shift_reg_7__N_1943[0]));   // ../../../common/usb_fs_tx.v(143[7:10])
    defparam i1208_2_lut_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i2_3_lut_rep_276 (.I0(pkt_state[1]), .I1(pkt_state[2]), .I2(pkt_state[0]), 
            .I3(GND_net), .O(n12117));   // ../../../common/usb_fs_tx.v(143[7:10])
    defparam i2_3_lut_rep_276.LUT_INIT = 16'hbfbf;
    SB_DFFESS crc16_i0 (.Q(crc16[0]), .C(clk_48mhz), .E(n4152), .D(crc16_invert), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(187[10] 210[6])
    SB_LUT4 i1_2_lut_3_lut (.I0(bit_history[5]), .I1(crc16[15]), .I2(crc16[1]), 
            .I3(GND_net), .O(crc16_15__N_1968));   // ../../../common/usb_fs_tx.v(185[23:49])
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h9696;
    SB_DFFESS dp_130 (.Q(usb_p_tx), .C(clk_48mhz), .E(n4212), .D(dp_N_1983), 
            .S(n12074));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    SB_LUT4 i1_2_lut_3_lut_adj_213 (.I0(bit_history[5]), .I1(crc16[15]), 
            .I2(crc16[14]), .I3(GND_net), .O(crc16_15__N_1967));   // ../../../common/usb_fs_tx.v(185[23:49])
    defparam i1_2_lut_3_lut_adj_213.LUT_INIT = 16'h9696;
    SB_LUT4 i2232_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[6]), 
            .I3(n852[6]), .O(bit_history_5__N_1621[6]));
    defparam i2232_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 i2230_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[5]), 
            .I3(n852[5]), .O(bit_history_5__N_1621[5]));
    defparam i2230_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 dp_I_152_4_lut (.I0(usb_p_tx), .I1(dp_eop[0]), .I2(\se0_shift_reg[0] ), 
            .I3(bit_history[5]), .O(dp_N_1983));   // ../../../common/usb_fs_tx.v(233[16] 239[10])
    defparam dp_I_152_4_lut.LUT_INIT = 16'hcac5;
    SB_LUT4 i2228_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[4]), 
            .I3(n852[4]), .O(bit_history_5__N_1621[4]));
    defparam i2228_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 i2226_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[3]), 
            .I3(n852[3]), .O(bit_history_5__N_1621[3]));
    defparam i2226_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 bit_history_5__I_0_2_lut (.I0(bit_history[5]), .I1(crc16[15]), 
            .I2(GND_net), .I3(GND_net), .O(crc16_invert));   // ../../../common/usb_fs_tx.v(185[23:49])
    defparam bit_history_5__I_0_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i2222_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[1]), 
            .I3(n852[1]), .O(bit_history_5__N_1621[1]));
    defparam i2222_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 i2224_3_lut_4_lut (.I0(n12035), .I1(n12048), .I2(bit_history_5__N_1911[2]), 
            .I3(n852[2]), .O(bit_history_5__N_1621[2]));
    defparam i2224_3_lut_4_lut.LUT_INIT = 16'hf870;
    SB_LUT4 i6683_4_lut (.I0(dp_eop[1]), .I1(n12074), .I2(\dp_eop[2] ), 
            .I3(n12079), .O(n7597));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    defparam i6683_4_lut.LUT_INIT = 16'h3022;
    SB_LUT4 i1579_2_lut (.I0(bit_count_c[1]), .I1(bit_count[0]), .I2(GND_net), 
            .I3(GND_net), .O(n2607));   // ../../../common/usb_fs_tx.v(170[22:35])
    defparam i1579_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i6656_4_lut (.I0(bit_count_c[2]), .I1(n12074), .I2(n2607), 
            .I3(n12047), .O(n7650));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6656_4_lut.LUT_INIT = 16'h1222;
    SB_LUT4 i6659_4_lut (.I0(bit_count_c[1]), .I1(n12074), .I2(bit_count[0]), 
            .I3(n12047), .O(n7652));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6659_4_lut.LUT_INIT = 16'h1222;
    SB_LUT4 mux_579_i8_3_lut_4_lut (.I0(pidq[3]), .I1(pkt_state[1]), .I2(n929), 
            .I3(crc16[0]), .O(n874[7]));
    defparam mux_579_i8_3_lut_4_lut.LUT_INIT = 16'h707f;
    SB_LUT4 mux_579_i4_3_lut_4_lut (.I0(pidq[3]), .I1(pkt_state[1]), .I2(n929), 
            .I3(crc16[4]), .O(n874[3]));
    defparam mux_579_i4_3_lut_4_lut.LUT_INIT = 16'h808f;
    SB_LUT4 mux_573_i8_3_lut (.I0(crc16[8]), .I1(tx_data[7]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[7]));
    defparam mux_573_i8_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 i6636_4_lut (.I0(n852[7]), .I1(n12035), .I2(n874[7]), .I3(n12048), 
            .O(bit_history_5__N_1621[7]));
    defparam i6636_4_lut.LUT_INIT = 16'h88c0;
    SB_LUT4 mux_579_i7_4_lut (.I0(crc16[1]), .I1(pidq[2]), .I2(n929), 
            .I3(pkt_state[1]), .O(n874[6]));
    defparam mux_579_i7_4_lut.LUT_INIT = 16'h3505;
    SB_LUT4 mux_573_i7_3_lut (.I0(crc16[9]), .I1(tx_data[6]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[6]));
    defparam mux_573_i7_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 mux_579_i6_4_lut (.I0(crc16[2]), .I1(pidq[1]), .I2(n929), 
            .I3(pkt_state[1]), .O(n874[5]));
    defparam mux_579_i6_4_lut.LUT_INIT = 16'h3505;
    SB_LUT4 mux_573_i6_3_lut (.I0(crc16[10]), .I1(tx_data[5]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[5]));
    defparam mux_573_i6_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 mux_579_i5_4_lut (.I0(crc16[3]), .I1(pidq[0]), .I2(n929), 
            .I3(pkt_state[1]), .O(n874[4]));
    defparam mux_579_i5_4_lut.LUT_INIT = 16'h3505;
    SB_LUT4 mux_573_i5_3_lut (.I0(crc16[11]), .I1(tx_data[4]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[4]));
    defparam mux_573_i5_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 mux_573_i4_3_lut (.I0(crc16[12]), .I1(tx_data[3]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[3]));
    defparam mux_573_i4_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 mux_579_i3_4_lut (.I0(crc16[5]), .I1(pidq[2]), .I2(n929), 
            .I3(pkt_state[1]), .O(n874[2]));
    defparam mux_579_i3_4_lut.LUT_INIT = 16'hc505;
    SB_LUT4 mux_573_i3_3_lut (.I0(crc16[13]), .I1(tx_data[2]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[2]));
    defparam mux_573_i3_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 i3_4_lut (.I0(n1051), .I1(n12035), .I2(n12080), .I3(n929), 
            .O(n4340));
    defparam i3_4_lut.LUT_INIT = 16'hfffb;
    SB_LUT4 mux_579_i2_4_lut (.I0(crc16[6]), .I1(pidq[1]), .I2(n929), 
            .I3(pkt_state[1]), .O(n874[1]));
    defparam mux_579_i2_4_lut.LUT_INIT = 16'hc505;
    SB_LUT4 mux_573_i2_3_lut (.I0(crc16[14]), .I1(tx_data[1]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[1]));
    defparam mux_573_i2_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 i1_4_lut (.I0(pkt_state[1]), .I1(n7551), .I2(tx_data_avail), 
            .I3(n12094), .O(n4));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i1_4_lut.LUT_INIT = 16'h0a22;
    SB_LUT4 i10113_4_lut (.I0(byte_strobe), .I1(n4), .I2(pkt_state[0]), 
            .I3(pkt_state[2]), .O(n11394));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i10113_4_lut.LUT_INIT = 16'h0a88;
    SB_LUT4 i2_3_lut_rep_239_4_lut (.I0(pkt_state[0]), .I1(byte_strobe), 
            .I2(pkt_state[2]), .I3(pkt_state[1]), .O(n12080));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i2_3_lut_rep_239_4_lut.LUT_INIT = 16'h0800;
    SB_LUT4 i6401_3_lut_3_lut (.I0(pkt_state[0]), .I1(byte_strobe), .I2(tx_data_avail), 
            .I3(GND_net), .O(n2390[0]));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i6401_3_lut_3_lut.LUT_INIT = 16'hc4c4;
    SB_LUT4 i1129_2_lut_rep_253 (.I0(pkt_state[0]), .I1(byte_strobe), .I2(GND_net), 
            .I3(GND_net), .O(n12094));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i1129_2_lut_rep_253.LUT_INIT = 16'h8888;
    SB_LUT4 i6446_2_lut (.I0(pidq[0]), .I1(pidq[1]), .I2(GND_net), .I3(GND_net), 
            .O(n7551));
    defparam i6446_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i20_4_lut (.I0(pkt_state[1]), .I1(pkt_state[0]), .I2(n7551), 
            .I3(tx_data_avail), .O(n7));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i20_4_lut.LUT_INIT = 16'hec64;
    SB_LUT4 i1_2_lut (.I0(byte_strobe), .I1(n7), .I2(GND_net), .I3(GND_net), 
            .O(n10264));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam i1_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i6680_4_lut (.I0(dp_eop[0]), .I1(n12074), .I2(dp_eop[1]), 
            .I3(n12079), .O(n7490));   // ../../../common/usb_fs_tx.v(216[10] 241[6])
    defparam i6680_4_lut.LUT_INIT = 16'h3022;
    SB_LUT4 i1_4_lut_adj_214 (.I0(n12097), .I1(n12074), .I2(bitstuff_qqqq), 
            .I3(data_payload), .O(n4152));
    defparam i1_4_lut_adj_214.LUT_INIT = 16'hcdcc;
    SB_LUT4 i10266_2_lut_rep_207_4_lut (.I0(pkt_state[1]), .I1(pkt_state[2]), 
            .I2(n12094), .I3(n929), .O(n12048));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i10266_2_lut_rep_207_4_lut.LUT_INIT = 16'h0020;
    SB_LUT4 i10196_2_lut_4_lut (.I0(pkt_state[1]), .I1(pkt_state[2]), .I2(n12094), 
            .I3(n929), .O(n11483));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i10196_2_lut_4_lut.LUT_INIT = 16'h00df;
    SB_LUT4 i14_3_lut (.I0(pkt_state[0]), .I1(pkt_state[1]), .I2(pkt_state[2]), 
            .I3(GND_net), .O(n3));
    defparam i14_3_lut.LUT_INIT = 16'hc1c1;
    SB_LUT4 i10321_4_lut (.I0(n12040), .I1(byte_strobe), .I2(n3), .I3(n12117), 
            .O(n4150));
    defparam i10321_4_lut.LUT_INIT = 16'haeee;
    SB_LUT4 i2_4_lut (.I0(pkt_state[2]), .I1(byte_strobe), .I2(pkt_state[0]), 
            .I3(pkt_state[1]), .O(n929));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i2_4_lut.LUT_INIT = 16'h0440;
    SB_LUT4 i6761_3_lut (.I0(bit_history[5]), .I1(crc16[7]), .I2(n1051), 
            .I3(GND_net), .O(n7873));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6761_3_lut.LUT_INIT = 16'h3a3a;
    SB_LUT4 mux_573_i1_3_lut (.I0(crc16[15]), .I1(tx_data[0]), .I2(tx_data_avail), 
            .I3(GND_net), .O(n852[0]));
    defparam mux_573_i1_3_lut.LUT_INIT = 16'hc5c5;
    SB_LUT4 i6682_4_lut (.I0(n7873), .I1(data_shift_reg[1]), .I2(n12053), 
            .I3(n12072), .O(n7789));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6682_4_lut.LUT_INIT = 16'h0aca;
    SB_LUT4 i6762_4_lut (.I0(n852[0]), .I1(pidq[0]), .I2(n929), .I3(pkt_state[1]), 
            .O(n7874));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6762_4_lut.LUT_INIT = 16'hca0a;
    SB_LUT4 i6391_4_lut (.I0(n7874), .I1(n7789), .I2(n12053), .I3(n11483), 
            .O(n7496));   // ../../../common/usb_fs_tx.v(81[10] 179[6])
    defparam i6391_4_lut.LUT_INIT = 16'hccca;
    SB_LUT4 i6450_4_lut (.I0(n12074), .I1(pkt_state[2]), .I2(byte_strobe), 
            .I3(pkt_state[0]), .O(n7555));
    defparam i6450_4_lut.LUT_INIT = 16'hfcee;
    SB_LUT4 i10324_4_lut (.I0(byte_strobe), .I1(n7555), .I2(pkt_state[1]), 
            .I3(pkt_state[2]), .O(n4137));
    defparam i10324_4_lut.LUT_INIT = 16'h08ac;
    SB_LUT4 mux_1376_i1_4_lut (.I0(n12074), .I1(n2390[0]), .I2(pkt_state[1]), 
            .I3(pkt_state[0]), .O(n2399[0]));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam mux_1376_i1_4_lut.LUT_INIT = 16'hc0ca;
    SB_LUT4 mux_1377_i1_4_lut (.I0(n2399[0]), .I1(pkt_state[0]), .I2(pkt_state[2]), 
            .I3(byte_strobe), .O(n2403[0]));   // ../../../common/usb_fs_tx.v(82[5] 150[12])
    defparam mux_1377_i1_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 i10351_2_lut_rep_206_4_lut (.I0(bit_history_q[0]), .I1(n10), 
            .I2(bit_history_q[1]), .I3(n12097), .O(n12047));
    defparam i10351_2_lut_rep_206_4_lut.LUT_INIT = 16'h007f;
    SB_LUT4 i5_3_lut_rep_231 (.I0(bit_history_q[0]), .I1(n10), .I2(bit_history_q[1]), 
            .I3(GND_net), .O(n12072));
    defparam i5_3_lut_rep_231.LUT_INIT = 16'h8080;
    
endmodule
//
// Verilog Description of module usb_fs_rx
//

module usb_fs_rx (rx_pid, clk_48mhz, n12029, n12103, n12104, n12015, 
            n12000, GND_net, rx_data, rx_data_put, rx_addr, rx_endp, 
            pin_usbn_out, usb_tx_en, rx_pkt_end, pin_usbp_out, rx_pkt_valid, 
            n12024, n12107, token_received_N_1149, n12057, n11210, 
            n3, \se0_shift_reg[0] , n12079, n12105, n12106, n12053, 
            n4212, \bit_count[0] , n12072, \bit_count_2__N_1895[0] , 
            \dp_eop[2] , n4562, n12097, n10867, n10901) /* synthesis syn_module_defined=1 */ ;
    output [3:0]rx_pid;
    input clk_48mhz;
    output n12029;
    output n12103;
    input n12104;
    output n12015;
    output n12000;
    input GND_net;
    output [7:0]rx_data;
    output rx_data_put;
    output [6:0]rx_addr;
    output [3:0]rx_endp;
    input pin_usbn_out;
    input usb_tx_en;
    output rx_pkt_end;
    input pin_usbp_out;
    output rx_pkt_valid;
    output n12024;
    output n12107;
    input token_received_N_1149;
    output n12057;
    output n11210;
    output n3;
    input \se0_shift_reg[0] ;
    output n12079;
    input n12105;
    input n12106;
    output n12053;
    output n4212;
    input \bit_count[0] ;
    input n12072;
    output \bit_count_2__N_1895[0] ;
    input \dp_eop[2] ;
    output n4562;
    output n12097;
    input n10867;
    output n10901;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    
    wire n4238;
    wire [8:0]full_pid;   // ../../../common/usb_fs_rx.v(236[13:21])
    wire [5:0]bitstuff_history;   // ../../../common/usb_fs_rx.v(215[13:29])
    
    wire n10, n2835, n86, n12042, n12096;
    wire [1:0]bit_phase;   // ../../../common/usb_fs_rx.v(120[13:22])
    
    wire n12095, n12084;
    wire [5:0]line_history;   // ../../../common/usb_fs_rx.v(143[13:25])
    
    wire n10884, n10882, n10781, n12065, n12113, n5, n12054;
    wire [2:0]line_state;   // ../../../common/usb_fs_rx.v(72[13:23])
    
    wire n12093, n10095;
    wire [11:0]token_payload;   // ../../../common/usb_fs_rx.v(319[14:27])
    
    wire addr_6__N_1571, n4126, next_packet_valid, packet_valid;
    wire [3:0]dpair_q;   // ../../../common/usb_fs_rx.v(52[13:20])
    
    wire din, n6666, n6679, n6674, n6643, crc16_15__N_1553, n4133;
    wire [15:0]crc16;   // ../../../common/usb_fs_rx.v(273[14:19])
    wire [1:0]n13;
    
    wire crc16_15__N_1554;
    wire [4:0]crc5;   // ../../../common/usb_fs_rx.v(253[13:17])
    
    wire crc5_4__N_1535, n4217, n4560, n12039;
    wire [2:0]line_state_2__N_1487;
    
    wire n12038, n4, n11467, n21, n28, n11433, n11465, n33, 
        n10_adj_2036, n4_adj_2037, n11321, n6, n7, n12092, n10_adj_2038, 
        n10764, n9975, n11209, n3109;
    
    SB_DFFESR full_pid_i0 (.Q(full_pid[0]), .C(clk_48mhz), .E(n4238), 
            .D(rx_pid[0]), .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_LUT4 i4_4_lut (.I0(bitstuff_history[3]), .I1(bitstuff_history[4]), 
            .I2(bitstuff_history[2]), .I3(bitstuff_history[5]), .O(n10));
    defparam i4_4_lut.LUT_INIT = 16'h8000;
    SB_LUT4 i106_4_lut (.I0(n2835), .I1(bitstuff_history[0]), .I2(n10), 
            .I3(bitstuff_history[1]), .O(n86));
    defparam i106_4_lut.LUT_INIT = 16'h2aaa;
    SB_LUT4 i1_4_lut (.I0(n86), .I1(n12029), .I2(n12042), .I3(full_pid[0]), 
            .O(n4238));
    defparam i1_4_lut.LUT_INIT = 16'hccec;
    SB_DFFSR bit_phase_1258__i0 (.Q(bit_phase[0]), .C(clk_48mhz), .D(n12096), 
            .R(n12095));   // ../../../common/usb_fs_rx.v(131[24:37])
    SB_LUT4 setup_token_received_I_0_290_2_lut_rep_159_3_lut_4_lut (.I0(n12103), 
            .I1(n12084), .I2(n12104), .I3(n12015), .O(n12000));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    defparam setup_token_received_I_0_290_2_lut_rep_159_3_lut_4_lut.LUT_INIT = 16'h1000;
    SB_LUT4 i1740_2_lut (.I0(line_history[2]), .I1(line_history[3]), .I2(GND_net), 
            .I3(GND_net), .O(n2835));   // ../../../common/usb_fs_rx.v(203[7] 209[14])
    defparam i1740_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i2_3_lut (.I0(line_history[5]), .I1(line_history[4]), .I2(line_history[2]), 
            .I3(GND_net), .O(n10884));
    defparam i2_3_lut.LUT_INIT = 16'h2020;
    SB_LUT4 i3_4_lut (.I0(bit_phase[0]), .I1(n10884), .I2(n10882), .I3(bit_phase[1]), 
            .O(n10781));
    defparam i3_4_lut.LUT_INIT = 16'h0080;
    SB_LUT4 i1_2_lut_4_lut (.I0(n12065), .I1(n86), .I2(full_pid[0]), .I3(n12113), 
            .O(n5));   // ../../../common/usb_fs_rx.v(203[7] 209[14])
    defparam i1_2_lut_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i2_3_lut_rep_213 (.I0(n12065), .I1(n86), .I2(full_pid[0]), 
            .I3(GND_net), .O(n12054));   // ../../../common/usb_fs_rx.v(203[7] 209[14])
    defparam i2_3_lut_rep_213.LUT_INIT = 16'hbfbf;
    SB_DFFE line_history_i0_i0 (.Q(line_history[0]), .C(clk_48mhz), .E(n12093), 
            .D(line_state[0]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFSR rx_data_buffer_i1 (.Q(rx_data_put), .C(clk_48mhz), .D(rx_data[0]), 
            .R(n10095));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFE addr_i0_i0 (.Q(rx_addr[0]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[1]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFF line_state_i0 (.Q(line_state[0]), .C(clk_48mhz), .D(n4126));   // ../../../common/usb_fs_rx.v(81[10] 104[6])
    SB_DFFE endp_i0_i0 (.Q(rx_endp[0]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[8]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFF packet_valid_116 (.Q(packet_valid), .C(clk_48mhz), .D(next_packet_valid));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFSR dpair_q_i0 (.Q(dpair_q[0]), .C(clk_48mhz), .D(pin_usbn_out), 
            .R(usb_tx_en));   // ../../../common/usb_fs_rx.v(54[10] 56[6])
    SB_DFFESS rx_data_buffer_i9 (.Q(rx_data[7]), .C(clk_48mhz), .E(n6666), 
            .D(din), .S(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR token_payload_i0 (.Q(token_payload[0]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[1]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR rx_data_buffer_i8 (.Q(rx_data[6]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[7]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i7 (.Q(rx_data[5]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[6]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i6 (.Q(rx_data[4]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[5]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i5 (.Q(rx_data[3]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[4]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i4 (.Q(rx_data[2]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[3]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i3 (.Q(rx_data[1]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[2]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_DFFESR rx_data_buffer_i2 (.Q(rx_data[0]), .C(clk_48mhz), .E(n6666), 
            .D(rx_data[1]), .R(n6679));   // ../../../common/usb_fs_rx.v(356[10] 364[6])
    SB_LUT4 i1_3_lut_4_lut (.I0(packet_valid), .I1(n12065), .I2(n2835), 
            .I3(rx_pkt_end), .O(n6643));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i1_3_lut_4_lut.LUT_INIT = 16'hff20;
    SB_DFFESS token_payload_i11 (.Q(token_payload[11]), .C(clk_48mhz), .E(n6674), 
            .D(din), .S(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i10 (.Q(token_payload[10]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[11]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i9 (.Q(token_payload[9]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[10]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i8 (.Q(token_payload[8]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[9]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i7 (.Q(token_payload[7]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[8]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i6 (.Q(token_payload[6]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[7]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i5 (.Q(token_payload[5]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[6]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i4 (.Q(token_payload[4]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[5]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i3 (.Q(token_payload[3]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[4]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i2 (.Q(token_payload[2]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[3]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESR token_payload_i1 (.Q(token_payload[1]), .C(clk_48mhz), .E(n6674), 
            .D(token_payload[2]), .R(n12029));   // ../../../common/usb_fs_rx.v(322[10] 330[6])
    SB_DFFESS crc16_i15 (.Q(crc16[15]), .C(clk_48mhz), .E(n4133), .D(crc16_15__N_1553), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFSR bit_phase_1258__i1 (.Q(bit_phase[1]), .C(clk_48mhz), .D(n13[1]), 
            .R(n12095));   // ../../../common/usb_fs_rx.v(131[24:37])
    SB_DFFESS crc16_i14 (.Q(crc16[14]), .C(clk_48mhz), .E(n4133), .D(crc16[13]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i13 (.Q(crc16[13]), .C(clk_48mhz), .E(n4133), .D(crc16[12]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i12 (.Q(crc16[12]), .C(clk_48mhz), .E(n4133), .D(crc16[11]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i11 (.Q(crc16[11]), .C(clk_48mhz), .E(n4133), .D(crc16[10]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i10 (.Q(crc16[10]), .C(clk_48mhz), .E(n4133), .D(crc16[9]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i9 (.Q(crc16[9]), .C(clk_48mhz), .E(n4133), .D(crc16[8]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i8 (.Q(crc16[8]), .C(clk_48mhz), .E(n4133), .D(crc16[7]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i7 (.Q(crc16[7]), .C(clk_48mhz), .E(n4133), .D(crc16[6]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i6 (.Q(crc16[6]), .C(clk_48mhz), .E(n4133), .D(crc16[5]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i5 (.Q(crc16[5]), .C(clk_48mhz), .E(n4133), .D(crc16[4]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i4 (.Q(crc16[4]), .C(clk_48mhz), .E(n4133), .D(crc16[3]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i3 (.Q(crc16[3]), .C(clk_48mhz), .E(n4133), .D(crc16[2]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i2 (.Q(crc16[2]), .C(clk_48mhz), .E(n4133), .D(crc16_15__N_1554), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc16_i1 (.Q(crc16[1]), .C(clk_48mhz), .E(n4133), .D(crc16[0]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc5_i4 (.Q(crc5[4]), .C(clk_48mhz), .E(n4133), .D(crc5[3]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(256[10] 268[6])
    SB_DFFESS crc5_i3 (.Q(crc5[3]), .C(clk_48mhz), .E(n4133), .D(crc5[2]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(256[10] 268[6])
    SB_DFFESS crc5_i2 (.Q(crc5[2]), .C(clk_48mhz), .E(n4133), .D(crc5_4__N_1535), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(256[10] 268[6])
    SB_DFFESS crc5_i1 (.Q(crc5[1]), .C(clk_48mhz), .E(n4133), .D(crc5[0]), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(256[10] 268[6])
    SB_DFFESS full_pid_i8 (.Q(full_pid[8]), .C(clk_48mhz), .E(n4238), 
            .D(din), .S(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i7 (.Q(full_pid[7]), .C(clk_48mhz), .E(n4238), 
            .D(full_pid[8]), .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i6 (.Q(full_pid[6]), .C(clk_48mhz), .E(n4238), 
            .D(full_pid[7]), .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i5 (.Q(full_pid[5]), .C(clk_48mhz), .E(n4238), 
            .D(full_pid[6]), .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i4 (.Q(rx_pid[3]), .C(clk_48mhz), .E(n4238), .D(full_pid[5]), 
            .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i3 (.Q(rx_pid[2]), .C(clk_48mhz), .E(n4238), .D(rx_pid[3]), 
            .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i2 (.Q(rx_pid[1]), .C(clk_48mhz), .E(n4238), .D(rx_pid[2]), 
            .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR full_pid_i1 (.Q(rx_pid[0]), .C(clk_48mhz), .E(n4238), .D(rx_pid[1]), 
            .R(n12029));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    SB_DFFESR bitstuff_history__i5 (.Q(bitstuff_history[5]), .C(clk_48mhz), 
            .E(n6643), .D(bitstuff_history[4]), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_DFFESR bitstuff_history__i4 (.Q(bitstuff_history[4]), .C(clk_48mhz), 
            .E(n6643), .D(bitstuff_history[3]), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_DFFESR bitstuff_history__i3 (.Q(bitstuff_history[3]), .C(clk_48mhz), 
            .E(n6643), .D(bitstuff_history[2]), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_DFFESR bitstuff_history__i2 (.Q(bitstuff_history[2]), .C(clk_48mhz), 
            .E(n6643), .D(bitstuff_history[1]), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_DFFESR bitstuff_history__i1 (.Q(bitstuff_history[1]), .C(clk_48mhz), 
            .E(n6643), .D(bitstuff_history[0]), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_LUT4 i1_2_lut_3_lut_3_lut (.I0(packet_valid), .I1(n12054), .I2(n10781), 
            .I3(GND_net), .O(n4133));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i1_2_lut_3_lut_3_lut.LUT_INIT = 16'h7272;
    SB_DFFESR bitstuff_history__i0 (.Q(bitstuff_history[0]), .C(clk_48mhz), 
            .E(n6643), .D(din), .R(rx_pkt_end));   // ../../../common/usb_fs_rx.v(217[10] 225[6])
    SB_DFFE line_history_i0_i1 (.Q(line_history[1]), .C(clk_48mhz), .E(n12093), 
            .D(line_state[1]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFE line_history_i0_i2 (.Q(line_history[2]), .C(clk_48mhz), .E(n12093), 
            .D(line_history[0]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFE line_history_i0_i3 (.Q(line_history[3]), .C(clk_48mhz), .E(n12093), 
            .D(line_history[1]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFE line_history_i0_i4 (.Q(line_history[4]), .C(clk_48mhz), .E(n12093), 
            .D(line_history[2]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFE line_history_i0_i5 (.Q(line_history[5]), .C(clk_48mhz), .E(n12093), 
            .D(line_history[3]));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    SB_DFFE addr_i0_i1 (.Q(rx_addr[1]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[2]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE addr_i0_i2 (.Q(rx_addr[2]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[3]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_LUT4 i2_3_lut_4_lut (.I0(packet_valid), .I1(n12054), .I2(rx_pid[1]), 
            .I3(rx_pid[0]), .O(n10095));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i2_3_lut_4_lut.LUT_INIT = 16'hdfff;
    SB_DFFE addr_i0_i3 (.Q(rx_addr[3]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[4]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE addr_i0_i4 (.Q(rx_addr[4]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[5]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE addr_i0_i5 (.Q(rx_addr[5]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[6]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE addr_i0_i6 (.Q(rx_addr[6]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[7]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFF line_state_i1 (.Q(line_state[1]), .C(clk_48mhz), .D(n4217));   // ../../../common/usb_fs_rx.v(81[10] 104[6])
    SB_DFF line_state_i2 (.Q(line_state[2]), .C(clk_48mhz), .D(n4560));   // ../../../common/usb_fs_rx.v(81[10] 104[6])
    SB_DFFE endp_i0_i1 (.Q(rx_endp[1]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[9]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE endp_i0_i2 (.Q(rx_endp[2]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[10]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_DFFE endp_i0_i3 (.Q(rx_endp[3]), .C(clk_48mhz), .E(addr_6__N_1571), 
            .D(token_payload[11]));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    SB_LUT4 i1_2_lut_3_lut (.I0(din), .I1(crc16[15]), .I2(crc16[1]), .I3(GND_net), 
            .O(crc16_15__N_1554));
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h9696;
    SB_LUT4 i1_2_lut_3_lut_adj_196 (.I0(din), .I1(crc16[15]), .I2(crc16[14]), 
            .I3(GND_net), .O(crc16_15__N_1553));
    defparam i1_2_lut_3_lut_adj_196.LUT_INIT = 16'h9696;
    SB_LUT4 i1_2_lut_rep_198 (.I0(din), .I1(crc16[15]), .I2(GND_net), 
            .I3(GND_net), .O(n12039));
    defparam i1_2_lut_rep_198.LUT_INIT = 16'h6666;
    SB_LUT4 i1_2_lut_3_lut_adj_197 (.I0(din), .I1(crc5[4]), .I2(crc5[1]), 
            .I3(GND_net), .O(crc5_4__N_1535));
    defparam i1_2_lut_3_lut_adj_197.LUT_INIT = 16'h9696;
    SB_DFFSS dpair_q_i1 (.Q(dpair_q[1]), .C(clk_48mhz), .D(pin_usbp_out), 
            .S(usb_tx_en));   // ../../../common/usb_fs_rx.v(54[10] 56[6])
    SB_DFF dpair_q_i2 (.Q(dpair_q[2]), .C(clk_48mhz), .D(dpair_q[0]));   // ../../../common/usb_fs_rx.v(54[10] 56[6])
    SB_DFF dpair_q_i3 (.Q(line_state_2__N_1487[1]), .C(clk_48mhz), .D(dpair_q[1]));   // ../../../common/usb_fs_rx.v(54[10] 56[6])
    SB_LUT4 i1_2_lut_rep_197 (.I0(din), .I1(crc5[4]), .I2(GND_net), .I3(GND_net), 
            .O(n12038));
    defparam i1_2_lut_rep_197.LUT_INIT = 16'h6666;
    SB_DFFESS crc16_i0 (.Q(crc16[0]), .C(clk_48mhz), .E(n4133), .D(n12039), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(277[10] 300[6])
    SB_DFFESS crc5_i0 (.Q(crc5[0]), .C(clk_48mhz), .E(n4133), .D(n12038), 
            .S(n12029));   // ../../../common/usb_fs_rx.v(256[10] 268[6])
    SB_LUT4 i1_2_lut_3_lut_adj_198 (.I0(packet_valid), .I1(rx_pid[0]), .I2(rx_pid[1]), 
            .I3(GND_net), .O(n4));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    defparam i1_2_lut_3_lut_adj_198.LUT_INIT = 16'h8080;
    SB_LUT4 i1_2_lut_rep_272 (.I0(packet_valid), .I1(rx_pid[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12113));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    defparam i1_2_lut_rep_272.LUT_INIT = 16'h8888;
    SB_LUT4 i1_3_lut_4_lut_adj_199 (.I0(packet_valid), .I1(n10781), .I2(rx_data_put), 
            .I3(n10095), .O(n6679));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i1_3_lut_4_lut_adj_199.LUT_INIT = 16'hf444;
    SB_LUT4 i1_2_lut_rep_188 (.I0(packet_valid), .I1(n10781), .I2(GND_net), 
            .I3(GND_net), .O(n12029));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i1_2_lut_rep_188.LUT_INIT = 16'h4444;
    SB_LUT4 i1_2_lut_3_lut_adj_200 (.I0(rx_pid[0]), .I1(rx_pid[1]), .I2(token_payload[0]), 
            .I3(GND_net), .O(addr_6__N_1571));   // ../../../common/usb_fs_pe.v(75[14:20])
    defparam i1_2_lut_3_lut_adj_200.LUT_INIT = 16'h2020;
    SB_LUT4 i1_2_lut_rep_183_3_lut_4_lut (.I0(rx_pid[0]), .I1(rx_pid[1]), 
            .I2(rx_pkt_valid), .I3(rx_pkt_end), .O(n12024));   // ../../../common/usb_fs_pe.v(75[14:20])
    defparam i1_2_lut_rep_183_3_lut_4_lut.LUT_INIT = 16'h2000;
    SB_LUT4 i1_2_lut_rep_266 (.I0(rx_pid[0]), .I1(rx_pid[1]), .I2(GND_net), 
            .I3(GND_net), .O(n12107));   // ../../../common/usb_fs_pe.v(75[14:20])
    defparam i1_2_lut_rep_266.LUT_INIT = 16'h2222;
    SB_LUT4 i2_3_lut_rep_174_4_lut (.I0(rx_endp[3]), .I1(rx_endp[2]), .I2(token_received_N_1149), 
            .I3(rx_endp[1]), .O(n12015));
    defparam i2_3_lut_rep_174_4_lut.LUT_INIT = 16'h0010;
    SB_LUT4 i1_2_lut_rep_216_3_lut_4_lut (.I0(rx_endp[3]), .I1(rx_endp[2]), 
            .I2(rx_endp[0]), .I3(rx_endp[1]), .O(n12057));
    defparam i1_2_lut_rep_216_3_lut_4_lut.LUT_INIT = 16'hffef;
    SB_LUT4 i2_3_lut_4_lut_adj_201 (.I0(rx_endp[3]), .I1(rx_endp[2]), .I2(rx_endp[1]), 
            .I3(rx_endp[0]), .O(n11210));
    defparam i2_3_lut_4_lut_adj_201.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_2_lut_rep_262 (.I0(rx_endp[3]), .I1(rx_endp[2]), .I2(GND_net), 
            .I3(GND_net), .O(n12103));
    defparam i1_2_lut_rep_262.LUT_INIT = 16'heeee;
    SB_LUT4 i10183_4_lut (.I0(crc16[5]), .I1(crc16[12]), .I2(crc16[14]), 
            .I3(crc16[9]), .O(n11467));
    defparam i10183_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i3_2_lut (.I0(crc16[15]), .I1(crc16[3]), .I2(GND_net), .I3(GND_net), 
            .O(n21));
    defparam i3_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i10_4_lut (.I0(crc16[10]), .I1(crc16[2]), .I2(rx_pid[1]), 
            .I3(crc16[0]), .O(n28));
    defparam i10_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i10150_2_lut (.I0(crc16[11]), .I1(crc16[4]), .I2(GND_net), 
            .I3(GND_net), .O(n11433));
    defparam i10150_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i10181_4_lut (.I0(crc16[8]), .I1(crc16[1]), .I2(crc16[13]), 
            .I3(crc16[7]), .O(n11465));
    defparam i10181_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i15_4_lut (.I0(n21), .I1(n11467), .I2(rx_pid[0]), .I3(crc16[6]), 
            .O(n33));
    defparam i15_4_lut.LUT_INIT = 16'h0020;
    SB_LUT4 i4_4_lut_adj_202 (.I0(n12107), .I1(crc5[1]), .I2(crc5[2]), 
            .I3(crc5[3]), .O(n10_adj_2036));
    defparam i4_4_lut_adj_202.LUT_INIT = 16'h2000;
    SB_LUT4 i1_4_lut_adj_203 (.I0(n3), .I1(crc5[0]), .I2(n10_adj_2036), 
            .I3(crc5[4]), .O(n4_adj_2037));   // ../../../common/usb_fs_rx.v(312[38] 316[4])
    defparam i1_4_lut_adj_203.LUT_INIT = 16'h5575;
    SB_LUT4 i17_4_lut (.I0(n33), .I1(n11465), .I2(n11433), .I3(n28), 
            .O(n11321));
    defparam i17_4_lut.LUT_INIT = 16'h0200;
    SB_LUT4 i1_4_lut_adj_204 (.I0(rx_pid[1]), .I1(n11321), .I2(full_pid[6]), 
            .I3(n4_adj_2037), .O(n6));
    defparam i1_4_lut_adj_204.LUT_INIT = 16'h5a48;
    SB_LUT4 i2_4_lut (.I0(rx_pid[0]), .I1(rx_pid[2]), .I2(full_pid[5]), 
            .I3(full_pid[7]), .O(n7));
    defparam i2_4_lut.LUT_INIT = 16'h1248;
    SB_LUT4 i4_4_lut_adj_205 (.I0(n7), .I1(rx_pid[3]), .I2(n6), .I3(full_pid[8]), 
            .O(rx_pkt_valid));
    defparam i4_4_lut_adj_205.LUT_INIT = 16'h2080;
    SB_LUT4 i1_4_lut_adj_206 (.I0(line_history[0]), .I1(n10884), .I2(packet_valid), 
            .I3(n12092), .O(n10_adj_2038));
    defparam i1_4_lut_adj_206.LUT_INIT = 16'ha0a8;
    SB_LUT4 i3_4_lut_adj_207 (.I0(n10_adj_2038), .I1(n12093), .I2(packet_valid), 
            .I3(n10764), .O(rx_pkt_end));
    defparam i3_4_lut_adj_207.LUT_INIT = 16'h0040;
    SB_LUT4 i1_2_lut (.I0(rx_pid[0]), .I1(rx_pid[1]), .I2(GND_net), .I3(GND_net), 
            .O(n3));   // ../../../common/usb_fs_rx.v(240[10] 248[6])
    defparam i1_2_lut.LUT_INIT = 16'hbbbb;
    SB_LUT4 i344_2_lut_rep_238_3_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(\se0_shift_reg[0] ), .I3(GND_net), .O(n12079));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam i344_2_lut_rep_238_3_lut.LUT_INIT = 16'h4040;
    SB_LUT4 i10356_2_lut_rep_212_3_lut_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(n12105), .I3(n12106), .O(n12053));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam i10356_2_lut_rep_212_3_lut_4_lut.LUT_INIT = 16'h0004;
    SB_LUT4 i1344_2_lut_3_lut_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(n12105), .I3(n12106), .O(n4212));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam i1344_2_lut_3_lut_4_lut.LUT_INIT = 16'hfff4;
    SB_LUT4 i10293_2_lut_3_lut_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(\bit_count[0] ), .I3(n12072), .O(\bit_count_2__N_1895[0] ));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam i10293_2_lut_3_lut_4_lut.LUT_INIT = 16'hf0b4;
    SB_LUT4 i3440_2_lut_3_lut_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(\dp_eop[2] ), .I3(\se0_shift_reg[0] ), .O(n4562));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam i3440_2_lut_3_lut_4_lut.LUT_INIT = 16'hb0f0;
    SB_LUT4 equal_109_i3_2_lut_rep_256 (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(GND_net), .I3(GND_net), .O(n12097));   // ../../../common/usb_fs_rx.v(123[23:39])
    defparam equal_109_i3_2_lut_rep_256.LUT_INIT = 16'hbbbb;
    SB_LUT4 i3095_4_lut (.I0(line_state[1]), .I1(line_state_2__N_1487[1]), 
            .I2(n9975), .I3(n12095), .O(n4217));   // ../../../common/usb_fs_rx.v(81[10] 104[6])
    defparam i3095_4_lut.LUT_INIT = 16'hca0a;
    SB_LUT4 i3_4_lut_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), .I2(line_history[0]), 
            .I3(n10764), .O(n11209));   // ../../../common/usb_fs_rx.v(122[27:43])
    defparam i3_4_lut_4_lut.LUT_INIT = 16'hfffd;
    SB_LUT4 i1685_1_lut_rep_255 (.I0(bit_phase[0]), .I1(GND_net), .I2(GND_net), 
            .I3(GND_net), .O(n12096));   // ../../../common/usb_fs_rx.v(122[27:43])
    defparam i1685_1_lut_rep_255.LUT_INIT = 16'h5555;
    SB_LUT4 i3438_2_lut_4_lut (.I0(line_state[1]), .I1(line_state[2]), .I2(line_state[0]), 
            .I3(n9975), .O(n4560));   // ../../../common/usb_fs_rx.v(127[11:27])
    defparam i3438_2_lut_4_lut.LUT_INIT = 16'hfb00;
    SB_LUT4 i10306_3_lut_rep_254 (.I0(line_state[1]), .I1(line_state[2]), 
            .I2(line_state[0]), .I3(GND_net), .O(n12095));   // ../../../common/usb_fs_rx.v(127[11:27])
    defparam i10306_3_lut_rep_254.LUT_INIT = 16'h0404;
    SB_LUT4 i1_3_lut_rep_224_4_lut (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(line_history[1]), .I3(line_history[0]), .O(n12065));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i1_3_lut_rep_224_4_lut.LUT_INIT = 16'hfddf;
    SB_LUT4 i10328_2_lut_rep_252 (.I0(bit_phase[0]), .I1(bit_phase[1]), 
            .I2(GND_net), .I3(GND_net), .O(n12093));   // ../../../common/usb_fs_rx.v(168[10] 179[6])
    defparam i10328_2_lut_rep_252.LUT_INIT = 16'h2222;
    SB_LUT4 i2_2_lut_3_lut (.I0(line_history[1]), .I1(line_history[3]), 
            .I2(line_history[2]), .I3(GND_net), .O(n10764));   // ../../../common/usb_fs_rx.v(144[7:19])
    defparam i2_2_lut_3_lut.LUT_INIT = 16'hfefe;
    SB_LUT4 i1_2_lut_3_lut_adj_208 (.I0(line_history[1]), .I1(line_history[3]), 
            .I2(line_history[0]), .I3(GND_net), .O(n10882));   // ../../../common/usb_fs_rx.v(144[7:19])
    defparam i1_2_lut_3_lut_adj_208.LUT_INIT = 16'h1010;
    SB_LUT4 i8515_2_lut (.I0(bit_phase[1]), .I1(bit_phase[0]), .I2(GND_net), 
            .I3(GND_net), .O(n13[1]));   // ../../../common/usb_fs_rx.v(131[24:37])
    defparam i8515_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i1_2_lut_rep_251 (.I0(line_history[1]), .I1(line_history[3]), 
            .I2(GND_net), .I3(GND_net), .O(n12092));   // ../../../common/usb_fs_rx.v(144[7:19])
    defparam i1_2_lut_rep_251.LUT_INIT = 16'heeee;
    SB_LUT4 i1_4_lut_adj_209 (.I0(n5), .I1(n12029), .I2(rx_pid[1]), .I3(token_payload[0]), 
            .O(n6674));
    defparam i1_4_lut_adj_209.LUT_INIT = 16'hccce;
    SB_LUT4 i2_4_lut_adj_210 (.I0(n12054), .I1(n12029), .I2(n4), .I3(rx_data_put), 
            .O(n6666));
    defparam i2_4_lut_adj_210.LUT_INIT = 16'hffdc;
    SB_LUT4 i1_2_lut_3_lut_4_lut (.I0(rx_endp[1]), .I1(rx_endp[0]), .I2(n10867), 
            .I3(n12104), .O(n10901));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    defparam i1_2_lut_3_lut_4_lut.LUT_INIT = 16'hbfff;
    SB_LUT4 i1_2_lut_rep_243 (.I0(rx_endp[1]), .I1(rx_endp[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12084));   // ../../../common/usb_fs_rx.v(332[10] 338[6])
    defparam i1_2_lut_rep_243.LUT_INIT = 16'hbbbb;
    SB_LUT4 i1_3_lut (.I0(n10781), .I1(packet_valid), .I2(n11209), .I3(GND_net), 
            .O(next_packet_valid));   // ../../../common/usb_fs_rx.v(144[7:19])
    defparam i1_3_lut.LUT_INIT = 16'heaea;
    SB_LUT4 i2367_2_lut (.I0(dpair_q[2]), .I1(line_state[0]), .I2(GND_net), 
            .I3(GND_net), .O(n3109));   // ../../../common/usb_fs_rx.v(82[7] 103[14])
    defparam i2367_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i2_4_lut_adj_211 (.I0(line_state[2]), .I1(line_state_2__N_1487[1]), 
            .I2(n3109), .I3(line_state[1]), .O(n9975));   // ../../../common/usb_fs_rx.v(82[7] 103[14])
    defparam i2_4_lut_adj_211.LUT_INIT = 16'hfbfe;
    SB_LUT4 i3004_4_lut (.I0(line_state[0]), .I1(dpair_q[2]), .I2(n9975), 
            .I3(n12095), .O(n4126));   // ../../../common/usb_fs_rx.v(81[10] 104[6])
    defparam i3004_4_lut.LUT_INIT = 16'hca0a;
    SB_LUT4 i15_4_lut_4_lut (.I0(line_history[1]), .I1(line_history[3]), 
            .I2(line_history[0]), .I3(line_history[2]), .O(din));
    defparam i15_4_lut_4_lut.LUT_INIT = 16'h1008;
    SB_LUT4 i1_2_lut_rep_201_4_lut (.I0(n12093), .I1(line_history[0]), .I2(line_history[1]), 
            .I3(packet_valid), .O(n12042));   // ../../../common/usb_fs_rx.v(122[27:43])
    defparam i1_2_lut_rep_201_4_lut.LUT_INIT = 16'h2800;
    
endmodule
//
// Verilog Description of module \usb_fs_out_pe(NUM_OUT_EPS=5'b010) 
//

module \usb_fs_out_pe(NUM_OUT_EPS=5'b010)  (n4095, clk_48mhz, n12027, 
            n12036, n12030, rx_endp, \ep_state[1] , n12105, GND_net, 
            \ep_state[0] , n1292, \ep_get_addr[0][0] , n12020, \ep_state_next_0__1__N_1331[1] , 
            n10912, n11210, n12001, \out_ep_num[0] , \ep_get_addr[1][2] , 
            \ep_get_addr[0][1] , \ep_get_addr[1][1] , \ep_get_addr[1][0] , 
            \ep_state_next_0__1__N_1331[0] , rx_data, out_ep_data, VCC_net, 
            ctrl_out_ep_setup, out_xfr_state, n12015, n12104, n11451, 
            n11542, n8, n8_adj_1, n12005, n12057, ep_state_next_1__1__N_1228, 
            \ctrl_xfr_state_next_5__N_168[2] , \in_tx_pid[0] , n3080, 
            \in_tx_pid[2] , n3405, \in_tx_pid[3] , n3407, n41, n12029, 
            out_ep_data_valid, n12017, rx_data_put, n12049, n12106, 
            n12072, n12097, n12035, n12040, n12073, n12011, n12060, 
            n4, n12000) /* synthesis syn_module_defined=1 */ ;
    input n4095;
    input clk_48mhz;
    output n12027;
    output n12036;
    output n12030;
    input [3:0]rx_endp;
    output [1:0]\ep_state[1] ;
    output n12105;
    input GND_net;
    output [1:0]\ep_state[0] ;
    input n1292;
    output \ep_get_addr[0][0] ;
    input n12020;
    output \ep_state_next_0__1__N_1331[1] ;
    output n10912;
    input n11210;
    input n12001;
    input \out_ep_num[0] ;
    output \ep_get_addr[1][2] ;
    output \ep_get_addr[0][1] ;
    output \ep_get_addr[1][1] ;
    output \ep_get_addr[1][0] ;
    output \ep_state_next_0__1__N_1331[0] ;
    input [7:0]rx_data;
    output [7:0]out_ep_data;
    input VCC_net;
    output ctrl_out_ep_setup;
    output [1:0]out_xfr_state;
    input n12015;
    input n12104;
    input n11451;
    output n11542;
    output n8;
    output n8_adj_1;
    input n12005;
    input n12057;
    input ep_state_next_1__1__N_1228;
    output \ctrl_xfr_state_next_5__N_168[2] ;
    input \in_tx_pid[0] ;
    output n3080;
    input \in_tx_pid[2] ;
    output n3405;
    input \in_tx_pid[3] ;
    output n3407;
    input n41;
    input n12029;
    input out_ep_data_valid;
    output n12017;
    input rx_data_put;
    output n12049;
    input n12106;
    input n12072;
    input n12097;
    output n12035;
    output n12040;
    input n12073;
    input n12011;
    input n12060;
    input n4;
    input n12000;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    wire [5:0]ep_state_next_0__1__N_1331;
    
    wire n12088;
    wire [4:0]\ep_get_addr[0] ;   // ../../../common/usb_fs_out_pe.v(99[13:24])
    
    wire n6;
    wire [31:0]ep_get_addr_0__4__N_1309;
    
    wire n4092, n12032;
    wire [4:0]\ep_get_addr[1] ;   // ../../../common/usb_fs_out_pe.v(99[13:24])
    wire [6:0]n117;
    wire [3:0]current_endp;   // ../../../common/usb_fs_out_pe.v(93[13:25])
    
    wire n2883, n11409, ep_state_next_1__1__N_1223, n6_adj_2030;
    wire [3:0]tx_pid_3__N_1361;
    
    wire n12086;
    wire [5:0]n37;
    
    wire n9688, n11028, n11, n12, n22;
    wire [4:0]n1285;
    
    wire n12063;
    wire [3:0]tx_pid_3__N_1213;
    
    wire n7861, n9689, n12013, n1, n12087, ep_state_next_0__0__N_1258, 
        n9687;
    wire [8:0]buffer_get_addr;   // ../../../common/usb_fs_out_pe.v(107[14:29])
    
    wire n4107, ep_state_next_1__0__N_1238;
    wire [4:0]n1286;
    
    wire n4108;
    wire [1:0]out_xfr_state_next;   // ../../../common/usb_fs_out_pe.v(68[13:31])
    
    wire n10236;
    wire [1:0]data_toggle;   // ../../../common/usb_fs_out_pe.v(90[27:38])
    
    wire ep_state_next_0__1__N_1243, n983;
    wire [31:0]last_data_toggle_N_1394;
    
    wire last_data_toggle, n7578, n7579, n5, n12062, n12061, n12021, 
        n6_adj_2032, n2881;
    wire [31:0]ep_get_addr_1__4__N_1283;
    
    wire n4111, n12109;
    wire [1:0]out_ep_acked_1__N_1195;
    
    wire n9691, n9690, n12018, n12091, n12089, n12058, n7841, 
        n12064, n11399, n12_adj_2034, n1_adj_2035;
    
    SB_LUT4 LessThan_848_i6_3_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(\ep_get_addr[0] [2]), .I3(\ep_get_addr[0] [3]), 
            .O(n6));
    defparam LessThan_848_i6_3_lut_3_lut_4_lut.LUT_INIT = 16'hf660;
    SB_DFFESR \ep_get_addr_0[[4__256  (.Q(\ep_get_addr[0] [4]), .C(clk_48mhz), 
            .E(n4095), .D(ep_get_addr_0__4__N_1309[4]), .R(n4092));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_LUT4 i1486_2_lut_rep_191_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(ep_state_next_0__1__N_1331[5]), .I3(ep_state_next_0__1__N_1331[4]), 
            .O(n12032));
    defparam i1486_2_lut_rep_191_3_lut_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_2_lut_rep_186_3_lut_2_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(ep_state_next_0__1__N_1331[5]), .I3(ep_state_next_0__1__N_1331[4]), 
            .O(n12027));
    defparam i1_2_lut_rep_186_3_lut_2_lut_3_lut_4_lut.LUT_INIT = 16'h0f1e;
    SB_LUT4 i1_2_lut_rep_195_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(\ep_get_addr[1] [4]), .I3(ep_state_next_0__1__N_1331[4]), 
            .O(n12036));
    defparam i1_2_lut_rep_195_3_lut_4_lut.LUT_INIT = 16'he11e;
    SB_LUT4 i1_2_lut_rep_189_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(\ep_get_addr[0] [4]), .I3(ep_state_next_0__1__N_1331[4]), 
            .O(n12030));
    defparam i1_2_lut_rep_189_3_lut_4_lut.LUT_INIT = 16'he11e;
    SB_DFFE current_endp_i0_i3 (.Q(current_endp[3]), .C(clk_48mhz), .E(n117[3]), 
            .D(rx_endp[3]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFFE current_endp_i0_i2 (.Q(current_endp[2]), .C(clk_48mhz), .E(n117[3]), 
            .D(rx_endp[2]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFFE current_endp_i0_i1 (.Q(current_endp[1]), .C(clk_48mhz), .E(n117[3]), 
            .D(rx_endp[1]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_LUT4 ep_state_1__1__I_0_288_i3_4_lut (.I0(\ep_state[1] [0]), .I1(n2883), 
            .I2(\ep_state[1] [1]), .I3(n11409), .O(ep_state_next_1__1__N_1223));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_1__1__I_0_288_i3_4_lut.LUT_INIT = 16'h303a;
    SB_LUT4 i1_4_lut (.I0(n12105), .I1(current_endp[0]), .I2(n6_adj_2030), 
            .I3(tx_pid_3__N_1361[3]), .O(n117[2]));
    defparam i1_4_lut.LUT_INIT = 16'h0002;
    SB_DFFE current_endp_i0_i0 (.Q(current_endp[0]), .C(clk_48mhz), .E(n117[3]), 
            .D(rx_endp[0]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_LUT4 i1562_3_lut_4_lut (.I0(\ep_get_addr[0] [2]), .I1(n12086), .I2(\ep_get_addr[0] [3]), 
            .I3(\ep_get_addr[0] [4]), .O(ep_get_addr_0__4__N_1309[4]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1562_3_lut_4_lut.LUT_INIT = 16'h7f80;
    SB_LUT4 add_370_add_4_4_lut (.I0(GND_net), .I1(ep_state_next_0__1__N_1331[2]), 
            .I2(GND_net), .I3(n9688), .O(n37[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i9748_4_lut (.I0(\ep_state[0] [0]), .I1(n12032), .I2(n12027), 
            .I3(n1292), .O(n11028));
    defparam i9748_4_lut.LUT_INIT = 16'heaaa;
    SB_LUT4 i4_3_lut (.I0(current_endp[2]), .I1(current_endp[3]), .I2(\ep_state[0] [0]), 
            .I3(GND_net), .O(n11));
    defparam i4_3_lut.LUT_INIT = 16'h1010;
    SB_LUT4 i35_4_lut (.I0(n11), .I1(n11028), .I2(\ep_state[0] [1]), .I3(n12), 
            .O(n22));
    defparam i35_4_lut.LUT_INIT = 16'h3a30;
    SB_LUT4 i1768_3_lut (.I0(\ep_get_addr[0][0] ), .I1(n12020), .I2(n22), 
            .I3(GND_net), .O(n1285[0]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1768_3_lut.LUT_INIT = 16'h6a6a;
    SB_LUT4 i3_4_lut (.I0(n12063), .I1(tx_pid_3__N_1213[2]), .I2(tx_pid_3__N_1361[3]), 
            .I3(n12105), .O(n7861));
    defparam i3_4_lut.LUT_INIT = 16'hfeff;
    SB_LUT4 i1_2_lut (.I0(\ep_state_next_0__1__N_1331[1] ), .I1(ep_state_next_0__1__N_1331[2]), 
            .I2(GND_net), .I3(GND_net), .O(n10912));
    defparam i1_2_lut.LUT_INIT = 16'h6666;
    SB_CARRY add_370_add_4_4 (.CI(n9688), .I0(ep_state_next_0__1__N_1331[2]), 
            .I1(GND_net), .CO(n9689));
    SB_LUT4 ep_state_0__1__I_0_314_i1_4_lut (.I0(n11210), .I1(n12013), .I2(\ep_state[0] [0]), 
            .I3(n117[3]), .O(n1));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_0__1__I_0_314_i1_4_lut.LUT_INIT = 16'h3530;
    SB_LUT4 i10126_2_lut_3_lut (.I0(current_endp[0]), .I1(n12087), .I2(n7861), 
            .I3(GND_net), .O(n11409));   // ../../../common/usb_fs_out_pe.v(167[34:56])
    defparam i10126_2_lut_3_lut.LUT_INIT = 16'hfdfd;
    SB_LUT4 ep_state_0__1__I_0_314_i3_4_lut (.I0(n1), .I1(n12001), .I2(\ep_state[0] [1]), 
            .I3(\ep_state[0] [0]), .O(ep_state_next_0__0__N_1258));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_0__1__I_0_314_i3_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 i10299_2_lut (.I0(\ep_state[0] [0]), .I1(\ep_state[0] [1]), 
            .I2(GND_net), .I3(GND_net), .O(n4092));   // ../../../common/usb_fs_out_pe.v(230[11] 243[18])
    defparam i10299_2_lut.LUT_INIT = 16'h1111;
    SB_LUT4 add_370_add_4_3_lut (.I0(GND_net), .I1(\ep_state_next_0__1__N_1331[1] ), 
            .I2(GND_net), .I3(n9687), .O(n37[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 out_ep_num_0__I_0_332_Mux_4_i1_3_lut (.I0(\ep_get_addr[0] [4]), 
            .I1(\ep_get_addr[1] [4]), .I2(\out_ep_num[0] ), .I3(GND_net), 
            .O(buffer_get_addr[4]));   // ../../../common/usb_fs_out_pe.v(107[62:72])
    defparam out_ep_num_0__I_0_332_Mux_4_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 out_ep_num_0__I_0_332_Mux_3_i1_3_lut (.I0(\ep_get_addr[0] [3]), 
            .I1(\ep_get_addr[1] [3]), .I2(\out_ep_num[0] ), .I3(GND_net), 
            .O(buffer_get_addr[3]));   // ../../../common/usb_fs_out_pe.v(107[62:72])
    defparam out_ep_num_0__I_0_332_Mux_3_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 out_ep_num_0__I_0_332_Mux_2_i1_3_lut (.I0(\ep_get_addr[0] [2]), 
            .I1(\ep_get_addr[1][2] ), .I2(\out_ep_num[0] ), .I3(GND_net), 
            .O(buffer_get_addr[2]));   // ../../../common/usb_fs_out_pe.v(107[62:72])
    defparam out_ep_num_0__I_0_332_Mux_2_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 out_ep_num_0__I_0_332_Mux_1_i1_3_lut (.I0(\ep_get_addr[0][1] ), 
            .I1(\ep_get_addr[1][1] ), .I2(\out_ep_num[0] ), .I3(GND_net), 
            .O(buffer_get_addr[1]));   // ../../../common/usb_fs_out_pe.v(107[62:72])
    defparam out_ep_num_0__I_0_332_Mux_1_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 out_ep_num_0__I_0_332_Mux_0_i1_3_lut (.I0(\ep_get_addr[0][0] ), 
            .I1(\ep_get_addr[1][0] ), .I2(\out_ep_num[0] ), .I3(GND_net), 
            .O(buffer_get_addr[0]));   // ../../../common/usb_fs_out_pe.v(107[62:72])
    defparam out_ep_num_0__I_0_332_Mux_0_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_RAM512x8 out_data_buffer1 (.RDATA({out_ep_data}), .RCLK(clk_48mhz), 
            .RCLKE(VCC_net), .RE(VCC_net), .RADDR({GND_net, GND_net, 
            GND_net, \out_ep_num[0] , buffer_get_addr[4:0]}), .WCLK(clk_48mhz), 
            .WCLKE(VCC_net), .WE(n117[1]), .WADDR({GND_net, GND_net, 
            GND_net, current_endp[0], ep_state_next_0__1__N_1331[4:2], 
            \ep_state_next_0__1__N_1331[1] , \ep_state_next_0__1__N_1331[0] }), 
            .WDATA({rx_data}));
    defparam out_data_buffer1.INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam out_data_buffer1.INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    SB_DFF \ep_state_0[[0__255  (.Q(\ep_state[0] [0]), .C(clk_48mhz), .D(ep_state_next_0__0__N_1258));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_CARRY add_370_add_4_3 (.CI(n9687), .I0(\ep_state_next_0__1__N_1331[1] ), 
            .I1(GND_net), .CO(n9688));
    SB_DFFSR \ep_get_addr_0[[0__260  (.Q(\ep_get_addr[0][0] ), .C(clk_48mhz), 
            .D(n1285[0]), .R(n4092));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_LUT4 add_370_add_4_2_lut (.I0(GND_net), .I1(\ep_state_next_0__1__N_1331[0] ), 
            .I2(GND_net), .I3(VCC_net), .O(n37[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_DFF \ep_state_1[[1__261  (.Q(\ep_state[1] [1]), .C(clk_48mhz), .D(ep_state_next_1__1__N_1223));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFF out_ep_setup_i0 (.Q(ctrl_out_ep_setup), .C(clk_48mhz), .D(n4107));   // ../../../common/usb_fs_out_pe.v(256[10] 273[6])
    SB_DFF \ep_state_1[[0__262  (.Q(\ep_state[1] [0]), .C(clk_48mhz), .D(ep_state_next_1__0__N_1238));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFSR \ep_get_addr_1[[0__267  (.Q(\ep_get_addr[1][0] ), .C(clk_48mhz), 
            .D(n1286[0]), .R(n4108));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFF out_xfr_state_i0 (.Q(out_xfr_state[0]), .C(clk_48mhz), .D(out_xfr_state_next[0]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFF data_toggle_i0 (.Q(data_toggle[0]), .C(clk_48mhz), .D(n10236));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFF nak_out_transfer_277 (.Q(tx_pid_3__N_1361[3]), .C(clk_48mhz), 
           .D(n117[0]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFF \ep_state_0[[1__254  (.Q(\ep_state[0] [1]), .C(clk_48mhz), .D(ep_state_next_0__1__N_1243));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFSR ep_put_addr_0_0 (.Q(\ep_state_next_0__1__N_1331[0] ), .C(clk_48mhz), 
            .D(n37[0]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFSR ep_put_addr_0_1 (.Q(\ep_state_next_0__1__N_1331[1] ), .C(clk_48mhz), 
            .D(n37[1]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFSR ep_put_addr_0_2 (.Q(ep_state_next_0__1__N_1331[2]), .C(clk_48mhz), 
            .D(n37[2]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFSR ep_put_addr_0_3 (.Q(ep_state_next_0__1__N_1331[3]), .C(clk_48mhz), 
            .D(n37[3]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFSR ep_put_addr_0_4 (.Q(ep_state_next_0__1__N_1331[4]), .C(clk_48mhz), 
            .D(n37[4]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFSR ep_put_addr_0_5 (.Q(ep_state_next_0__1__N_1331[5]), .C(clk_48mhz), 
            .D(n37[5]), .R(n983));   // ../../../common/usb_fs_out_pe.v(102[13:24])
    SB_DFFE last_data_toggle_275 (.Q(last_data_toggle), .C(clk_48mhz), .E(n117[3]), 
            .D(last_data_toggle_N_1394[0]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_LUT4 i6707_3_lut_4_lut (.I0(n12015), .I1(n12104), .I2(rx_endp[0]), 
            .I3(n7578), .O(n7579));   // ../../../common/usb_fs_out_pe.v(121[5] 122[25])
    defparam i6707_3_lut_4_lut.LUT_INIT = 16'h7f00;
    SB_CARRY add_370_add_4_2 (.CI(VCC_net), .I0(\ep_state_next_0__1__N_1331[0] ), 
            .I1(GND_net), .CO(n9687));
    SB_LUT4 i1_3_lut_4_lut (.I0(n12015), .I1(n12104), .I2(n5), .I3(rx_endp[0]), 
            .O(n10236));   // ../../../common/usb_fs_out_pe.v(121[5] 122[25])
    defparam i1_3_lut_4_lut.LUT_INIT = 16'hf070;
    SB_LUT4 i2985_4_lut_4_lut (.I0(n12015), .I1(n12104), .I2(n11451), 
            .I3(ctrl_out_ep_setup), .O(n4107));   // ../../../common/usb_fs_out_pe.v(121[5] 122[25])
    defparam i2985_4_lut_4_lut.LUT_INIT = 16'hfd08;
    SB_LUT4 i10255_3_lut_4_lut (.I0(\ep_get_addr[0] [3]), .I1(n12062), .I2(n10912), 
            .I3(\ep_get_addr[0] [2]), .O(n11542));
    defparam i10255_3_lut_4_lut.LUT_INIT = 16'h0660;
    SB_LUT4 i1_2_lut_rep_180_3_lut_4_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[4]), 
            .I1(n12061), .I2(n1292), .I3(ep_state_next_0__1__N_1331[5]), 
            .O(n12021));
    defparam i1_2_lut_rep_180_3_lut_4_lut_3_lut_4_lut.LUT_INIT = 16'h10e0;
    SB_LUT4 LessThan_851_i8_3_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[4]), 
            .I1(n12061), .I2(n6_adj_2032), .I3(\ep_get_addr[1] [4]), .O(n8));
    defparam LessThan_851_i8_3_lut_3_lut_4_lut.LUT_INIT = 16'hf660;
    SB_LUT4 LessThan_848_i8_3_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[4]), 
            .I1(n12061), .I2(n6), .I3(\ep_get_addr[0] [4]), .O(n8_adj_1));
    defparam LessThan_848_i8_3_lut_3_lut_4_lut.LUT_INIT = 16'hf660;
    SB_DFF out_xfr_state_i1 (.Q(out_xfr_state[1]), .C(clk_48mhz), .D(out_xfr_state_next[1]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_DFF data_toggle_i1 (.Q(data_toggle[1]), .C(clk_48mhz), .D(n7579));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    SB_LUT4 ep_state_0__1__I_0_294_i2_3_lut_4_lut (.I0(n12005), .I1(n11210), 
            .I2(\ep_state[0] [0]), .I3(n12021), .O(n2881));   // ../../../common/usb_fs_out_pe.v(189[19:60])
    defparam ep_state_0__1__I_0_294_i2_3_lut_4_lut.LUT_INIT = 16'h2f20;
    SB_DFFESR \ep_get_addr_1[[3__264  (.Q(\ep_get_addr[1] [3]), .C(clk_48mhz), 
            .E(n4111), .D(ep_get_addr_1__4__N_1283[3]), .R(n4108));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFESR \ep_get_addr_1[[4__263  (.Q(\ep_get_addr[1] [4]), .C(clk_48mhz), 
            .E(n4111), .D(ep_get_addr_1__4__N_1283[4]), .R(n4108));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFESR \ep_get_addr_0[[1__259  (.Q(\ep_get_addr[0][1] ), .C(clk_48mhz), 
            .E(n4095), .D(ep_get_addr_0__4__N_1309[1]), .R(n4092));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_LUT4 ep_state_1__1__I_0_288_i2_3_lut_4_lut (.I0(n12005), .I1(n12057), 
            .I2(\ep_state[1] [0]), .I3(ep_state_next_1__1__N_1228), .O(n2883));   // ../../../common/usb_fs_out_pe.v(189[19:60])
    defparam ep_state_1__1__I_0_288_i2_3_lut_4_lut.LUT_INIT = 16'h2f20;
    SB_DFFESR \ep_get_addr_0[[2__258  (.Q(\ep_get_addr[0] [2]), .C(clk_48mhz), 
            .E(n4095), .D(ep_get_addr_0__4__N_1309[2]), .R(n4092));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFESR \ep_get_addr_0[[3__257  (.Q(\ep_get_addr[0] [3]), .C(clk_48mhz), 
            .E(n4095), .D(ep_get_addr_0__4__N_1309[3]), .R(n4092));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFESR \ep_get_addr_1[[1__266  (.Q(\ep_get_addr[1][1] ), .C(clk_48mhz), 
            .E(n4111), .D(ep_get_addr_1__4__N_1283[1]), .R(n4108));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_DFFESR \ep_get_addr_1[[2__265  (.Q(\ep_get_addr[1][2] ), .C(clk_48mhz), 
            .E(n4111), .D(ep_get_addr_1__4__N_1283[2]), .R(n4108));   // ../../../common/usb_fs_out_pe.v(205[14] 245[10])
    SB_LUT4 i1512_2_lut_3_lut (.I0(\ep_get_addr[1][1] ), .I1(\ep_get_addr[1][0] ), 
            .I2(\ep_get_addr[1][2] ), .I3(GND_net), .O(ep_get_addr_1__4__N_1283[2]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1512_2_lut_3_lut.LUT_INIT = 16'h7878;
    SB_LUT4 i1519_2_lut_3_lut_4_lut (.I0(\ep_get_addr[1][1] ), .I1(\ep_get_addr[1][0] ), 
            .I2(\ep_get_addr[1] [3]), .I3(\ep_get_addr[1][2] ), .O(ep_get_addr_1__4__N_1283[3]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1519_2_lut_3_lut_4_lut.LUT_INIT = 16'h78f0;
    SB_LUT4 i1507_2_lut_rep_268 (.I0(\ep_get_addr[1][1] ), .I1(\ep_get_addr[1][0] ), 
            .I2(GND_net), .I3(GND_net), .O(n12109));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1507_2_lut_rep_268.LUT_INIT = 16'h8888;
    SB_LUT4 i1505_2_lut (.I0(\ep_get_addr[1][1] ), .I1(\ep_get_addr[1][0] ), 
            .I2(GND_net), .I3(GND_net), .O(ep_get_addr_1__4__N_1283[1]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1505_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i10425_3_lut_4_lut (.I0(out_xfr_state[0]), .I1(out_xfr_state[1]), 
            .I2(n117[2]), .I3(\ctrl_xfr_state_next_5__N_168[2] ), .O(\ctrl_xfr_state_next_5__N_168[2] ));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i10425_3_lut_4_lut.LUT_INIT = 16'h8f80;
    SB_LUT4 i1_2_lut_3_lut (.I0(out_xfr_state[0]), .I1(out_xfr_state[1]), 
            .I2(\in_tx_pid[0] ), .I3(GND_net), .O(n3080));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 i6650_3_lut_4_lut (.I0(out_xfr_state[0]), .I1(out_xfr_state[1]), 
            .I2(tx_pid_3__N_1213[2]), .I3(\in_tx_pid[2] ), .O(n3405));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i6650_3_lut_4_lut.LUT_INIT = 16'hf780;
    SB_LUT4 i1_2_lut_rep_264 (.I0(out_xfr_state[0]), .I1(out_xfr_state[1]), 
            .I2(GND_net), .I3(GND_net), .O(n12105));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i1_2_lut_rep_264.LUT_INIT = 16'h8888;
    SB_LUT4 current_endp_0__I_0_334_Mux_0_i1_3_lut (.I0(\ep_state[0] [0]), 
            .I1(\ep_state[1] [0]), .I2(current_endp[0]), .I3(GND_net), 
            .O(out_ep_acked_1__N_1195[0]));   // ../../../common/usb_fs_out_pe.v(337[22:34])
    defparam current_endp_0__I_0_334_Mux_0_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i6432_4_lut (.I0(out_ep_acked_1__N_1195[0]), .I1(\ep_state[0] [1]), 
            .I2(\ep_state[1] [1]), .I3(current_endp[0]), .O(tx_pid_3__N_1213[2]));
    defparam i6432_4_lut.LUT_INIT = 16'ha088;
    SB_LUT4 i6654_4_lut (.I0(\in_tx_pid[3] ), .I1(tx_pid_3__N_1361[3]), 
            .I2(n12105), .I3(tx_pid_3__N_1213[2]), .O(n3407));
    defparam i6654_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 i1541_2_lut (.I0(\ep_get_addr[0][1] ), .I1(\ep_get_addr[0][0] ), 
            .I2(GND_net), .I3(GND_net), .O(ep_get_addr_0__4__N_1309[1]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1541_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i13_4_lut (.I0(out_xfr_state[1]), .I1(out_xfr_state[0]), .I2(n41), 
            .I3(n12029), .O(out_xfr_state_next[1]));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i13_4_lut.LUT_INIT = 16'h4602;
    SB_LUT4 i1_2_lut_rep_176_4_lut (.I0(n12021), .I1(\ep_state[0] [0]), 
            .I2(\ep_state[0] [1]), .I3(out_ep_data_valid), .O(n12017));
    defparam i1_2_lut_rep_176_4_lut.LUT_INIT = 16'hef00;
    SB_LUT4 add_370_add_4_7_lut (.I0(GND_net), .I1(ep_state_next_0__1__N_1331[5]), 
            .I2(GND_net), .I3(n9691), .O(n37[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_370_add_4_6_lut (.I0(GND_net), .I1(ep_state_next_0__1__N_1331[4]), 
            .I2(GND_net), .I3(n9690), .O(n37[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i6692_3_lut_rep_177_4_lut (.I0(out_xfr_state[1]), .I1(out_xfr_state[0]), 
            .I2(n7861), .I3(n41), .O(n12018));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    defparam i6692_3_lut_rep_177_4_lut.LUT_INIT = 16'h2f0f;
    SB_LUT4 i2_3_lut_4_lut (.I0(out_xfr_state[1]), .I1(out_xfr_state[0]), 
            .I2(ep_state_next_0__1__N_1331[5]), .I3(rx_data_put), .O(n117[1]));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h0200;
    SB_LUT4 i1_2_lut_rep_250 (.I0(out_xfr_state[1]), .I1(out_xfr_state[0]), 
            .I2(GND_net), .I3(GND_net), .O(n12091));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    defparam i1_2_lut_rep_250.LUT_INIT = 16'h2222;
    SB_CARRY add_370_add_4_6 (.CI(n9690), .I0(ep_state_next_0__1__N_1331[4]), 
            .I1(GND_net), .CO(n9691));
    SB_LUT4 add_370_add_4_5_lut (.I0(GND_net), .I1(ep_state_next_0__1__N_1331[3]), 
            .I2(GND_net), .I3(n9689), .O(n37[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_370_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_370_add_4_5 (.CI(n9689), .I0(ep_state_next_0__1__N_1331[3]), 
            .I1(GND_net), .CO(n9690));
    SB_LUT4 i6473_4_lut_3_lut (.I0(data_toggle[1]), .I1(current_endp[0]), 
            .I2(n7861), .I3(GND_net), .O(n7578));   // ../../../common/usb_fs_out_pe.v(141[37:49])
    defparam i6473_4_lut_3_lut.LUT_INIT = 16'ha6a6;
    SB_LUT4 i16_4_lut_3_lut (.I0(data_toggle[0]), .I1(current_endp[0]), 
            .I2(n7861), .I3(GND_net), .O(n5));   // ../../../common/usb_fs_out_pe.v(141[37:49])
    defparam i16_4_lut_3_lut.LUT_INIT = 16'ha9a9;
    SB_LUT4 last_data_toggle_I_0_2_lut_rep_222_4_lut (.I0(data_toggle[0]), 
            .I1(data_toggle[1]), .I2(current_endp[0]), .I3(last_data_toggle), 
            .O(n12063));   // ../../../common/usb_fs_out_pe.v(141[37:49])
    defparam last_data_toggle_I_0_2_lut_rep_222_4_lut.LUT_INIT = 16'h35ca;
    SB_LUT4 data_toggle_0__I_0_3_lut_rep_248 (.I0(data_toggle[0]), .I1(data_toggle[1]), 
            .I2(current_endp[0]), .I3(GND_net), .O(n12089));   // ../../../common/usb_fs_out_pe.v(141[37:49])
    defparam data_toggle_0__I_0_3_lut_rep_248.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_2_lut_rep_208_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[2]), 
            .I1(\ep_state_next_0__1__N_1331[1] ), .I2(\ep_get_addr[1] [3]), 
            .I3(ep_state_next_0__1__N_1331[3]), .O(n12049));
    defparam i1_2_lut_rep_208_3_lut_4_lut.LUT_INIT = 16'he11e;
    SB_LUT4 i6731_2_lut_4_lut (.I0(n41), .I1(n7861), .I2(n12091), .I3(n12058), 
            .O(n7841));
    defparam i6731_2_lut_4_lut.LUT_INIT = 16'h00b3;
    SB_LUT4 i1_2_lut_rep_221_3_lut (.I0(ep_state_next_0__1__N_1331[2]), .I1(\ep_state_next_0__1__N_1331[1] ), 
            .I2(ep_state_next_0__1__N_1331[3]), .I3(GND_net), .O(n12062));
    defparam i1_2_lut_rep_221_3_lut.LUT_INIT = 16'h1e1e;
    SB_LUT4 i1470_2_lut_rep_220_3_lut (.I0(ep_state_next_0__1__N_1331[2]), 
            .I1(\ep_state_next_0__1__N_1331[1] ), .I2(ep_state_next_0__1__N_1331[3]), 
            .I3(GND_net), .O(n12061));
    defparam i1470_2_lut_rep_220_3_lut.LUT_INIT = 16'hfefe;
    SB_LUT4 i1462_2_lut_rep_247 (.I0(ep_state_next_0__1__N_1331[2]), .I1(\ep_state_next_0__1__N_1331[1] ), 
            .I2(GND_net), .I3(GND_net), .O(n12088));
    defparam i1462_2_lut_rep_247.LUT_INIT = 16'heeee;
    SB_LUT4 i1_2_lut_rep_223_4_lut (.I0(current_endp[2]), .I1(current_endp[1]), 
            .I2(current_endp[3]), .I3(current_endp[0]), .O(n12064));   // ../../../common/usb_fs_out_pe.v(167[34:56])
    defparam i1_2_lut_rep_223_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i6763_2_lut_rep_172_4_lut (.I0(n41), .I1(n7861), .I2(n12091), 
            .I3(n12064), .O(n12013));
    defparam i6763_2_lut_rep_172_4_lut.LUT_INIT = 16'h00b3;
    SB_LUT4 i1_2_lut_rep_217_4_lut (.I0(current_endp[2]), .I1(current_endp[1]), 
            .I2(current_endp[3]), .I3(current_endp[0]), .O(n12058));   // ../../../common/usb_fs_out_pe.v(167[34:56])
    defparam i1_2_lut_rep_217_4_lut.LUT_INIT = 16'hfeff;
    SB_LUT4 i2_3_lut_rep_246 (.I0(current_endp[2]), .I1(current_endp[1]), 
            .I2(current_endp[3]), .I3(GND_net), .O(n12087));   // ../../../common/usb_fs_out_pe.v(167[34:56])
    defparam i2_3_lut_rep_246.LUT_INIT = 16'hfefe;
    SB_LUT4 i1548_2_lut_3_lut (.I0(\ep_get_addr[0][1] ), .I1(\ep_get_addr[0][0] ), 
            .I2(\ep_get_addr[0] [2]), .I3(GND_net), .O(ep_get_addr_0__4__N_1309[2]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1548_2_lut_3_lut.LUT_INIT = 16'h7878;
    SB_LUT4 i1555_2_lut_3_lut_4_lut (.I0(\ep_get_addr[0][1] ), .I1(\ep_get_addr[0][0] ), 
            .I2(\ep_get_addr[0] [3]), .I3(\ep_get_addr[0] [2]), .O(ep_get_addr_0__4__N_1309[3]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1555_2_lut_3_lut_4_lut.LUT_INIT = 16'h78f0;
    SB_LUT4 i1543_2_lut_rep_245 (.I0(\ep_get_addr[0][1] ), .I1(\ep_get_addr[0][0] ), 
            .I2(GND_net), .I3(GND_net), .O(n12086));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1543_2_lut_rep_245.LUT_INIT = 16'h8888;
    SB_LUT4 i1769_2_lut_4_lut (.I0(\out_ep_num[0] ), .I1(ep_state_next_1__0__N_1238), 
            .I2(ep_state_next_1__1__N_1223), .I3(\ep_get_addr[1][0] ), .O(n1286[0]));
    defparam i1769_2_lut_4_lut.LUT_INIT = 16'hdf20;
    SB_LUT4 i1526_3_lut_4_lut (.I0(\ep_get_addr[1][2] ), .I1(n12109), .I2(\ep_get_addr[1] [3]), 
            .I3(\ep_get_addr[1] [4]), .O(ep_get_addr_1__4__N_1283[4]));   // ../../../common/usb_fs_out_pe.v(224[43:71])
    defparam i1526_3_lut_4_lut.LUT_INIT = 16'h7f80;
    SB_LUT4 i6436_4_lut (.I0(data_toggle[0]), .I1(n12005), .I2(data_toggle[1]), 
            .I3(rx_endp[0]), .O(last_data_toggle_N_1394[0]));   // ../../../common/usb_fs_out_pe.v(368[29:76])
    defparam i6436_4_lut.LUT_INIT = 16'h3022;
    SB_LUT4 i6792_2_lut_rep_194_3_lut_4_lut (.I0(n12106), .I1(n12105), .I2(n12072), 
            .I3(n12097), .O(n12035));
    defparam i6792_2_lut_rep_194_3_lut_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i10319_2_lut_rep_199_3_lut_4_lut (.I0(n12106), .I1(n12105), 
            .I2(n12072), .I3(n12097), .O(n12040));
    defparam i10319_2_lut_rep_199_3_lut_4_lut.LUT_INIT = 16'h0001;
    SB_LUT4 i5_3_lut_4_lut (.I0(n12064), .I1(n12018), .I2(n117[2]), .I3(current_endp[1]), 
            .O(n12));
    defparam i5_3_lut_4_lut.LUT_INIT = 16'h0040;
    SB_LUT4 i1_2_lut_4_lut (.I0(\out_ep_num[0] ), .I1(ep_state_next_1__0__N_1238), 
            .I2(ep_state_next_1__1__N_1223), .I3(n4108), .O(n4111));
    defparam i1_2_lut_4_lut.LUT_INIT = 16'hff20;
    SB_LUT4 i1_2_lut_adj_194 (.I0(out_xfr_state[0]), .I1(out_xfr_state[1]), 
            .I2(GND_net), .I3(GND_net), .O(n983));   // ../../../common/usb_fs_out_pe.v(360[10] 408[6])
    defparam i1_2_lut_adj_194.LUT_INIT = 16'h2222;
    SB_LUT4 ep_state_0__1__I_0_294_i3_4_lut (.I0(\ep_state[0] [0]), .I1(n2881), 
            .I2(\ep_state[0] [1]), .I3(n11399), .O(ep_state_next_0__1__N_1243));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_0__1__I_0_294_i3_4_lut.LUT_INIT = 16'h303a;
    SB_LUT4 i6652_4_lut (.I0(out_ep_acked_1__N_1195[0]), .I1(tx_pid_3__N_1361[3]), 
            .I2(out_xfr_state[1]), .I3(out_xfr_state[0]), .O(n117[0]));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i6652_4_lut.LUT_INIT = 16'hc5cc;
    SB_LUT4 i1_3_lut_4_lut_adj_195 (.I0(n12015), .I1(n12073), .I2(out_xfr_state[1]), 
            .I3(out_xfr_state[0]), .O(n117[3]));   // ../../../common/usb_fs_out_pe.v(301[13:55])
    defparam i1_3_lut_4_lut_adj_195.LUT_INIT = 16'h0002;
    SB_LUT4 i26_4_lut (.I0(n12011), .I1(n12060), .I2(out_xfr_state[1]), 
            .I3(n4), .O(n12_adj_2034));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i26_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 i25_4_lut (.I0(n12_adj_2034), .I1(n12029), .I2(out_xfr_state[0]), 
            .I3(out_xfr_state[1]), .O(out_xfr_state_next[0]));   // ../../../common/usb_fs_out_pe.v(67[13:26])
    defparam i25_4_lut.LUT_INIT = 16'h0a3a;
    SB_LUT4 i10343_2_lut (.I0(\ep_state[1] [0]), .I1(\ep_state[1] [1]), 
            .I2(GND_net), .I3(GND_net), .O(n4108));   // ../../../common/usb_fs_out_pe.v(230[11] 243[18])
    defparam i10343_2_lut.LUT_INIT = 16'h1111;
    SB_LUT4 i10117_2_lut_3_lut (.I0(current_endp[0]), .I1(n12087), .I2(n7861), 
            .I3(GND_net), .O(n11399));   // ../../../common/usb_fs_out_pe.v(167[34:56])
    defparam i10117_2_lut_3_lut.LUT_INIT = 16'hfefe;
    SB_LUT4 i2_2_lut_3_lut (.I0(last_data_toggle), .I1(n12089), .I2(tx_pid_3__N_1213[2]), 
            .I3(GND_net), .O(n6_adj_2030));   // ../../../common/usb_fs_out_pe.v(141[5:50])
    defparam i2_2_lut_3_lut.LUT_INIT = 16'hf6f6;
    SB_LUT4 ep_state_1__1__I_0_298_i1_4_lut (.I0(n12057), .I1(n7841), .I2(\ep_state[1] [0]), 
            .I3(n117[3]), .O(n1_adj_2035));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_1__1__I_0_298_i1_4_lut.LUT_INIT = 16'h3530;
    SB_LUT4 LessThan_851_i6_3_lut_3_lut_4_lut (.I0(ep_state_next_0__1__N_1331[3]), 
            .I1(n12088), .I2(\ep_get_addr[1][2] ), .I3(\ep_get_addr[1] [3]), 
            .O(n6_adj_2032));
    defparam LessThan_851_i6_3_lut_3_lut_4_lut.LUT_INIT = 16'hf660;
    SB_LUT4 ep_state_1__1__I_0_298_i3_4_lut (.I0(n1_adj_2035), .I1(n12000), 
            .I2(\ep_state[1] [1]), .I3(\ep_state[1] [0]), .O(ep_state_next_1__0__N_1238));   // ../../../common/usb_fs_out_pe.v(156[11] 200[18])
    defparam ep_state_1__1__I_0_298_i3_4_lut.LUT_INIT = 16'h3a0a;
    
endmodule
//
// Verilog Description of module \usb_fs_out_arb(NUM_OUT_EPS=5'b010) 
//

module \usb_fs_out_arb(NUM_OUT_EPS=5'b010)  (get_spi_out_data, serial_out_ep_grant, 
            get_cmd_out_data, \out_ep_num[0] , GND_net, n12020, \ep_state[1] , 
            ep_state_next_1__1__N_1228) /* synthesis syn_module_defined=1 */ ;
    input get_spi_out_data;
    output serial_out_ep_grant;
    input get_cmd_out_data;
    output \out_ep_num[0] ;
    input GND_net;
    input n12020;
    input [1:0]\ep_state[1] ;
    input ep_state_next_1__1__N_1228;
    
    
    SB_LUT4 i1_3_lut (.I0(get_spi_out_data), .I1(serial_out_ep_grant), .I2(get_cmd_out_data), 
            .I3(GND_net), .O(\out_ep_num[0] ));   // ../../../common/usb_fs_out_arb.v(19[11:34])
    defparam i1_3_lut.LUT_INIT = 16'hc8c8;
    SB_LUT4 i10346_4_lut (.I0(n12020), .I1(\ep_state[1] [1]), .I2(\ep_state[1] [0]), 
            .I3(ep_state_next_1__1__N_1228), .O(serial_out_ep_grant));
    defparam i10346_4_lut.LUT_INIT = 16'h0004;
    
endmodule
//
// Verilog Description of module \usb_fs_in_pe(NUM_IN_EPS=5'b011) 
//

module \usb_fs_in_pe(NUM_IN_EPS=5'b011)  (rx_endp, clk_48mhz, rx_pid, 
            rx_pkt_valid, rx_pkt_end, n41, ctrl_in_ep_stall, \in_ep_num_1__N_1088[0] , 
            GND_net, arb_in_ep_data, tx_data, VCC_net, in_ep_req_0__N_914, 
            ctrl_in_ep_data_put, ack_received, \ctrl_xfr_state[2] , all_data_sent, 
            n11210, tx_data_avail, serial_in_ep_data_done, n5, n5383, 
            in_q, \ctrl_xfr_state[0] , \ctrl_xfr_state[1] , \ctrl_xfr_state_next_5__N_168[2] , 
            n1854, n12112, out_ep_data_valid, ctrl_out_ep_setup, n12020, 
            \ctrl_xfr_state_next_5__N_150[0] , n1289, \bytes_sent[7] , 
            n3826, n14, n12073, n10174, n11451, n12108, n11064, 
            token_received_N_1149, n12103, n10867, rx_addr, dev_addr, 
            in_tx_pid, out_xfr_state, n12074, n12106, n12024, n12015, 
            n12001, n12007, n10212, n12104, has_data_stage, n12017, 
            n1857, status_stage_end, save_dev_addr, n275, n4, n12107, 
            sof_valid, n10901, n12060, n12011, n12005) /* synthesis syn_module_defined=1 */ ;
    input [3:0]rx_endp;
    input clk_48mhz;
    input [3:0]rx_pid;
    input rx_pkt_valid;
    input rx_pkt_end;
    output n41;
    input ctrl_in_ep_stall;
    input \in_ep_num_1__N_1088[0] ;
    input GND_net;
    input [7:0]arb_in_ep_data;
    output [7:0]tx_data;
    input VCC_net;
    input in_ep_req_0__N_914;
    output ctrl_in_ep_data_put;
    input ack_received;
    input \ctrl_xfr_state[2] ;
    output all_data_sent;
    input n11210;
    output tx_data_avail;
    input serial_in_ep_data_done;
    input n5;
    input n5383;
    input in_q;
    input \ctrl_xfr_state[0] ;
    input \ctrl_xfr_state[1] ;
    input \ctrl_xfr_state_next_5__N_168[2] ;
    input n1854;
    output n12112;
    input out_ep_data_valid;
    input ctrl_out_ep_setup;
    input n12020;
    output \ctrl_xfr_state_next_5__N_150[0] ;
    input n1289;
    input \bytes_sent[7] ;
    input n3826;
    input n14;
    output n12073;
    output n10174;
    output n11451;
    output n12108;
    output n11064;
    output token_received_N_1149;
    input n12103;
    output n10867;
    input [6:0]rx_addr;
    input [6:0]dev_addr;
    output [3:0]in_tx_pid;
    input [1:0]out_xfr_state;
    output n12074;
    output n12106;
    input n12024;
    input n12015;
    output n12001;
    input n12007;
    output n10212;
    output n12104;
    input has_data_stage;
    input n12017;
    output n1857;
    output status_stage_end;
    input save_dev_addr;
    output n275;
    input n4;
    input n12107;
    output sof_valid;
    input n10901;
    output n12060;
    output n12011;
    output n12005;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    
    wire n12010;
    wire [8:0]buffer_get_addr;   // ../../../common/usb_fs_in_pe.v(108[14:29])
    
    wire n12090, ep_state_next_0__0__N_997;
    wire [1:0]\ep_state[0] ;   // ../../../common/usb_fs_in_pe.v(60[13:21])
    
    wire ep_state_next_1__1__N_980;
    wire [1:0]\ep_state[1] ;   // ../../../common/usb_fs_in_pe.v(60[13:21])
    
    wire ep_state_next_1__0__N_987, n11202;
    wire [1:0]in_xfr_state_next;   // ../../../common/usb_fs_in_pe.v(77[13:30])
    wire [1:0]in_xfr_state;   // ../../../common/usb_fs_in_pe.v(76[13:25])
    wire [8:0]buffer_put_addr;   // ../../../common/usb_fs_in_pe.v(107[14:29])
    wire [5:0]more_data_to_send_N_1106;
    
    wire in_data_buffer_N_1140, n6;
    wire [2:0]data_toggle;   // ../../../common/usb_fs_in_pe.v(89[26:37])
    
    wire ep_state_next_0__1__N_990;
    wire [5:0]n37;
    
    wire ep_get_addr_0_0, n771, n7791, n17, n12, ep_get_addr_0_1, 
        n12033, n10842, ep_get_addr_0_2, ep_get_addr_0_3, ep_get_addr_0_4, 
        ep_get_addr_0_5, n10897, n1, n2;
    wire [5:0]\ep_put_addr[0] ;   // ../../../common/usb_fs_in_pe.v(93[13:24])
    wire [31:0]ep_put_addr_0__5__N_1067;
    
    wire n4426, n4612;
    wire [5:0]\ep_put_addr[1] ;   // ../../../common/usb_fs_in_pe.v(93[13:24])
    
    wire n4_c, more_data_to_send;
    wire [1:0]in_xfr_state_next_1__N_1118;
    
    wire n2_adj_2011, n1_adj_2012, n1_adj_2013, n1_adj_2014, n11401, 
        n11471, n12012, n11453, n11260, n11459, n11469, n1_adj_2015, 
        n11998, n12008, n1_adj_2016, n4_adj_2017, n12045, n12044, 
        n12043, n5_c, n11535, n2_adj_2018, n1_adj_2019, ep_state_next_1__1__N_982, 
        n6_adj_2020, n12016, n2857, n6_adj_2021;
    wire [31:0]ep_put_addr_1__5__N_1043;
    
    wire n12110, n4619, n9686, n10928, n12002, n9685, n9701, n9684, 
        n9700, n12004, n10873, n10875, n9699, n20, n17_adj_2023, 
        n9698, n9683, n9697, n4_adj_2024, n9682, n11427, n11431, 
        n9696, n11463, n3, n9695, n45, n26, n22_adj_2025, n5401, 
        n9694, n10, n9693, n2_adj_2027, n4_adj_2028, n9692, n11340, 
        n13, n11175, n12078;
    wire [1:0]in_xfr_state_next_1__N_1102;
    
    wire n4_adj_2029;
    
    SB_DFFE current_endp__i4 (.Q(buffer_get_addr[8]), .C(clk_48mhz), .E(n12010), 
            .D(rx_endp[3]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_DFFE current_endp__i3 (.Q(buffer_get_addr[7]), .C(clk_48mhz), .E(n12010), 
            .D(rx_endp[2]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_DFFE current_endp__i2 (.Q(buffer_get_addr[6]), .C(clk_48mhz), .E(n12010), 
            .D(rx_endp[1]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_LUT4 i1_3_lut_4_lut_3_lut_4_lut (.I0(rx_pid[0]), .I1(n12090), .I2(rx_pkt_valid), 
            .I3(rx_pkt_end), .O(n41));   // ../../../common/usb_fs_in_pe.v(33[15:21])
    defparam i1_3_lut_4_lut_3_lut_4_lut.LUT_INIT = 16'hdf00;
    SB_DFFE current_endp__i1 (.Q(buffer_get_addr[5]), .C(clk_48mhz), .E(n12010), 
            .D(rx_endp[0]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_DFFSS \ep_state_0[[0__269  (.Q(\ep_state[0] [0]), .C(clk_48mhz), 
            .D(ep_state_next_0__0__N_997), .S(ctrl_in_ep_stall));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFF \ep_state_1[[1__276  (.Q(\ep_state[1] [1]), .C(clk_48mhz), .D(ep_state_next_1__1__N_980));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFF \ep_state_1[[0__277  (.Q(\ep_state[1] [0]), .C(clk_48mhz), .D(ep_state_next_1__0__N_987));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_LUT4 i3_4_lut (.I0(rx_pid[3]), .I1(n12090), .I2(rx_pkt_valid), 
            .I3(rx_pid[0]), .O(n11202));   // ../../../common/usb_fs_in_pe.v(33[15:21])
    defparam i3_4_lut.LUT_INIT = 16'hffef;
    SB_DFF in_xfr_state_i0 (.Q(in_xfr_state[0]), .C(clk_48mhz), .D(in_xfr_state_next[0]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_RAM512x8 in_data_buffer0 (.RDATA({tx_data}), .RCLK(clk_48mhz), .RCLKE(VCC_net), 
            .RE(VCC_net), .RADDR({GND_net, GND_net, buffer_get_addr[6:5], 
            more_data_to_send_N_1106[4:0]}), .WCLK(clk_48mhz), .WCLKE(VCC_net), 
            .WE(in_data_buffer_N_1140), .WADDR({GND_net, GND_net, GND_net, 
            \in_ep_num_1__N_1088[0] , buffer_put_addr[4:0]}), .WDATA({arb_in_ep_data}));
    defparam in_data_buffer0.INIT_0 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_1 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_2 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_4 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_5 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_6 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_7 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_8 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_9 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam in_data_buffer0.INIT_F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    SB_DFF data_toggle_i0 (.Q(data_toggle[0]), .C(clk_48mhz), .D(n6));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_DFFSS \ep_state_0[[1__268  (.Q(\ep_state[0] [1]), .C(clk_48mhz), 
            .D(ep_state_next_0__1__N_990), .S(ctrl_in_ep_stall));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFSR ep_get_addr_0_0_c (.Q(ep_get_addr_0_0), .C(clk_48mhz), .D(n37[0]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_LUT4 ep_state_0__1__I_0_321_i3_3_lut (.I0(n7791), .I1(n17), .I2(\ep_state[0] [1]), 
            .I3(GND_net), .O(ep_state_next_0__1__N_990));   // ../../../common/usb_fs_in_pe.v(171[11] 213[18])
    defparam ep_state_0__1__I_0_321_i3_3_lut.LUT_INIT = 16'h3a3a;
    SB_LUT4 i5_4_lut (.I0(rx_pid[3]), .I1(rx_pkt_valid), .I2(in_xfr_state[1]), 
            .I3(rx_pid[1]), .O(n12));
    defparam i5_4_lut.LUT_INIT = 16'h4000;
    SB_DFFSR ep_get_addr_0_1_c (.Q(ep_get_addr_0_1), .C(clk_48mhz), .D(n37[1]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_LUT4 i6_4_lut (.I0(rx_pid[2]), .I1(n12), .I2(n12033), .I3(rx_pid[0]), 
            .O(n10842));
    defparam i6_4_lut.LUT_INIT = 16'h0040;
    SB_DFFSR ep_get_addr_0_2_c (.Q(ep_get_addr_0_2), .C(clk_48mhz), .D(n37[2]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_DFFSR ep_get_addr_0_3_c (.Q(ep_get_addr_0_3), .C(clk_48mhz), .D(n37[3]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_DFFSR ep_get_addr_0_4_c (.Q(ep_get_addr_0_4), .C(clk_48mhz), .D(n37[4]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_DFFSR ep_get_addr_0_5_c (.Q(ep_get_addr_0_5), .C(clk_48mhz), .D(n37[5]), 
            .R(n771));   // ../../../common/usb_fs_in_pe.v(94[13:24])
    SB_LUT4 i1_2_lut (.I0(buffer_get_addr[5]), .I1(n10842), .I2(GND_net), 
            .I3(GND_net), .O(n10897));   // ../../../common/usb_fs_in_pe.v(382[13:38])
    defparam i1_2_lut.LUT_INIT = 16'hbbbb;
    SB_LUT4 Mux_187_i1_3_lut (.I0(data_toggle[0]), .I1(data_toggle[1]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1));   // ../../../common/usb_fs_in_pe.v(305[34:46])
    defparam Mux_187_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i14_4_lut (.I0(n1), .I1(n2), .I2(buffer_get_addr[6]), .I3(n10897), 
            .O(n6));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    defparam i14_4_lut.LUT_INIT = 16'h3335;
    SB_LUT4 i3_4_lut_adj_177 (.I0(in_ep_req_0__N_914), .I1(\ep_state[0] [0]), 
            .I2(\ep_state[0] [1]), .I3(\ep_put_addr[0] [5]), .O(ctrl_in_ep_data_put));
    defparam i3_4_lut_adj_177.LUT_INIT = 16'h0004;
    SB_DFFESR \ep_put_addr_0[[0__275_i5  (.Q(\ep_put_addr[0] [5]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[5]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_0[[0__275_i4  (.Q(\ep_put_addr[0] [4]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[4]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_0[[0__275_i3  (.Q(\ep_put_addr[0] [3]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[3]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_0[[0__275_i2  (.Q(\ep_put_addr[0] [2]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[2]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_0[[0__275_i1  (.Q(\ep_put_addr[0] [1]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[1]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_LUT4 i1_2_lut_adj_178 (.I0(\ep_state[1] [0]), .I1(\ep_put_addr[1] [5]), 
            .I2(GND_net), .I3(GND_net), .O(n4_c));
    defparam i1_2_lut_adj_178.LUT_INIT = 16'h2222;
    SB_LUT4 i15_4_lut (.I0(ctrl_in_ep_data_put), .I1(\ep_state[1] [1]), 
            .I2(\in_ep_num_1__N_1088[0] ), .I3(n4_c), .O(in_data_buffer_N_1140));
    defparam i15_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 in_ep_num_1__I_0_371_Mux_4_i1_3_lut (.I0(\ep_put_addr[0] [4]), 
            .I1(\ep_put_addr[1] [4]), .I2(\in_ep_num_1__N_1088[0] ), .I3(GND_net), 
            .O(buffer_put_addr[4]));   // ../../../common/usb_fs_in_pe.v(107[61:70])
    defparam in_ep_num_1__I_0_371_Mux_4_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 in_ep_num_1__I_0_371_Mux_3_i1_3_lut (.I0(\ep_put_addr[0] [3]), 
            .I1(\ep_put_addr[1] [3]), .I2(\in_ep_num_1__N_1088[0] ), .I3(GND_net), 
            .O(buffer_put_addr[3]));   // ../../../common/usb_fs_in_pe.v(107[61:70])
    defparam in_ep_num_1__I_0_371_Mux_3_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 in_ep_num_1__I_0_371_Mux_2_i1_3_lut (.I0(\ep_put_addr[0] [2]), 
            .I1(\ep_put_addr[1] [2]), .I2(\in_ep_num_1__N_1088[0] ), .I3(GND_net), 
            .O(buffer_put_addr[2]));   // ../../../common/usb_fs_in_pe.v(107[61:70])
    defparam in_ep_num_1__I_0_371_Mux_2_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 in_ep_num_1__I_0_371_Mux_1_i1_3_lut (.I0(\ep_put_addr[0] [1]), 
            .I1(\ep_put_addr[1] [1]), .I2(\in_ep_num_1__N_1088[0] ), .I3(GND_net), 
            .O(buffer_put_addr[1]));   // ../../../common/usb_fs_in_pe.v(107[61:70])
    defparam in_ep_num_1__I_0_371_Mux_1_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 in_ep_num_1__I_0_371_Mux_0_i1_3_lut (.I0(\ep_put_addr[0] [0]), 
            .I1(\ep_put_addr[1] [0]), .I2(\in_ep_num_1__N_1088[0] ), .I3(GND_net), 
            .O(buffer_put_addr[0]));   // ../../../common/usb_fs_in_pe.v(107[61:70])
    defparam in_ep_num_1__I_0_371_Mux_0_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 in_xfr_state_1__I_0_366_Mux_0_i2_4_lut (.I0(more_data_to_send), 
            .I1(in_xfr_state_next_1__N_1118[0]), .I2(in_xfr_state[0]), .I3(ack_received), 
            .O(n2_adj_2011));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam in_xfr_state_1__I_0_366_Mux_0_i2_4_lut.LUT_INIT = 16'h05c5;
    SB_LUT4 in_xfr_state_1__I_0_366_Mux_0_i3_4_lut (.I0(n12010), .I1(n2_adj_2011), 
            .I2(in_xfr_state[1]), .I3(in_xfr_state[0]), .O(in_xfr_state_next[0]));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam in_xfr_state_1__I_0_366_Mux_0_i3_4_lut.LUT_INIT = 16'hc0ca;
    SB_LUT4 mux_21_Mux_5_i1_3_lut (.I0(\ep_put_addr[0] [5]), .I1(\ep_put_addr[1] [5]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1_adj_2012));   // ../../../common/usb_fs_in_pe.v(138[50:62])
    defparam mux_21_Mux_5_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 mux_21_Mux_4_i1_3_lut (.I0(\ep_put_addr[0] [4]), .I1(\ep_put_addr[1] [4]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1_adj_2013));   // ../../../common/usb_fs_in_pe.v(138[50:62])
    defparam mux_21_Mux_4_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_DFFESR \ep_put_addr_0[[0__275_i0  (.Q(\ep_put_addr[0] [0]), .C(clk_48mhz), 
            .E(n4426), .D(ep_put_addr_0__5__N_1067[0]), .R(n4612));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_LUT4 mux_21_Mux_3_i1_3_lut (.I0(\ep_put_addr[0] [3]), .I1(\ep_put_addr[1] [3]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1_adj_2014));   // ../../../common/usb_fs_in_pe.v(138[50:62])
    defparam mux_21_Mux_3_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 more_data_to_send_I_0_365_i10_3_lut_4_lut (.I0(more_data_to_send_N_1106[5]), 
            .I1(n1_adj_2012), .I2(buffer_get_addr[6]), .I3(n11401), .O(n11471));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam more_data_to_send_I_0_365_i10_3_lut_4_lut.LUT_INIT = 16'hdd84;
    SB_LUT4 i3_3_lut_4_lut (.I0(\ep_state[0] [1]), .I1(n12012), .I2(\ctrl_xfr_state[2] ), 
            .I3(n11453), .O(n11260));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    defparam i3_3_lut_4_lut.LUT_INIT = 16'h0080;
    SB_LUT4 more_data_to_send_I_0_365_i8_3_lut_4_lut (.I0(more_data_to_send_N_1106[4]), 
            .I1(n1_adj_2013), .I2(buffer_get_addr[6]), .I3(n11459), .O(n11469));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam more_data_to_send_I_0_365_i8_3_lut_4_lut.LUT_INIT = 16'hdd84;
    SB_LUT4 more_data_to_send_I_0_365_i6_3_lut_4_lut (.I0(more_data_to_send_N_1106[3]), 
            .I1(n1_adj_2014), .I2(buffer_get_addr[6]), .I3(n1_adj_2015), 
            .O(n11459));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam more_data_to_send_I_0_365_i6_3_lut_4_lut.LUT_INIT = 16'hdd84;
    SB_LUT4 i2_3_lut_rep_157_4_lut (.I0(\ep_state[0] [1]), .I1(n12012), 
            .I2(all_data_sent), .I3(\ep_state[0] [0]), .O(n11998));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    defparam i2_3_lut_rep_157_4_lut.LUT_INIT = 16'h0080;
    SB_LUT4 i4330_3_lut_4_lut (.I0(n12008), .I1(n11210), .I2(\ep_state[0] [0]), 
            .I3(n12012), .O(n17));   // ../../../common/usb_fs_in_pe.v(202[19:60])
    defparam i4330_3_lut_4_lut.LUT_INIT = 16'h2f20;
    SB_LUT4 mux_21_Mux_1_i1_3_lut (.I0(\ep_put_addr[0] [1]), .I1(\ep_put_addr[1] [1]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1_adj_2016));   // ../../../common/usb_fs_in_pe.v(138[50:62])
    defparam mux_21_Mux_1_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 mux_21_Mux_2_i1_3_lut (.I0(\ep_put_addr[0] [2]), .I1(\ep_put_addr[1] [2]), 
            .I2(buffer_get_addr[5]), .I3(GND_net), .O(n1_adj_2015));   // ../../../common/usb_fs_in_pe.v(138[50:62])
    defparam mux_21_Mux_2_i1_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i1_4_lut (.I0(ep_get_addr_0_0), .I1(\ep_put_addr[0] [0]), .I2(\ep_put_addr[1] [0]), 
            .I3(buffer_get_addr[5]), .O(n4_adj_2017));
    defparam i1_4_lut.LUT_INIT = 16'h5044;
    SB_LUT4 more_data_to_send_I_0_365_i4_4_lut (.I0(n4_adj_2017), .I1(n1_adj_2016), 
            .I2(more_data_to_send_N_1106[1]), .I3(buffer_get_addr[6]), .O(n11401));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam more_data_to_send_I_0_365_i4_4_lut.LUT_INIT = 16'hca8e;
    SB_DFF in_xfr_state_i1 (.Q(in_xfr_state[1]), .C(clk_48mhz), .D(in_xfr_state_next[1]));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_LUT4 i10248_4_lut (.I0(n12045), .I1(n12044), .I2(n12043), .I3(n5_c), 
            .O(n11535));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam i10248_4_lut.LUT_INIT = 16'h5554;
    SB_LUT4 i10187_4_lut (.I0(buffer_get_addr[6]), .I1(n11469), .I2(n11471), 
            .I3(n11535), .O(more_data_to_send));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam i10187_4_lut.LUT_INIT = 16'h4450;
    SB_LUT4 i2_3_lut (.I0(more_data_to_send), .I1(in_xfr_state[1]), .I2(in_xfr_state[0]), 
            .I3(GND_net), .O(tx_data_avail));   // ../../../common/usb_fs_in_pe.v(138[5:68])
    defparam i2_3_lut.LUT_INIT = 16'h0808;
    SB_LUT4 i1_3_lut_4_lut (.I0(rx_endp[0]), .I1(n12008), .I2(rx_endp[1]), 
            .I3(data_toggle[2]), .O(n2_adj_2018));   // ../../../common/usb_fs_in_pe.v(356[9:29])
    defparam i1_3_lut_4_lut.LUT_INIT = 16'h00bf;
    SB_LUT4 ep_state_1__1__I_0_334_i3_4_lut (.I0(n1_adj_2019), .I1(ep_state_next_1__1__N_982), 
            .I2(\ep_state[1] [1]), .I3(\ep_state[1] [0]), .O(ep_state_next_1__0__N_987));   // ../../../common/usb_fs_in_pe.v(171[11] 213[18])
    defparam ep_state_1__1__I_0_334_i3_4_lut.LUT_INIT = 16'h3505;
    SB_LUT4 i6405_3_lut (.I0(serial_in_ep_data_done), .I1(\ep_state[1] [0]), 
            .I2(\ep_put_addr[1] [5]), .I3(GND_net), .O(n1_adj_2019));   // ../../../common/usb_fs_in_pe.v(171[11] 213[18])
    defparam i6405_3_lut.LUT_INIT = 16'hc8c8;
    SB_DFF data_toggle_i1 (.Q(data_toggle[1]), .C(clk_48mhz), .D(n6_adj_2020));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_LUT4 ep_state_1__1__I_0_317_i2_4_lut (.I0(buffer_get_addr[5]), .I1(ep_state_next_1__1__N_982), 
            .I2(\ep_state[1] [0]), .I3(n12016), .O(n2857));   // ../../../common/usb_fs_in_pe.v(171[11] 213[18])
    defparam ep_state_1__1__I_0_317_i2_4_lut.LUT_INIT = 16'hcac0;
    SB_DFF data_toggle_i2 (.Q(data_toggle[2]), .C(clk_48mhz), .D(n6_adj_2021));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    SB_LUT4 ep_state_1__1__I_0_317_i3_3_lut (.I0(n1_adj_2019), .I1(n2857), 
            .I2(\ep_state[1] [1]), .I3(GND_net), .O(ep_state_next_1__1__N_980));   // ../../../common/usb_fs_in_pe.v(171[11] 213[18])
    defparam ep_state_1__1__I_0_317_i3_3_lut.LUT_INIT = 16'h3a3a;
    SB_DFFESR \ep_put_addr_1[[0__283_i5  (.Q(\ep_put_addr[1] [5]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[5]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_1[[0__283_i4  (.Q(\ep_put_addr[1] [4]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[4]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_1[[0__283_i3  (.Q(\ep_put_addr[1] [3]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[3]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_1[[0__283_i2  (.Q(\ep_put_addr[1] [2]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[2]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_DFFESR \ep_put_addr_1[[0__283_i1  (.Q(\ep_put_addr[1] [1]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[1]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_LUT4 add_404_add_4_7_lut (.I0(GND_net), .I1(\ep_put_addr[1] [5]), 
            .I2(GND_net), .I3(n9686), .O(ep_put_addr_1__5__N_1043[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1_4_lut_adj_179 (.I0(n5), .I1(n5383), .I2(in_q), .I3(\ctrl_xfr_state[0] ), 
            .O(n10928));   // ../../../common/usb_fs_in_pe.v(178[17] 182[18])
    defparam i1_4_lut_adj_179.LUT_INIT = 16'hcc0a;
    SB_LUT4 i6684_4_lut (.I0(\ep_put_addr[0] [5]), .I1(\ep_state[0] [0]), 
            .I2(\ctrl_xfr_state[2] ), .I3(n10928), .O(n7791));
    defparam i6684_4_lut.LUT_INIT = 16'h8c88;
    SB_LUT4 i1_3_lut_4_lut_adj_180 (.I0(rx_endp[0]), .I1(n12008), .I2(rx_endp[1]), 
            .I3(data_toggle[0]), .O(n2));   // ../../../common/usb_fs_in_pe.v(356[9:29])
    defparam i1_3_lut_4_lut_adj_180.LUT_INIT = 16'h00fb;
    SB_LUT4 i18_4_lut (.I0(n7791), .I1(\ep_state[0] [0]), .I2(\ep_state[0] [1]), 
            .I3(n12002), .O(ep_state_next_0__0__N_997));   // ../../../common/usb_fs_in_pe.v(60[13:21])
    defparam i18_4_lut.LUT_INIT = 16'h05c5;
    SB_LUT4 add_404_add_4_6_lut (.I0(GND_net), .I1(\ep_put_addr[1] [4]), 
            .I2(GND_net), .I3(n9685), .O(ep_put_addr_1__5__N_1043[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_404_add_4_6 (.CI(n9685), .I0(\ep_put_addr[1] [4]), .I1(GND_net), 
            .CO(n9686));
    SB_LUT4 add_403_add_4_7_lut (.I0(GND_net), .I1(\ep_put_addr[0] [5]), 
            .I2(GND_net), .I3(n9701), .O(ep_put_addr_0__5__N_1067[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_404_add_4_5_lut (.I0(GND_net), .I1(\ep_put_addr[1] [3]), 
            .I2(GND_net), .I3(n9684), .O(ep_put_addr_1__5__N_1043[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_DFFESR \ep_put_addr_1[[0__283_i0  (.Q(\ep_put_addr[1] [0]), .C(clk_48mhz), 
            .E(n12110), .D(ep_put_addr_1__5__N_1043[0]), .R(n4619));   // ../../../common/usb_fs_in_pe.v(220[14] 245[10])
    SB_LUT4 add_403_add_4_6_lut (.I0(GND_net), .I1(\ep_put_addr[0] [4]), 
            .I2(GND_net), .I3(n9700), .O(ep_put_addr_0__5__N_1067[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1_2_lut_4_lut (.I0(\ep_state[0] [0]), .I1(n12004), .I2(all_data_sent), 
            .I3(n10873), .O(n10875));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i1_2_lut_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i396_4_lut_4_lut (.I0(rx_pkt_end), .I1(in_xfr_state[0]), .I2(in_xfr_state[1]), 
            .I3(n11202), .O(n771));
    defparam i396_4_lut_4_lut.LUT_INIT = 16'h8303;
    SB_CARRY add_403_add_4_6 (.CI(n9700), .I0(\ep_put_addr[0] [4]), .I1(GND_net), 
            .CO(n9701));
    SB_LUT4 i1_2_lut_rep_192 (.I0(rx_pkt_end), .I1(in_xfr_state[0]), .I2(GND_net), 
            .I3(GND_net), .O(n12033));
    defparam i1_2_lut_rep_192.LUT_INIT = 16'h8888;
    SB_LUT4 add_403_add_4_5_lut (.I0(GND_net), .I1(\ep_put_addr[0] [3]), 
            .I2(GND_net), .I3(n9699), .O(ep_put_addr_0__5__N_1067[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i10292_3_lut_4_lut (.I0(\ctrl_xfr_state[2] ), .I1(\ctrl_xfr_state[1] ), 
            .I2(\ctrl_xfr_state_next_5__N_168[2] ), .I3(n1854), .O(n20));
    defparam i10292_3_lut_4_lut.LUT_INIT = 16'h1f0e;
    SB_LUT4 i9684_2_lut_rep_271 (.I0(\ctrl_xfr_state[2] ), .I1(\ctrl_xfr_state[1] ), 
            .I2(GND_net), .I3(GND_net), .O(n12112));
    defparam i9684_2_lut_rep_271.LUT_INIT = 16'heeee;
    SB_LUT4 i3498_2_lut_2_lut (.I0(\ep_state[1] [1]), .I1(\ep_state[1] [0]), 
            .I2(GND_net), .I3(GND_net), .O(n4619));
    defparam i3498_2_lut_2_lut.LUT_INIT = 16'h1111;
    SB_LUT4 i1_3_lut_rep_269 (.I0(\in_ep_num_1__N_1088[0] ), .I1(\ep_state[1] [1]), 
            .I2(\ep_state[1] [0]), .I3(GND_net), .O(n12110));
    defparam i1_3_lut_rep_269.LUT_INIT = 16'h2323;
    SB_LUT4 i2_3_lut_adj_181 (.I0(out_ep_data_valid), .I1(ctrl_out_ep_setup), 
            .I2(n12020), .I3(GND_net), .O(\ctrl_xfr_state_next_5__N_150[0] ));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i2_3_lut_adj_181.LUT_INIT = 16'h4040;
    SB_LUT4 i2_4_lut (.I0(n1289), .I1(\bytes_sent[7] ), .I2(n3826), .I3(n14), 
            .O(all_data_sent));   // ../../../common/usb_serial_ctrl_ep.v(118[13:23])
    defparam i2_4_lut.LUT_INIT = 16'hffce;
    SB_LUT4 i6434_2_lut_rep_232_3_lut_2_lut (.I0(rx_pid[2]), .I1(rx_pid[3]), 
            .I2(GND_net), .I3(GND_net), .O(n12073));   // ../../../common/usb_fs_in_pe.v(135[5:22])
    defparam i6434_2_lut_rep_232_3_lut_2_lut.LUT_INIT = 16'h6666;
    SB_CARRY add_403_add_4_5 (.CI(n9699), .I0(\ep_put_addr[0] [3]), .I1(GND_net), 
            .CO(n9700));
    SB_LUT4 i38_4_lut (.I0(\ctrl_xfr_state_next_5__N_150[0] ), .I1(ctrl_in_ep_stall), 
            .I2(\ctrl_xfr_state[1] ), .I3(n11998), .O(n17_adj_2023));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i38_4_lut.LUT_INIT = 16'h3a0a;
    SB_CARRY add_404_add_4_5 (.CI(n9684), .I0(\ep_put_addr[1] [3]), .I1(GND_net), 
            .CO(n9685));
    SB_LUT4 i37_4_lut (.I0(\ctrl_xfr_state[2] ), .I1(n20), .I2(\ctrl_xfr_state[0] ), 
            .I3(n17_adj_2023), .O(n10174));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i37_4_lut.LUT_INIT = 16'hc5c0;
    SB_LUT4 add_403_add_4_4_lut (.I0(GND_net), .I1(\ep_put_addr[0] [2]), 
            .I2(GND_net), .I3(n9698), .O(ep_put_addr_0__5__N_1067[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_403_add_4_4 (.CI(n9698), .I0(\ep_put_addr[0] [2]), .I1(GND_net), 
            .CO(n9699));
    SB_LUT4 i10168_2_lut_3_lut_4_lut_3_lut (.I0(rx_pid[2]), .I1(rx_pid[3]), 
            .I2(rx_endp[0]), .I3(GND_net), .O(n11451));   // ../../../common/usb_fs_in_pe.v(135[5:22])
    defparam i10168_2_lut_3_lut_4_lut_3_lut.LUT_INIT = 16'hf6f6;
    SB_LUT4 rx_pid_3__I_0_i6_2_lut_rep_267 (.I0(rx_pid[2]), .I1(rx_pid[3]), 
            .I2(GND_net), .I3(GND_net), .O(n12108));   // ../../../common/usb_fs_in_pe.v(135[5:22])
    defparam rx_pid_3__I_0_i6_2_lut_rep_267.LUT_INIT = 16'heeee;
    SB_LUT4 i2_3_lut_adj_182 (.I0(\ep_state[1] [0]), .I1(\ep_state[1] [1]), 
            .I2(\ep_put_addr[1] [5]), .I3(GND_net), .O(n11064));
    defparam i2_3_lut_adj_182.LUT_INIT = 16'hfdfd;
    SB_LUT4 add_404_add_4_4_lut (.I0(GND_net), .I1(\ep_put_addr[1] [2]), 
            .I2(GND_net), .I3(n9683), .O(ep_put_addr_1__5__N_1043[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_403_add_4_3_lut (.I0(GND_net), .I1(\ep_put_addr[0] [1]), 
            .I2(GND_net), .I3(n9697), .O(ep_put_addr_0__5__N_1067[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_403_add_4_3 (.CI(n9697), .I0(\ep_put_addr[0] [1]), .I1(GND_net), 
            .CO(n9698));
    SB_LUT4 i2_4_lut_adj_183 (.I0(rx_endp[0]), .I1(token_received_N_1149), 
            .I2(rx_endp[1]), .I3(n12103), .O(n10867));
    defparam i2_4_lut_adj_183.LUT_INIT = 16'h004c;
    SB_LUT4 add_403_add_4_2_lut (.I0(GND_net), .I1(\ep_put_addr[0] [0]), 
            .I2(GND_net), .I3(VCC_net), .O(ep_put_addr_0__5__N_1067[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_403_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 rx_addr_6__I_0_i4_2_lut (.I0(rx_addr[3]), .I1(dev_addr[3]), 
            .I2(GND_net), .I3(GND_net), .O(n4_adj_2024));   // ../../../common/usb_fs_in_pe.v(121[5:24])
    defparam rx_addr_6__I_0_i4_2_lut.LUT_INIT = 16'h6666;
    SB_CARRY add_404_add_4_4 (.CI(n9683), .I0(\ep_put_addr[1] [2]), .I1(GND_net), 
            .CO(n9684));
    SB_LUT4 add_404_add_4_3_lut (.I0(GND_net), .I1(\ep_put_addr[1] [1]), 
            .I2(GND_net), .I3(n9682), .O(ep_put_addr_1__5__N_1043[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i10455_2_lut_3_lut (.I0(in_xfr_state[0]), .I1(in_xfr_state[1]), 
            .I2(in_tx_pid[1]), .I3(GND_net), .O(in_tx_pid[1]));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i10455_2_lut_3_lut.LUT_INIT = 16'hf2f2;
    SB_CARRY add_403_add_4_2 (.CI(VCC_net), .I0(\ep_put_addr[0] [0]), .I1(GND_net), 
            .CO(n9697));
    SB_LUT4 i1_2_lut_rep_233_3_lut_4_lut (.I0(in_xfr_state[0]), .I1(in_xfr_state[1]), 
            .I2(out_xfr_state[1]), .I3(out_xfr_state[0]), .O(n12074));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i1_2_lut_rep_233_3_lut_4_lut.LUT_INIT = 16'hf222;
    SB_LUT4 i10144_4_lut (.I0(rx_addr[4]), .I1(rx_addr[1]), .I2(dev_addr[4]), 
            .I3(dev_addr[1]), .O(n11427));
    defparam i10144_4_lut.LUT_INIT = 16'h7bde;
    SB_LUT4 i10148_4_lut (.I0(rx_addr[0]), .I1(rx_addr[5]), .I2(dev_addr[0]), 
            .I3(dev_addr[5]), .O(n11431));
    defparam i10148_4_lut.LUT_INIT = 16'h7bde;
    SB_LUT4 add_406_add_4_7_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[5]), 
            .I2(GND_net), .I3(n9696), .O(n37[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i10179_4_lut (.I0(rx_addr[6]), .I1(n11427), .I2(n4_adj_2024), 
            .I3(dev_addr[6]), .O(n11463));
    defparam i10179_4_lut.LUT_INIT = 16'hfdfe;
    SB_LUT4 i6388_2_lut_rep_265 (.I0(in_xfr_state[0]), .I1(in_xfr_state[1]), 
            .I2(GND_net), .I3(GND_net), .O(n12106));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i6388_2_lut_rep_265.LUT_INIT = 16'h2222;
    SB_LUT4 rx_addr_6__I_0_i3_2_lut (.I0(rx_addr[2]), .I1(dev_addr[2]), 
            .I2(GND_net), .I3(GND_net), .O(n3));   // ../../../common/usb_fs_in_pe.v(121[5:24])
    defparam rx_addr_6__I_0_i3_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i7_4_lut (.I0(n3), .I1(n11463), .I2(n11431), .I3(n12024), 
            .O(token_received_N_1149));
    defparam i7_4_lut.LUT_INIT = 16'h0100;
    SB_CARRY add_404_add_4_3 (.CI(n9682), .I0(\ep_put_addr[1] [1]), .I1(GND_net), 
            .CO(n9683));
    SB_LUT4 add_406_add_4_6_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[4]), 
            .I2(GND_net), .I3(n9695), .O(n37[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_404_add_4_2_lut (.I0(GND_net), .I1(\ep_put_addr[1] [0]), 
            .I2(GND_net), .I3(VCC_net), .O(ep_put_addr_1__5__N_1043[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_404_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_404_add_4_2 (.CI(VCC_net), .I0(\ep_put_addr[1] [0]), .I1(GND_net), 
            .CO(n9682));
    SB_CARRY add_406_add_4_6 (.CI(n9695), .I0(more_data_to_send_N_1106[4]), 
            .I1(GND_net), .CO(n9696));
    SB_LUT4 setup_token_received_I_0_2_lut_rep_161_3_lut_4_lut (.I0(rx_pid[2]), 
            .I1(rx_pid[3]), .I2(n11210), .I3(n10867), .O(n12002));
    defparam setup_token_received_I_0_2_lut_rep_161_3_lut_4_lut.LUT_INIT = 16'h0800;
    SB_LUT4 i2_3_lut_4_lut (.I0(rx_pid[2]), .I1(rx_pid[3]), .I2(n12015), 
            .I3(rx_endp[0]), .O(ep_state_next_1__1__N_982));
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h8000;
    SB_LUT4 i1_2_lut_rep_167_3_lut (.I0(rx_pid[2]), .I1(rx_pid[3]), .I2(n10867), 
            .I3(GND_net), .O(n12008));
    defparam i1_2_lut_rep_167_3_lut.LUT_INIT = 16'h8080;
    SB_LUT4 setup_token_received_I_0_2_lut_rep_160_3_lut_4_lut (.I0(rx_pid[2]), 
            .I1(rx_pid[3]), .I2(n11210), .I3(n12015), .O(n12001));
    defparam setup_token_received_I_0_2_lut_rep_160_3_lut_4_lut.LUT_INIT = 16'h0800;
    SB_LUT4 i49_3_lut (.I0(\ctrl_xfr_state[1] ), .I1(\ctrl_xfr_state[2] ), 
            .I2(\ctrl_xfr_state_next_5__N_168[2] ), .I3(GND_net), .O(n45));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i49_3_lut.LUT_INIT = 16'h2c2c;
    SB_LUT4 i1_4_lut_adj_184 (.I0(n12007), .I1(\ctrl_xfr_state[1] ), .I2(\ctrl_xfr_state[2] ), 
            .I3(\ctrl_xfr_state_next_5__N_168[2] ), .O(n26));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i1_4_lut_adj_184.LUT_INIT = 16'h0a22;
    SB_LUT4 i52_4_lut (.I0(n10875), .I1(n12004), .I2(\ctrl_xfr_state[2] ), 
            .I3(n11453), .O(n22_adj_2025));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i52_4_lut.LUT_INIT = 16'hfa3a;
    SB_LUT4 i48_4_lut (.I0(n22_adj_2025), .I1(n26), .I2(\ctrl_xfr_state[0] ), 
            .I3(n45), .O(n10212));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i48_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 i6521_2_lut_rep_263 (.I0(rx_pid[2]), .I1(rx_pid[3]), .I2(GND_net), 
            .I3(GND_net), .O(n12104));
    defparam i6521_2_lut_rep_263.LUT_INIT = 16'h8888;
    SB_LUT4 i1_2_lut_adj_185 (.I0(\ctrl_xfr_state[1] ), .I1(ctrl_in_ep_stall), 
            .I2(GND_net), .I3(GND_net), .O(n10873));
    defparam i1_2_lut_adj_185.LUT_INIT = 16'h2222;
    SB_LUT4 i4278_4_lut (.I0(has_data_stage), .I1(\ctrl_xfr_state_next_5__N_168[2] ), 
            .I2(\ctrl_xfr_state[1] ), .I3(n12017), .O(n5401));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i4278_4_lut.LUT_INIT = 16'h3a30;
    SB_LUT4 i4279_4_lut (.I0(n11998), .I1(n5401), .I2(\ctrl_xfr_state[0] ), 
            .I3(n10873), .O(n1857));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i4279_4_lut.LUT_INIT = 16'hc5c0;
    SB_LUT4 i1_2_lut_adj_186 (.I0(status_stage_end), .I1(save_dev_addr), 
            .I2(GND_net), .I3(GND_net), .O(n275));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i1_2_lut_adj_186.LUT_INIT = 16'h8888;
    SB_LUT4 add_406_add_4_5_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[3]), 
            .I2(GND_net), .I3(n9694), .O(n37[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2_3_lut_4_lut_adj_187 (.I0(n4), .I1(n12107), .I2(rx_pid[2]), 
            .I3(rx_pid[3]), .O(sof_valid));
    defparam i2_3_lut_4_lut_adj_187.LUT_INIT = 16'h0080;
    SB_CARRY add_406_add_4_5 (.CI(n9694), .I0(more_data_to_send_N_1106[3]), 
            .I1(GND_net), .CO(n9695));
    SB_LUT4 i4_4_lut (.I0(ack_received), .I1(buffer_get_addr[6]), .I2(in_xfr_state[1]), 
            .I3(in_xfr_state[0]), .O(n10));
    defparam i4_4_lut.LUT_INIT = 16'h2000;
    SB_LUT4 add_406_add_4_4_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[2]), 
            .I2(GND_net), .I3(n9693), .O(n37[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_406_add_4_4 (.CI(n9693), .I0(more_data_to_send_N_1106[2]), 
            .I1(GND_net), .CO(n9694));
    SB_LUT4 more_data_to_send_I_0_365_i5_3_lut_4_lut_4_lut (.I0(buffer_get_addr[5]), 
            .I1(buffer_get_addr[6]), .I2(n1_adj_2015), .I3(ep_get_addr_0_2), 
            .O(n5_c));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam more_data_to_send_I_0_365_i5_3_lut_4_lut_4_lut.LUT_INIT = 16'h4730;
    SB_LUT4 i6608_2_lut_rep_230_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_2), .I3(GND_net), .O(more_data_to_send_N_1106[2]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6608_2_lut_rep_230_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 i6603_2_lut_rep_229_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_1), .I3(GND_net), .O(more_data_to_send_N_1106[1]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6603_2_lut_rep_229_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 i6611_2_lut_rep_225_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_0), .I3(GND_net), .O(more_data_to_send_N_1106[0]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6611_2_lut_rep_225_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 i6610_2_lut_org_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_4), .I3(GND_net), .O(more_data_to_send_N_1106[4]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6610_2_lut_org_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 i10170_2_lut (.I0(\ep_state[0] [0]), .I1(ctrl_in_ep_stall), 
            .I2(GND_net), .I3(GND_net), .O(n11453));
    defparam i10170_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 more_data_to_send_I_0_365_i9_3_lut_rep_203_4_lut_4_lut (.I0(buffer_get_addr[5]), 
            .I1(buffer_get_addr[6]), .I2(n1_adj_2013), .I3(ep_get_addr_0_4), 
            .O(n12044));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam more_data_to_send_I_0_365_i9_3_lut_rep_203_4_lut_4_lut.LUT_INIT = 16'h4730;
    SB_LUT4 i14_4_lut_adj_188 (.I0(n2_adj_2027), .I1(n2_adj_2018), .I2(buffer_get_addr[6]), 
            .I3(n10897), .O(n6_adj_2021));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    defparam i14_4_lut_adj_188.LUT_INIT = 16'h3353;
    SB_LUT4 i1_2_lut_adj_189 (.I0(\ctrl_xfr_state[1] ), .I1(\ctrl_xfr_state_next_5__N_168[2] ), 
            .I2(GND_net), .I3(GND_net), .O(n4_adj_2028));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i1_2_lut_adj_189.LUT_INIT = 16'h4444;
    SB_LUT4 add_406_add_4_3_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[1]), 
            .I2(GND_net), .I3(n9692), .O(n37[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i2_3_lut_adj_190 (.I0(n10842), .I1(buffer_get_addr[5]), .I2(buffer_get_addr[6]), 
            .I3(GND_net), .O(n11340));
    defparam i2_3_lut_adj_190.LUT_INIT = 16'hf7f7;
    SB_CARRY add_406_add_4_3 (.CI(n9692), .I0(more_data_to_send_N_1106[1]), 
            .I1(GND_net), .CO(n9693));
    SB_LUT4 i14_4_lut_adj_191 (.I0(n1), .I1(data_toggle[1]), .I2(n11340), 
            .I3(n10901), .O(n6_adj_2020));   // ../../../common/usb_fs_in_pe.v(346[10] 394[6])
    defparam i14_4_lut_adj_191.LUT_INIT = 16'hc5f5;
    SB_LUT4 i27_4_lut (.I0(n11260), .I1(\ctrl_xfr_state[2] ), .I2(\ctrl_xfr_state[1] ), 
            .I3(ctrl_in_ep_stall), .O(n13));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i27_4_lut.LUT_INIT = 16'h3a0a;
    SB_LUT4 i26_4_lut (.I0(n13), .I1(\ctrl_xfr_state[2] ), .I2(\ctrl_xfr_state[0] ), 
            .I3(n4_adj_2028), .O(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i26_4_lut.LUT_INIT = 16'hca0a;
    SB_LUT4 i6609_2_lut_rep_228_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_3), .I3(GND_net), .O(more_data_to_send_N_1106[3]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6609_2_lut_rep_228_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 more_data_to_send_I_0_365_i7_3_lut_rep_202_4_lut_4_lut (.I0(buffer_get_addr[5]), 
            .I1(buffer_get_addr[6]), .I2(n1_adj_2014), .I3(ep_get_addr_0_3), 
            .O(n12043));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam more_data_to_send_I_0_365_i7_3_lut_rep_202_4_lut_4_lut.LUT_INIT = 16'h4730;
    SB_LUT4 add_406_add_4_2_lut (.I0(GND_net), .I1(more_data_to_send_N_1106[0]), 
            .I2(GND_net), .I3(VCC_net), .O(n37[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_406_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i6599_2_lut_org_3_lut (.I0(buffer_get_addr[5]), .I1(buffer_get_addr[6]), 
            .I2(ep_get_addr_0_5), .I3(GND_net), .O(more_data_to_send_N_1106[5]));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam i6599_2_lut_org_3_lut.LUT_INIT = 16'h7070;
    SB_LUT4 more_data_to_send_I_0_365_i11_3_lut_rep_204_4_lut_4_lut (.I0(buffer_get_addr[5]), 
            .I1(buffer_get_addr[6]), .I2(n1_adj_2012), .I3(ep_get_addr_0_5), 
            .O(n12045));   // ../../../common/usb_fs_in_pe.v(138[5:35])
    defparam more_data_to_send_I_0_365_i11_3_lut_rep_204_4_lut_4_lut.LUT_INIT = 16'h4730;
    SB_CARRY add_406_add_4_2 (.CI(VCC_net), .I0(more_data_to_send_N_1106[0]), 
            .I1(GND_net), .CO(n9692));
    SB_LUT4 i1_2_lut_rep_219_3_lut (.I0(rx_pid[2]), .I1(rx_pid[1]), .I2(rx_pid[0]), 
            .I3(GND_net), .O(n12060));   // ../../../common/usb_fs_in_pe.v(33[15:21])
    defparam i1_2_lut_rep_219_3_lut.LUT_INIT = 16'hbfbf;
    SB_LUT4 i2_3_lut_adj_192 (.I0(n12010), .I1(ack_received), .I2(rx_pkt_end), 
            .I3(GND_net), .O(n11175));
    defparam i2_3_lut_adj_192.LUT_INIT = 16'hfefe;
    SB_LUT4 i23_4_lut (.I0(in_xfr_state[0]), .I1(n11175), .I2(in_xfr_state[1]), 
            .I3(n12078), .O(in_xfr_state_next[1]));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i23_4_lut.LUT_INIT = 16'h7a70;
    SB_LUT4 i1_2_lut_rep_249 (.I0(rx_pid[2]), .I1(rx_pid[1]), .I2(GND_net), 
            .I3(GND_net), .O(n12090));   // ../../../common/usb_fs_in_pe.v(33[15:21])
    defparam i1_2_lut_rep_249.LUT_INIT = 16'hbbbb;
    SB_LUT4 i1_2_lut_rep_171_4_lut (.I0(buffer_get_addr[7]), .I1(n10), .I2(buffer_get_addr[8]), 
            .I3(buffer_get_addr[5]), .O(n12012));
    defparam i1_2_lut_rep_171_4_lut.LUT_INIT = 16'h0004;
    SB_LUT4 i6549_2_lut (.I0(data_toggle[2]), .I1(buffer_get_addr[5]), .I2(GND_net), 
            .I3(GND_net), .O(n2_adj_2027));   // ../../../common/usb_fs_in_pe.v(305[34:46])
    defparam i6549_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i1_4_lut_adj_193 (.I0(n1), .I1(in_xfr_state_next_1__N_1102[0]), 
            .I2(n2_adj_2027), .I3(buffer_get_addr[6]), .O(n4_adj_2029));   // ../../../common/usb_fs_in_pe.v(303[22:59])
    defparam i1_4_lut_adj_193.LUT_INIT = 16'hfcee;
    SB_LUT4 i10459_4_lut (.I0(in_tx_pid[3]), .I1(in_xfr_state_next_1__N_1102[1]), 
            .I2(n12106), .I3(n4_adj_2029), .O(in_tx_pid[3]));   // ../../../common/usb_fs_in_pe.v(277[3] 343[6])
    defparam i10459_4_lut.LUT_INIT = 16'hfa3a;
    SB_LUT4 i10457_4_lut (.I0(in_tx_pid[2]), .I1(in_xfr_state_next_1__N_1102[1]), 
            .I2(n12106), .I3(in_xfr_state_next_1__N_1102[0]), .O(in_tx_pid[2]));   // ../../../common/usb_fs_in_pe.v(277[3] 343[6])
    defparam i10457_4_lut.LUT_INIT = 16'hca0a;
    SB_LUT4 i5_3_lut_rep_175 (.I0(buffer_get_addr[7]), .I1(n10), .I2(buffer_get_addr[8]), 
            .I3(GND_net), .O(n12016));
    defparam i5_3_lut_rep_175.LUT_INIT = 16'h0404;
    SB_LUT4 i1935_2_lut_rep_170_4_lut (.I0(n12103), .I1(rx_endp[1]), .I2(token_received_N_1149), 
            .I3(n12073), .O(n12011));   // ../../../common/usb_fs_in_pe.v(202[19:60])
    defparam i1935_2_lut_rep_170_4_lut.LUT_INIT = 16'h0010;
    SB_LUT4 mux_185_Mux_0_i3_4_lut (.I0(\ep_state[0] [0]), .I1(buffer_get_addr[6]), 
            .I2(\ep_state[1] [0]), .I3(buffer_get_addr[5]), .O(in_xfr_state_next_1__N_1102[0]));   // ../../../common/usb_fs_in_pe.v(303[31:43])
    defparam mux_185_Mux_0_i3_4_lut.LUT_INIT = 16'h30ee;
    SB_LUT4 i6548_4_lut (.I0(\ep_state[0] [1]), .I1(buffer_get_addr[6]), 
            .I2(\ep_state[1] [1]), .I3(buffer_get_addr[5]), .O(in_xfr_state_next_1__N_1102[1]));   // ../../../common/usb_fs_in_pe.v(303[31:43])
    defparam i6548_4_lut.LUT_INIT = 16'h3022;
    SB_LUT4 token_received_I_0_2_lut_rep_164_4_lut (.I0(n12103), .I1(rx_endp[1]), 
            .I2(token_received_N_1149), .I3(n12104), .O(n12005));   // ../../../common/usb_fs_in_pe.v(202[19:60])
    defparam token_received_I_0_2_lut_rep_164_4_lut.LUT_INIT = 16'h1000;
    SB_LUT4 i10423_3_lut_4_lut (.I0(in_xfr_state_next_1__N_1102[1]), .I1(in_xfr_state_next_1__N_1102[0]), 
            .I2(n12106), .I3(in_tx_pid[0]), .O(in_tx_pid[0]));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i10423_3_lut_4_lut.LUT_INIT = 16'h2f20;
    SB_LUT4 i1_2_lut_rep_237 (.I0(in_xfr_state_next_1__N_1102[1]), .I1(in_xfr_state_next_1__N_1102[0]), 
            .I2(GND_net), .I3(GND_net), .O(n12078));   // ../../../common/usb_fs_in_pe.v(283[5] 342[12])
    defparam i1_2_lut_rep_237.LUT_INIT = 16'h2222;
    SB_LUT4 i1_2_lut_rep_163_3_lut (.I0(buffer_get_addr[5]), .I1(n12016), 
            .I2(\ep_state[0] [1]), .I3(GND_net), .O(n12004));
    defparam i1_2_lut_rep_163_3_lut.LUT_INIT = 16'h4040;
    SB_LUT4 i10394_2_lut (.I0(\ep_state[0] [1]), .I1(\ep_state[0] [0]), 
            .I2(GND_net), .I3(GND_net), .O(n4612));
    defparam i10394_2_lut.LUT_INIT = 16'h1111;
    SB_LUT4 i10391_4_lut (.I0(\ep_state[0] [1]), .I1(in_ep_req_0__N_914), 
            .I2(\ep_state[0] [0]), .I3(\ep_put_addr[0] [5]), .O(n4426));
    defparam i10391_4_lut.LUT_INIT = 16'h0515;
    SB_LUT4 i6413_2_lut_4_lut (.I0(rx_pid[3]), .I1(rx_pid[2]), .I2(n10867), 
            .I3(rx_pkt_end), .O(in_xfr_state_next_1__N_1118[0]));
    defparam i6413_2_lut_4_lut.LUT_INIT = 16'h20ff;
    SB_LUT4 i2_3_lut_rep_169 (.I0(rx_pid[3]), .I1(rx_pid[2]), .I2(n10867), 
            .I3(GND_net), .O(n12010));
    defparam i2_3_lut_rep_169.LUT_INIT = 16'h2020;
    
endmodule
//
// Verilog Description of module \usb_fs_in_arb(NUM_IN_EPS=5'b011) 
//

module \usb_fs_in_arb(NUM_IN_EPS=5'b011)  (serial_in_ep_req, in_ep_req_0__N_914, 
            serial_in_ep_data, ctrl_in_ep_data, arb_in_ep_data, n11064, 
            spi_byte_in_xfr_ready, GND_net) /* synthesis syn_module_defined=1 */ ;
    input serial_in_ep_req;
    input in_ep_req_0__N_914;
    input [7:0]serial_in_ep_data;
    input [7:0]ctrl_in_ep_data;
    output [7:0]arb_in_ep_data;
    input n11064;
    output spi_byte_in_xfr_ready;
    input GND_net;
    
    
    SB_LUT4 i10451_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[7]), .I3(ctrl_in_ep_data[7]), .O(arb_in_ep_data[7]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10451_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10447_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[6]), .I3(ctrl_in_ep_data[6]), .O(arb_in_ep_data[6]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10447_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10443_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[5]), .I3(ctrl_in_ep_data[5]), .O(arb_in_ep_data[5]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10443_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10431_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[2]), .I3(ctrl_in_ep_data[2]), .O(arb_in_ep_data[2]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10431_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i1_2_lut_3_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(n11064), .I3(GND_net), .O(spi_byte_in_xfr_ready));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h0808;
    SB_LUT4 i10439_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[4]), .I3(ctrl_in_ep_data[4]), .O(arb_in_ep_data[4]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10439_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10427_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[1]), .I3(ctrl_in_ep_data[1]), .O(arb_in_ep_data[1]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10427_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10435_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[3]), .I3(ctrl_in_ep_data[3]), .O(arb_in_ep_data[3]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10435_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    SB_LUT4 i10418_4_lut_4_lut_4_lut (.I0(serial_in_ep_req), .I1(in_ep_req_0__N_914), 
            .I2(serial_in_ep_data[0]), .I3(ctrl_in_ep_data[0]), .O(arb_in_ep_data[0]));   // ../../../common/usb_fs_in_arb.v(26[11:33])
    defparam i10418_4_lut_4_lut_4_lut.LUT_INIT = 16'hb380;
    
endmodule
//
// Verilog Description of module usb_serial_ctrl_ep
//

module usb_serial_ctrl_ep (status_stage_end, GND_net, clk_48mhz, n275, 
            dev_addr, save_dev_addr, n12020, out_ep_data_valid, bytes_sent, 
            ctrl_in_ep_stall, has_data_stage, n12017, \ctrl_xfr_state[1] , 
            \ctrl_xfr_state_next_5__N_168[2] , n5383, VCC_net, ctrl_in_ep_data, 
            \raw_setup_data[6][3] , \raw_setup_data[6][2] , n3826, \raw_setup_data[6][7] , 
            \raw_setup_data[6][6] , \raw_setup_data[6][0] , \raw_setup_data[6][4] , 
            \raw_setup_data[6][5] , \raw_setup_data[6][1] , all_data_sent, 
            n5, out_ep_data, n1857, \ctrl_xfr_state[2] , n10212, ctrl_out_ep_setup, 
            n10174, \ctrl_xfr_state[0] , n14, in_ep_req_0__N_914, ctrl_in_ep_data_put, 
            n12112, \ctrl_xfr_state_next_5__N_150[0] , n1854, n12007, 
            in_q) /* synthesis syn_module_defined=1 */ ;
    input status_stage_end;
    input GND_net;
    input clk_48mhz;
    input n275;
    output [6:0]dev_addr;
    output save_dev_addr;
    input n12020;
    output out_ep_data_valid;
    output [7:0]bytes_sent;
    output ctrl_in_ep_stall;
    output has_data_stage;
    input n12017;
    output \ctrl_xfr_state[1] ;
    input \ctrl_xfr_state_next_5__N_168[2] ;
    output n5383;
    input VCC_net;
    output [7:0]ctrl_in_ep_data;
    output \raw_setup_data[6][3] ;
    output \raw_setup_data[6][2] ;
    output n3826;
    output \raw_setup_data[6][7] ;
    output \raw_setup_data[6][6] ;
    output \raw_setup_data[6][0] ;
    output \raw_setup_data[6][4] ;
    output \raw_setup_data[6][5] ;
    output \raw_setup_data[6][1] ;
    input all_data_sent;
    output n5;
    input [7:0]out_ep_data;
    input n1857;
    output \ctrl_xfr_state[2] ;
    input n10212;
    input ctrl_out_ep_setup;
    input n10174;
    output \ctrl_xfr_state[0] ;
    output n14;
    output in_ep_req_0__N_914;
    input ctrl_in_ep_data_put;
    input n12112;
    input \ctrl_xfr_state_next_5__N_150[0] ;
    output n1854;
    output n12007;
    output in_q;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    wire [6:0]rom_addr_6__N_407;
    wire [6:0]rom_addr_6__N_278;
    wire [9:0]\raw_setup_data[2] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    
    wire n2318;
    wire [6:0]new_dev_addr;   // ../../../common/usb_serial_ctrl_ep.v(123[13:25])
    wire [6:0]rom_addr;   // ../../../common/usb_serial_ctrl_ep.v(119[13:21])
    
    wire n10180, n9675, n9676, in_ep_stall_N_436, n3824;
    wire [7:0]n47;
    wire [9:0]\raw_setup_data[3] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    
    wire n10974, n20, n7270, n3834, n12052, n45, n12051, n4156;
    wire [3:0]n857;
    
    wire n11995;
    wire [3:0]setup_data_addr;   // ../../../common/usb_serial_ctrl_ep.v(59[13:28])
    wire [3:0]n1;
    
    wire n12034, n3908, n7325;
    wire [6:0]rom_length;   // ../../../common/usb_serial_ctrl_ep.v(120[13:23])
    
    wire n12046, n14_c, n15, n3905, n3906, n3931, n6;
    wire [9:0]\raw_setup_data[1] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    
    wire n11391, n41_adj_2000, n8630;
    wire [79:0]n162;
    wire [9:0]\raw_setup_data[0] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    
    wire n4323, n4324, n4325, n4326, n4327;
    wire [9:0]\raw_setup_data[7] ;   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    
    wire n4606, n3933, n12114, n3843, n12076, n3929, n12116, n12037, 
        n14_adj_2001, n16, n12003;
    wire [6:0]n1351;
    
    wire n2304, n10, n16_adj_2002, n14_adj_2003, n12111, n2310, 
        n16_adj_2004, n4, n6_adj_2005, n10_adj_2006, n16_adj_2007, 
        n5978;
    wire [5:0]ctrl_xfr_state_next_5__N_299;
    
    wire n4031, n9681, n9680, n9679, n4029, n4_adj_2009, n9678, 
        n9745, n9744, n9743, n9742, n9741, n9740, n19, n3923, 
        n9677, n12, n35_adj_2010;
    
    SB_LUT4 i6459_2_lut (.I0(rom_addr_6__N_407[6]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[6]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6459_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i6461_2_lut (.I0(rom_addr_6__N_407[5]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[5]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6461_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i6462_2_lut (.I0(rom_addr_6__N_407[4]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[4]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6462_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i6463_2_lut (.I0(rom_addr_6__N_407[3]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[3]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6463_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i6464_2_lut (.I0(rom_addr_6__N_407[2]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[2]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6464_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i6467_2_lut (.I0(rom_addr_6__N_407[1]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[1]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6467_2_lut.LUT_INIT = 16'h2222;
    SB_DFFE new_dev_addr_i0_i0 (.Q(new_dev_addr[0]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i0 (.Q(rom_addr[0]), .C(clk_48mhz), .D(rom_addr_6__N_278[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i0 (.Q(dev_addr[0]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF save_dev_addr_131 (.Q(save_dev_addr), .C(clk_48mhz), .D(n10180));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF out_ep_data_valid_124 (.Q(out_ep_data_valid), .C(clk_48mhz), 
           .D(n12020));   // ../../../common/usb_serial_ctrl_ep.v(56[10:80])
    SB_CARRY add_156_add_4_3 (.CI(n9675), .I0(bytes_sent[1]), .I1(GND_net), 
            .CO(n9676));
    SB_DFFSR in_ep_stall_126 (.Q(ctrl_in_ep_stall), .C(clk_48mhz), .D(in_ep_stall_N_436), 
            .R(n3824));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 i4260_3_lut_4_lut (.I0(has_data_stage), .I1(n12017), .I2(\ctrl_xfr_state[1] ), 
            .I3(\ctrl_xfr_state_next_5__N_168[2] ), .O(n5383));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i4260_3_lut_4_lut.LUT_INIT = 16'hf404;
    SB_LUT4 add_156_add_4_2_lut (.I0(GND_net), .I1(bytes_sent[0]), .I2(GND_net), 
            .I3(VCC_net), .O(n47[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_156_add_4_2 (.CI(VCC_net), .I0(bytes_sent[0]), .I1(GND_net), 
            .CO(n9675));
    SB_RAM512x8 rom_addr_6__I_0 (.RDATA({ctrl_in_ep_data}), .RCLK(clk_48mhz), 
            .RCLKE(VCC_net), .RE(VCC_net), .RADDR({GND_net, GND_net, 
            rom_addr_6__N_278}), .WADDR({GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net}));
    defparam rom_addr_6__I_0.INIT_0 = 256'h010000040932C000010200430209010000000000210012092000000202000112;
    defparam rom_addr_6__I_0.INIT_1 = 256'h0409400008038205070100062405060224040100012405011000240500010202;
    defparam rom_addr_6__I_0.INIT_2 = 256'h000000000800010000258000002002810507000020020105070000000A020001;
    defparam rom_addr_6__I_0.INIT_3 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    defparam rom_addr_6__I_0.INIT_4 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_5 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_6 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_7 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_8 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_9 = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_A = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_B = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_C = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_D = 256'hFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_E = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    defparam rom_addr_6__I_0.INIT_F = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    SB_LUT4 i39_3_lut_4_lut (.I0(\raw_setup_data[3] [2]), .I1(n10974), .I2(\raw_setup_data[3] [1]), 
            .I3(rom_addr[4]), .O(n20));
    defparam i39_3_lut_4_lut.LUT_INIT = 16'h1f10;
    SB_LUT4 i2_3_lut_4_lut (.I0(\raw_setup_data[3] [2]), .I1(n10974), .I2(\raw_setup_data[3] [0]), 
            .I3(\raw_setup_data[3] [1]), .O(n7270));
    defparam i2_3_lut_4_lut.LUT_INIT = 16'h0100;
    SB_LUT4 i1_3_lut_4_lut (.I0(\raw_setup_data[3] [2]), .I1(n10974), .I2(\raw_setup_data[3] [1]), 
            .I3(\raw_setup_data[3] [0]), .O(n3834));
    defparam i1_3_lut_4_lut.LUT_INIT = 16'h0110;
    SB_LUT4 i9762_2_lut_rep_211 (.I0(\raw_setup_data[3] [2]), .I1(n10974), 
            .I2(GND_net), .I3(GND_net), .O(n12052));
    defparam i9762_2_lut_rep_211.LUT_INIT = 16'heeee;
    SB_LUT4 i1_3_lut_4_lut_adj_154 (.I0(\raw_setup_data[3] [0]), .I1(n10974), 
            .I2(\raw_setup_data[3] [2]), .I3(\raw_setup_data[3] [1]), .O(n45));   // ../../../common/usb_serial_ctrl_ep.v(237[11] 257[18])
    defparam i1_3_lut_4_lut_adj_154.LUT_INIT = 16'heefd;
    SB_LUT4 i1_4_lut_rep_210 (.I0(\raw_setup_data[3] [0]), .I1(n10974), 
            .I2(\raw_setup_data[3] [2]), .I3(\raw_setup_data[3] [1]), .O(n12051));   // ../../../common/usb_serial_ctrl_ep.v(237[11] 257[18])
    defparam i1_4_lut_rep_210.LUT_INIT = 16'heeec;
    SB_DFFE dev_addr_i_i0_i6 (.Q(dev_addr[6]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i5 (.Q(dev_addr[5]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i4 (.Q(dev_addr[4]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i3 (.Q(dev_addr[3]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i2 (.Q(dev_addr[2]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i7 (.Q(bytes_sent[7]), .C(clk_48mhz), .E(n4156), 
            .D(n47[7]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE dev_addr_i_i0_i1 (.Q(dev_addr[1]), .C(clk_48mhz), .E(n275), 
            .D(new_dev_addr[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i6 (.Q(rom_addr[6]), .C(clk_48mhz), .D(rom_addr_6__N_278[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i6 (.Q(bytes_sent[6]), .C(clk_48mhz), .E(n4156), 
            .D(n47[6]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i5 (.Q(bytes_sent[5]), .C(clk_48mhz), .E(n4156), 
            .D(n47[5]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i5 (.Q(rom_addr[5]), .C(clk_48mhz), .D(rom_addr_6__N_278[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i4 (.Q(rom_addr[4]), .C(clk_48mhz), .D(rom_addr_6__N_278[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i4 (.Q(bytes_sent[4]), .C(clk_48mhz), .E(n4156), 
            .D(n47[4]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i3 (.Q(bytes_sent[3]), .C(clk_48mhz), .E(n4156), 
            .D(n47[3]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i2 (.Q(bytes_sent[2]), .C(clk_48mhz), .E(n4156), 
            .D(n47[2]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR bytes_sent__i1 (.Q(bytes_sent[1]), .C(clk_48mhz), .E(n4156), 
            .D(n47[1]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i3 (.Q(rom_addr[3]), .C(clk_48mhz), .D(rom_addr_6__N_278[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i2 (.Q(rom_addr[2]), .C(clk_48mhz), .D(rom_addr_6__N_278[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFF rom_addr_i1 (.Q(rom_addr[1]), .C(clk_48mhz), .D(rom_addr_6__N_278[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR setup_data_addr__i2 (.Q(setup_data_addr[2]), .C(clk_48mhz), 
            .E(n11995), .D(n857[2]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR setup_data_addr__i1 (.Q(setup_data_addr[1]), .C(clk_48mhz), 
            .E(n11995), .D(n857[1]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFSR setup_data_addr__i0 (.Q(setup_data_addr[0]), .C(clk_48mhz), 
            .D(n1[0]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i6 (.Q(new_dev_addr[6]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i5 (.Q(new_dev_addr[5]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i4 (.Q(new_dev_addr[4]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i3 (.Q(new_dev_addr[3]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i2 (.Q(new_dev_addr[2]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE new_dev_addr_i0_i1 (.Q(new_dev_addr[1]), .C(clk_48mhz), .E(n2318), 
            .D(\raw_setup_data[2] [1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 i1_2_lut_rep_193_3_lut (.I0(\raw_setup_data[3] [0]), .I1(n10974), 
            .I2(\raw_setup_data[3] [1]), .I3(GND_net), .O(n12034));
    defparam i1_2_lut_rep_193_3_lut.LUT_INIT = 16'hefef;
    SB_LUT4 i10360_2_lut_3_lut_4_lut (.I0(\raw_setup_data[3] [0]), .I1(n10974), 
            .I2(\raw_setup_data[3] [2]), .I3(\raw_setup_data[3] [1]), .O(in_ep_stall_N_436));
    defparam i10360_2_lut_3_lut_4_lut.LUT_INIT = 16'h1000;
    SB_DFFESR rom_length__i0 (.Q(rom_length[0]), .C(clk_48mhz), .E(n7325), 
            .D(n3908), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 i1_2_lut_rep_205 (.I0(\raw_setup_data[3] [0]), .I1(n10974), 
            .I2(GND_net), .I3(GND_net), .O(n12046));
    defparam i1_2_lut_rep_205.LUT_INIT = 16'heeee;
    SB_LUT4 i5_3_lut (.I0(\raw_setup_data[6][3] ), .I1(\raw_setup_data[6][2] ), 
            .I2(n3826), .I3(GND_net), .O(n14_c));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i5_3_lut.LUT_INIT = 16'hfefe;
    SB_LUT4 i6_4_lut (.I0(\raw_setup_data[6][7] ), .I1(\raw_setup_data[6][6] ), 
            .I2(\raw_setup_data[6][0] ), .I3(\raw_setup_data[6][4] ), .O(n15));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i6_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i8_4_lut (.I0(n15), .I1(\raw_setup_data[6][5] ), .I2(n14_c), 
            .I3(\raw_setup_data[6][1] ), .O(has_data_stage));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i8_4_lut.LUT_INIT = 16'hfffe;
    SB_DFFESR rom_length__i1 (.Q(rom_length[1]), .C(clk_48mhz), .E(n7325), 
            .D(n3905), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR rom_length__i2 (.Q(rom_length[2]), .C(clk_48mhz), .E(n7325), 
            .D(n3906), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFESR rom_length__i4 (.Q(rom_length[4]), .C(clk_48mhz), .E(n7325), 
            .D(n3931), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 i1_2_lut (.I0(all_data_sent), .I1(\ctrl_xfr_state[1] ), .I2(GND_net), 
            .I3(GND_net), .O(n5));
    defparam i1_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i2_2_lut (.I0(\raw_setup_data[3] [5]), .I1(\raw_setup_data[3] [7]), 
            .I2(GND_net), .I3(GND_net), .O(n6));
    defparam i2_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i9694_4_lut (.I0(\raw_setup_data[3] [3]), .I1(\raw_setup_data[3] [6]), 
            .I2(n6), .I3(\raw_setup_data[3] [4]), .O(n10974));
    defparam i9694_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i10111_2_lut (.I0(\raw_setup_data[1] [1]), .I1(\raw_setup_data[1] [2]), 
            .I2(GND_net), .I3(GND_net), .O(n11391));
    defparam i10111_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i4_4_lut (.I0(\raw_setup_data[1] [0]), .I1(n41_adj_2000), .I2(\raw_setup_data[1] [5]), 
            .I3(n11391), .O(n8630));
    defparam i4_4_lut.LUT_INIT = 16'hfeff;
    SB_DFF raw_setup_data_0___i8 (.Q(\raw_setup_data[0] [7]), .C(clk_48mhz), 
           .D(n162[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i11 (.Q(\raw_setup_data[1] [0]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i12 (.Q(\raw_setup_data[1] [1]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i13 (.Q(\raw_setup_data[1] [2]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i14 (.Q(\raw_setup_data[1] [3]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i15 (.Q(\raw_setup_data[1] [4]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i16 (.Q(\raw_setup_data[1] [5]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i17 (.Q(\raw_setup_data[1] [6]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i18 (.Q(\raw_setup_data[1] [7]), .C(clk_48mhz), 
            .E(n4323), .D(out_ep_data[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i21 (.Q(\raw_setup_data[2] [0]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i22 (.Q(\raw_setup_data[2] [1]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i23 (.Q(\raw_setup_data[2] [2]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i24 (.Q(\raw_setup_data[2] [3]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i25 (.Q(\raw_setup_data[2] [4]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i26 (.Q(\raw_setup_data[2] [5]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i27 (.Q(\raw_setup_data[2] [6]), .C(clk_48mhz), 
            .E(n4324), .D(out_ep_data[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i31 (.Q(\raw_setup_data[3] [0]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i32 (.Q(\raw_setup_data[3] [1]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i33 (.Q(\raw_setup_data[3] [2]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i34 (.Q(\raw_setup_data[3] [3]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i35 (.Q(\raw_setup_data[3] [4]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i36 (.Q(\raw_setup_data[3] [5]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i37 (.Q(\raw_setup_data[3] [6]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i38 (.Q(\raw_setup_data[3] [7]), .C(clk_48mhz), 
            .E(n4325), .D(out_ep_data[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i61 (.Q(\raw_setup_data[6][0] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i62 (.Q(\raw_setup_data[6][1] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i63 (.Q(\raw_setup_data[6][2] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i64 (.Q(\raw_setup_data[6][3] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i65 (.Q(\raw_setup_data[6][4] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i66 (.Q(\raw_setup_data[6][5] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i67 (.Q(\raw_setup_data[6][6] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i68 (.Q(\raw_setup_data[6][7] ), .C(clk_48mhz), 
            .E(n4326), .D(out_ep_data[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i71 (.Q(\raw_setup_data[7] [0]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[0]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i72 (.Q(\raw_setup_data[7] [1]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[1]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i73 (.Q(\raw_setup_data[7] [2]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[2]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i74 (.Q(\raw_setup_data[7] [3]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[3]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i75 (.Q(\raw_setup_data[7] [4]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[4]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i76 (.Q(\raw_setup_data[7] [5]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[5]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i77 (.Q(\raw_setup_data[7] [6]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[6]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFE raw_setup_data_0___i78 (.Q(\raw_setup_data[7] [7]), .C(clk_48mhz), 
            .E(n4327), .D(out_ep_data[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_DFFSR ctrl_xfr_state__i2 (.Q(\ctrl_xfr_state[1] ), .C(clk_48mhz), 
            .D(n1857), .R(\ctrl_xfr_state[2] ));   // ../../../common/usb_serial_ctrl_ep.v(217[10] 223[6])
    SB_DFFSR ctrl_xfr_state__i3 (.Q(\ctrl_xfr_state[2] ), .C(clk_48mhz), 
            .D(n10212), .R(n4606));   // ../../../common/usb_serial_ctrl_ep.v(217[10] 223[6])
    SB_DFFESR bytes_sent__i0 (.Q(bytes_sent[0]), .C(clk_48mhz), .E(n4156), 
            .D(n47[0]), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 i1_2_lut_3_lut (.I0(n3933), .I1(n12114), .I2(rom_length[2]), 
            .I3(GND_net), .O(n3843));
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h4040;
    SB_LUT4 i1330_2_lut_rep_154_3_lut (.I0(ctrl_out_ep_setup), .I1(out_ep_data_valid), 
            .I2(status_stage_end), .I3(GND_net), .O(n11995));   // ../../../common/usb_serial_ctrl_ep.v(228[9:42])
    defparam i1330_2_lut_rep_154_3_lut.LUT_INIT = 16'hf8f8;
    SB_LUT4 i1763_2_lut_3_lut_4_lut (.I0(ctrl_out_ep_setup), .I1(out_ep_data_valid), 
            .I2(setup_data_addr[0]), .I3(status_stage_end), .O(n1[0]));   // ../../../common/usb_serial_ctrl_ep.v(228[9:42])
    defparam i1763_2_lut_3_lut_4_lut.LUT_INIT = 16'h0f78;
    SB_LUT4 i1_2_lut_rep_235_3_lut (.I0(ctrl_out_ep_setup), .I1(out_ep_data_valid), 
            .I2(setup_data_addr[2]), .I3(GND_net), .O(n12076));   // ../../../common/usb_serial_ctrl_ep.v(228[9:42])
    defparam i1_2_lut_rep_235_3_lut.LUT_INIT = 16'hf7f7;
    SB_DFFESR rom_length__i6 (.Q(rom_length[6]), .C(clk_48mhz), .E(n7325), 
            .D(n3929), .R(status_stage_end));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    SB_LUT4 out_ep_setup_I_0_2_lut_rep_275 (.I0(ctrl_out_ep_setup), .I1(out_ep_data_valid), 
            .I2(GND_net), .I3(GND_net), .O(n12116));   // ../../../common/usb_serial_ctrl_ep.v(228[9:42])
    defparam out_ep_setup_I_0_2_lut_rep_275.LUT_INIT = 16'h8888;
    SB_LUT4 i1_2_lut_rep_196_4_lut (.I0(\raw_setup_data[1] [2]), .I1(\raw_setup_data[1] [0]), 
            .I2(\raw_setup_data[1] [1]), .I3(n3933), .O(n12037));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    defparam i1_2_lut_rep_196_4_lut.LUT_INIT = 16'h0020;
    SB_LUT4 i27_4_lut (.I0(rom_addr[0]), .I1(n14_adj_2001), .I2(\raw_setup_data[1] [5]), 
            .I3(n12037), .O(n16));
    defparam i27_4_lut.LUT_INIT = 16'hcac0;
    SB_LUT4 i2_3_lut_rep_273 (.I0(\raw_setup_data[1] [2]), .I1(\raw_setup_data[1] [0]), 
            .I2(\raw_setup_data[1] [1]), .I3(GND_net), .O(n12114));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    defparam i2_3_lut_rep_273.LUT_INIT = 16'h2020;
    SB_LUT4 mux_89_i1_4_lut (.I0(rom_addr[0]), .I1(n41_adj_2000), .I2(n12003), 
            .I3(n16), .O(n1351[0]));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam mux_89_i1_4_lut.LUT_INIT = 16'ha3a0;
    SB_LUT4 i1_3_lut (.I0(rom_addr[1]), .I1(n7270), .I2(n45), .I3(GND_net), 
            .O(n2304));
    defparam i1_3_lut.LUT_INIT = 16'hecec;
    SB_LUT4 mux_89_i2_4_lut (.I0(rom_addr[1]), .I1(n2304), .I2(n12003), 
            .I3(n8630), .O(n1351[1]));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam mux_89_i2_4_lut.LUT_INIT = 16'ha0ac;
    SB_LUT4 i2_2_lut_adj_155 (.I0(\raw_setup_data[7] [1]), .I1(\raw_setup_data[7] [2]), 
            .I2(GND_net), .I3(GND_net), .O(n10));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i2_2_lut_adj_155.LUT_INIT = 16'heeee;
    SB_LUT4 i27_4_lut_adj_156 (.I0(rom_addr[2]), .I1(n14_adj_2001), .I2(\raw_setup_data[1] [5]), 
            .I3(n12037), .O(n16_adj_2002));
    defparam i27_4_lut_adj_156.LUT_INIT = 16'hcac0;
    SB_LUT4 mux_89_i3_4_lut (.I0(rom_addr[2]), .I1(n41_adj_2000), .I2(n12003), 
            .I3(n16_adj_2002), .O(n1351[2]));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam mux_89_i3_4_lut.LUT_INIT = 16'ha3a0;
    SB_LUT4 i6_4_lut_adj_157 (.I0(\raw_setup_data[7] [7]), .I1(\raw_setup_data[7] [4]), 
            .I2(\raw_setup_data[7] [5]), .I3(\raw_setup_data[7] [6]), .O(n14_adj_2003));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i6_4_lut_adj_157.LUT_INIT = 16'hfffe;
    SB_LUT4 i7_4_lut (.I0(\raw_setup_data[7] [0]), .I1(n14_adj_2003), .I2(n10), 
            .I3(\raw_setup_data[7] [3]), .O(n3826));   // ../../../common/usb_serial_ctrl_ep.v(87[25:56])
    defparam i7_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_2_lut_3_lut_adj_158 (.I0(\raw_setup_data[1] [0]), .I1(\raw_setup_data[1] [1]), 
            .I2(\raw_setup_data[1] [2]), .I3(GND_net), .O(n14_adj_2001));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    defparam i1_2_lut_3_lut_adj_158.LUT_INIT = 16'h0202;
    SB_LUT4 i1_2_lut_rep_270 (.I0(\raw_setup_data[1] [0]), .I1(\raw_setup_data[1] [1]), 
            .I2(GND_net), .I3(GND_net), .O(n12111));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    defparam i1_2_lut_rep_270.LUT_INIT = 16'h2222;
    SB_DFFSR ctrl_xfr_state__i1 (.Q(\ctrl_xfr_state[0] ), .C(clk_48mhz), 
            .D(n10174), .R(n4606));   // ../../../common/usb_serial_ctrl_ep.v(217[10] 223[6])
    SB_LUT4 i1_4_lut (.I0(\raw_setup_data[3] [0]), .I1(rom_addr[4]), .I2(n20), 
            .I3(n12051), .O(n2310));   // ../../../common/usb_serial_ctrl_ep.v(237[11] 257[18])
    defparam i1_4_lut.LUT_INIT = 16'hdc50;
    SB_LUT4 i27_4_lut_adj_159 (.I0(n2310), .I1(n14_adj_2001), .I2(\raw_setup_data[1] [5]), 
            .I3(n12114), .O(n16_adj_2004));
    defparam i27_4_lut_adj_159.LUT_INIT = 16'hcac0;
    SB_LUT4 mux_89_i5_4_lut (.I0(rom_addr[4]), .I1(n41_adj_2000), .I2(n12003), 
            .I3(n16_adj_2004), .O(n1351[4]));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam mux_89_i5_4_lut.LUT_INIT = 16'ha3a0;
    SB_LUT4 rom_length_6__I_0_i4_4_lut (.I0(bytes_sent[0]), .I1(bytes_sent[1]), 
            .I2(rom_length[1]), .I3(rom_length[0]), .O(n4));   // ../../../common/usb_serial_ctrl_ep.v(98[5:31])
    defparam rom_length_6__I_0_i4_4_lut.LUT_INIT = 16'h8ecf;
    SB_LUT4 rom_length_6__I_0_i6_3_lut (.I0(n4), .I1(bytes_sent[2]), .I2(rom_length[2]), 
            .I3(GND_net), .O(n6_adj_2005));   // ../../../common/usb_serial_ctrl_ep.v(98[5:31])
    defparam rom_length_6__I_0_i6_3_lut.LUT_INIT = 16'h8e8e;
    SB_LUT4 rom_length_6__I_0_i10_4_lut (.I0(n6_adj_2005), .I1(bytes_sent[4]), 
            .I2(rom_length[4]), .I3(bytes_sent[3]), .O(n10_adj_2006));   // ../../../common/usb_serial_ctrl_ep.v(98[5:31])
    defparam rom_length_6__I_0_i10_4_lut.LUT_INIT = 16'hcf8e;
    SB_LUT4 i27_4_lut_adj_160 (.I0(rom_addr[6]), .I1(n14_adj_2001), .I2(\raw_setup_data[1] [5]), 
            .I3(n12037), .O(n16_adj_2007));
    defparam i27_4_lut_adj_160.LUT_INIT = 16'hcac0;
    SB_LUT4 i4860_4_lut (.I0(rom_addr[6]), .I1(n41_adj_2000), .I2(n12003), 
            .I3(n16_adj_2007), .O(n5978));
    defparam i4860_4_lut.LUT_INIT = 16'ha3a0;
    SB_LUT4 rom_length_6__I_0_i14_4_lut (.I0(n10_adj_2006), .I1(bytes_sent[6]), 
            .I2(rom_length[6]), .I3(bytes_sent[5]), .O(n14));   // ../../../common/usb_serial_ctrl_ep.v(98[5:31])
    defparam rom_length_6__I_0_i14_4_lut.LUT_INIT = 16'hcf8e;
    SB_LUT4 i1_2_lut_adj_161 (.I0(has_data_stage), .I1(\raw_setup_data[0] [7]), 
            .I2(GND_net), .I3(GND_net), .O(ctrl_xfr_state_next_5__N_299[0]));   // ../../../common/usb_serial_ctrl_ep.v(93[26:60])
    defparam i1_2_lut_adj_161.LUT_INIT = 16'h2222;
    SB_LUT4 i2910_2_lut_org_4_lut (.I0(n12003), .I1(n3933), .I2(n8630), 
            .I3(rom_addr[3]), .O(n4031));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam i2910_2_lut_org_4_lut.LUT_INIT = 16'hab00;
    SB_LUT4 i1_4_lut_adj_162 (.I0(rom_length[6]), .I1(n8630), .I2(n7270), 
            .I3(n45), .O(n3929));
    defparam i1_4_lut_adj_162.LUT_INIT = 16'h3230;
    SB_LUT4 i3_4_lut (.I0(\ctrl_xfr_state[0] ), .I1(all_data_sent), .I2(\ctrl_xfr_state[2] ), 
            .I3(\ctrl_xfr_state[1] ), .O(in_ep_req_0__N_914));   // ../../../common/usb_serial_ctrl_ep.v(217[10] 223[6])
    defparam i3_4_lut.LUT_INIT = 16'hfeff;
    SB_LUT4 i2_3_lut_4_lut_adj_163 (.I0(setup_data_addr[1]), .I1(setup_data_addr[2]), 
            .I2(setup_data_addr[0]), .I3(n12116), .O(n4327));
    defparam i2_3_lut_4_lut_adj_163.LUT_INIT = 16'h8000;
    SB_LUT4 i10374_3_lut_4_lut (.I0(setup_data_addr[1]), .I1(setup_data_addr[2]), 
            .I2(setup_data_addr[0]), .I3(n12116), .O(n4326));
    defparam i10374_3_lut_4_lut.LUT_INIT = 16'h0800;
    SB_LUT4 add_156_add_4_9_lut (.I0(GND_net), .I1(bytes_sent[7]), .I2(GND_net), 
            .I3(n9681), .O(n47[7])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_9_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_156_add_4_8_lut (.I0(GND_net), .I1(bytes_sent[6]), .I2(GND_net), 
            .I3(n9680), .O(n47[6])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_156_add_4_8 (.CI(n9680), .I0(bytes_sent[6]), .I1(GND_net), 
            .CO(n9681));
    SB_LUT4 add_156_add_4_7_lut (.I0(GND_net), .I1(bytes_sent[5]), .I2(GND_net), 
            .I3(n9679), .O(n47[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1_2_lut_adj_164 (.I0(\ctrl_xfr_state[2] ), .I1(\ctrl_xfr_state[1] ), 
            .I2(GND_net), .I3(GND_net), .O(n4606));   // ../../../common/usb_serial_ctrl_ep.v(217[10] 223[6])
    defparam i1_2_lut_adj_164.LUT_INIT = 16'h8888;
    SB_LUT4 i2908_2_lut_org_4_lut (.I0(n12003), .I1(n3933), .I2(n8630), 
            .I3(rom_addr[5]), .O(n4029));   // ../../../common/usb_serial_ctrl_ep.v(233[5] 307[8])
    defparam i2908_2_lut_org_4_lut.LUT_INIT = 16'hab00;
    SB_LUT4 i1_2_lut_adj_165 (.I0(setup_data_addr[0]), .I1(setup_data_addr[1]), 
            .I2(GND_net), .I3(GND_net), .O(n4_adj_2009));   // ../../../common/usb_serial_ctrl_ep.v(229[7:38])
    defparam i1_2_lut_adj_165.LUT_INIT = 16'heeee;
    SB_LUT4 i2003_4_lut (.I0(out_ep_data[7]), .I1(\raw_setup_data[0] [7]), 
            .I2(n12076), .I3(n4_adj_2009), .O(n162[7]));   // ../../../common/usb_serial_ctrl_ep.v(225[10] 331[6])
    defparam i2003_4_lut.LUT_INIT = 16'hccca;
    SB_CARRY add_156_add_4_7 (.CI(n9679), .I0(bytes_sent[5]), .I1(GND_net), 
            .CO(n9680));
    SB_LUT4 add_156_add_4_6_lut (.I0(GND_net), .I1(bytes_sent[4]), .I2(GND_net), 
            .I3(n9678), .O(n47[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_864_add_4_8_lut (.I0(GND_net), .I1(GND_net), .I2(n5978), 
            .I3(n9745), .O(rom_addr_6__N_407[6])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_8_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 add_864_add_4_7_lut (.I0(GND_net), .I1(GND_net), .I2(n4029), 
            .I3(n9744), .O(rom_addr_6__N_407[5])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_7_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_864_add_4_7 (.CI(n9744), .I0(GND_net), .I1(n4029), .CO(n9745));
    SB_LUT4 add_864_add_4_6_lut (.I0(GND_net), .I1(GND_net), .I2(n1351[4]), 
            .I3(n9743), .O(rom_addr_6__N_407[4])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_6_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_864_add_4_6 (.CI(n9743), .I0(GND_net), .I1(n1351[4]), 
            .CO(n9744));
    SB_LUT4 add_864_add_4_5_lut (.I0(GND_net), .I1(GND_net), .I2(n4031), 
            .I3(n9742), .O(rom_addr_6__N_407[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_864_add_4_5 (.CI(n9742), .I0(GND_net), .I1(n4031), .CO(n9743));
    SB_LUT4 add_864_add_4_4_lut (.I0(GND_net), .I1(GND_net), .I2(n1351[2]), 
            .I3(n9741), .O(rom_addr_6__N_407[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_864_add_4_4 (.CI(n9741), .I0(GND_net), .I1(n1351[2]), 
            .CO(n9742));
    SB_LUT4 add_864_add_4_3_lut (.I0(GND_net), .I1(GND_net), .I2(n1351[1]), 
            .I3(n9740), .O(rom_addr_6__N_407[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_864_add_4_3 (.CI(n9740), .I0(GND_net), .I1(n1351[1]), 
            .CO(n9741));
    SB_LUT4 add_864_add_4_2_lut (.I0(GND_net), .I1(ctrl_in_ep_data_put), 
            .I2(n1351[0]), .I3(GND_net), .O(rom_addr_6__N_407[0])) /* synthesis syn_instantiated=1 */ ;
    defparam add_864_add_4_2_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i1_4_lut_adj_166 (.I0(\raw_setup_data[3] [1]), .I1(\raw_setup_data[3] [0]), 
            .I2(rom_length[4]), .I3(n12052), .O(n19));   // ../../../common/usb_serial_ctrl_ep.v(237[11] 257[18])
    defparam i1_4_lut_adj_166.LUT_INIT = 16'h5054;
    SB_LUT4 i1_4_lut_adj_167 (.I0(n19), .I1(n8630), .I2(rom_length[4]), 
            .I3(n12046), .O(n3931));
    defparam i1_4_lut_adj_167.LUT_INIT = 16'h3222;
    SB_CARRY add_864_add_4_2 (.CI(GND_net), .I0(ctrl_in_ep_data_put), .I1(n1351[0]), 
            .CO(n9740));
    SB_LUT4 i1_4_lut_adj_168 (.I0(\raw_setup_data[3] [2]), .I1(n10974), 
            .I2(\raw_setup_data[3] [1]), .I3(\raw_setup_data[3] [0]), .O(n3933));   // ../../../common/usb_serial_ctrl_ep.v(237[11] 257[18])
    defparam i1_4_lut_adj_168.LUT_INIT = 16'h0130;
    SB_LUT4 i1_4_lut_adj_169 (.I0(n41_adj_2000), .I1(n3843), .I2(n14_adj_2001), 
            .I3(\raw_setup_data[1] [5]), .O(n3906));
    defparam i1_4_lut_adj_169.LUT_INIT = 16'h5044;
    SB_LUT4 i1_4_lut_adj_170 (.I0(n3834), .I1(n12114), .I2(rom_length[1]), 
            .I3(n12034), .O(n3923));
    defparam i1_4_lut_adj_170.LUT_INIT = 16'hc888;
    SB_LUT4 i1_4_lut_adj_171 (.I0(n41_adj_2000), .I1(n3923), .I2(n14_adj_2001), 
            .I3(\raw_setup_data[1] [5]), .O(n3905));
    defparam i1_4_lut_adj_171.LUT_INIT = 16'h5044;
    SB_CARRY add_156_add_4_6 (.CI(n9678), .I0(bytes_sent[4]), .I1(GND_net), 
            .CO(n9679));
    SB_LUT4 add_156_add_4_5_lut (.I0(GND_net), .I1(bytes_sent[3]), .I2(GND_net), 
            .I3(n9677), .O(n47[3])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_5_lut.LUT_INIT = 16'hC33C;
    SB_CARRY add_156_add_4_5 (.CI(n9677), .I0(bytes_sent[3]), .I1(GND_net), 
            .CO(n9678));
    SB_LUT4 add_156_add_4_4_lut (.I0(GND_net), .I1(bytes_sent[2]), .I2(GND_net), 
            .I3(n9676), .O(n47[2])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_4_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i6370_2_lut (.I0(rom_addr_6__N_407[0]), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(rom_addr_6__N_278[0]));   // ../../../common/usb_serial_ctrl_ep.v(314[5] 324[8])
    defparam i6370_2_lut.LUT_INIT = 16'h2222;
    SB_CARRY add_156_add_4_4 (.CI(n9676), .I0(bytes_sent[2]), .I1(GND_net), 
            .CO(n9677));
    SB_LUT4 add_156_add_4_3_lut (.I0(GND_net), .I1(bytes_sent[1]), .I2(GND_net), 
            .I3(n9675), .O(n47[1])) /* synthesis syn_instantiated=1 */ ;
    defparam add_156_add_4_3_lut.LUT_INIT = 16'hC33C;
    SB_LUT4 i3_4_lut_adj_172 (.I0(\raw_setup_data[1] [6]), .I1(\raw_setup_data[1] [4]), 
            .I2(\raw_setup_data[1] [7]), .I3(\raw_setup_data[1] [3]), .O(n41_adj_2000));
    defparam i3_4_lut_adj_172.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_4_lut_adj_173 (.I0(\raw_setup_data[3] [0]), .I1(rom_length[0]), 
            .I2(n12052), .I3(\raw_setup_data[3] [1]), .O(n12));   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    defparam i1_4_lut_adj_173.LUT_INIT = 16'h0544;
    SB_LUT4 i1_4_lut_adj_174 (.I0(n12114), .I1(rom_length[0]), .I2(n12), 
            .I3(n12051), .O(n35_adj_2010));   // ../../../common/usb_serial_ctrl_ep.v(60[13:27])
    defparam i1_4_lut_adj_174.LUT_INIT = 16'ha8a0;
    SB_LUT4 i1_4_lut_adj_175 (.I0(n41_adj_2000), .I1(n35_adj_2010), .I2(n14_adj_2001), 
            .I3(\raw_setup_data[1] [5]), .O(n3908));
    defparam i1_4_lut_adj_175.LUT_INIT = 16'h5044;
    SB_LUT4 i1399_2_lut (.I0(setup_data_addr[1]), .I1(setup_data_addr[0]), 
            .I2(GND_net), .I3(GND_net), .O(n857[1]));   // ../../../common/usb_serial_ctrl_ep.v(230[26:45])
    defparam i1399_2_lut.LUT_INIT = 16'h6666;
    SB_LUT4 i1406_3_lut (.I0(setup_data_addr[2]), .I1(setup_data_addr[1]), 
            .I2(setup_data_addr[0]), .I3(GND_net), .O(n857[2]));   // ../../../common/usb_serial_ctrl_ep.v(230[26:45])
    defparam i1406_3_lut.LUT_INIT = 16'h6a6a;
    SB_LUT4 i10382_3_lut_4_lut (.I0(setup_data_addr[2]), .I1(n12116), .I2(setup_data_addr[0]), 
            .I3(setup_data_addr[1]), .O(n4323));   // ../../../common/usb_serial_ctrl_ep.v(229[7:38])
    defparam i10382_3_lut_4_lut.LUT_INIT = 16'h0040;
    SB_LUT4 i10376_2_lut_3_lut_4_lut (.I0(setup_data_addr[2]), .I1(n12116), 
            .I2(setup_data_addr[0]), .I3(setup_data_addr[1]), .O(n4325));   // ../../../common/usb_serial_ctrl_ep.v(229[7:38])
    defparam i10376_2_lut_3_lut_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i10379_2_lut_3_lut_4_lut (.I0(setup_data_addr[2]), .I1(n12116), 
            .I2(setup_data_addr[0]), .I3(setup_data_addr[1]), .O(n4324));   // ../../../common/usb_serial_ctrl_ep.v(229[7:38])
    defparam i10379_2_lut_3_lut_4_lut.LUT_INIT = 16'h0400;
    SB_LUT4 i1332_2_lut (.I0(ctrl_in_ep_data_put), .I1(status_stage_end), 
            .I2(GND_net), .I3(GND_net), .O(n4156));
    defparam i1332_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i6363_2_lut_rep_162_4_lut (.I0(\ctrl_xfr_state[0] ), .I1(n12112), 
            .I2(n12017), .I3(ctrl_in_ep_data_put), .O(n12003));
    defparam i6363_2_lut_rep_162_4_lut.LUT_INIT = 16'hffdf;
    SB_LUT4 i1_2_lut_4_lut (.I0(\ctrl_xfr_state[0] ), .I1(n12112), .I2(n12017), 
            .I3(n8630), .O(n3824));
    defparam i1_2_lut_4_lut.LUT_INIT = 16'hffdf;
    SB_LUT4 i1_2_lut_4_lut_adj_176 (.I0(\ctrl_xfr_state[0] ), .I1(n12112), 
            .I2(n12017), .I3(status_stage_end), .O(n7325));
    defparam i1_2_lut_4_lut_adj_176.LUT_INIT = 16'hff20;
    falling_edge_detector detect_pkt_end (.\ctrl_xfr_state_next_5__N_150[0] (\ctrl_xfr_state_next_5__N_150[0] ), 
            .\ctrl_xfr_state_next_5__N_299[0] (ctrl_xfr_state_next_5__N_299[0]), 
            .\ctrl_xfr_state[0] (\ctrl_xfr_state[0] ), .n12017(n12017), 
            .n1854(n1854), .n2318(n2318), .status_stage_end(status_stage_end), 
            .save_dev_addr(save_dev_addr), .n10180(n10180), .GND_net(GND_net), 
            .\raw_setup_data[1][5] (\raw_setup_data[1] [5]), .n12111(n12111), 
            .out_ep_data_valid(out_ep_data_valid), .n12020(n12020), .has_data_stage(has_data_stage), 
            .n12007(n12007), .n41(n41_adj_2000), .\raw_setup_data[1][2] (\raw_setup_data[1] [2]), 
            .n12112(n12112)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_serial_ctrl_ep.v(78[25] 82[4])
    rising_edge_detector detect_in_data_transfer_done (.all_data_sent(all_data_sent), 
            .in_q(in_q), .clk_48mhz(clk_48mhz)) /* synthesis syn_module_defined=1 */ ;   // ../../../common/usb_serial_ctrl_ep.v(106[24] 110[4])
    
endmodule
//
// Verilog Description of module falling_edge_detector
//

module falling_edge_detector (\ctrl_xfr_state_next_5__N_150[0] , \ctrl_xfr_state_next_5__N_299[0] , 
            \ctrl_xfr_state[0] , n12017, n1854, n2318, status_stage_end, 
            save_dev_addr, n10180, GND_net, \raw_setup_data[1][5] , 
            n12111, out_ep_data_valid, n12020, has_data_stage, n12007, 
            n41, \raw_setup_data[1][2] , n12112) /* synthesis syn_module_defined=1 */ ;
    input \ctrl_xfr_state_next_5__N_150[0] ;
    input \ctrl_xfr_state_next_5__N_299[0] ;
    input \ctrl_xfr_state[0] ;
    input n12017;
    output n1854;
    output n2318;
    input status_stage_end;
    input save_dev_addr;
    output n10180;
    input GND_net;
    input \raw_setup_data[1][5] ;
    input n12111;
    input out_ep_data_valid;
    input n12020;
    input has_data_stage;
    output n12007;
    input n41;
    input \raw_setup_data[1][2] ;
    input n12112;
    
    
    wire n12;
    
    SB_LUT4 i7531_4_lut (.I0(\ctrl_xfr_state_next_5__N_150[0] ), .I1(\ctrl_xfr_state_next_5__N_299[0] ), 
            .I2(\ctrl_xfr_state[0] ), .I3(n12017), .O(n1854));   // ../../../common/usb_serial_ctrl_ep.v(32[13:27])
    defparam i7531_4_lut.LUT_INIT = 16'hcafa;
    SB_LUT4 i12_3_lut (.I0(n2318), .I1(status_stage_end), .I2(save_dev_addr), 
            .I3(GND_net), .O(n10180));   // ../../../common/usb_serial_ctrl_ep.v(44[7:23])
    defparam i12_3_lut.LUT_INIT = 16'h3a3a;
    SB_LUT4 i6_4_lut (.I0(\raw_setup_data[1][5] ), .I1(n12), .I2(n12111), 
            .I3(\ctrl_xfr_state[0] ), .O(n2318));
    defparam i6_4_lut.LUT_INIT = 16'h4000;
    SB_LUT4 i1_2_lut_rep_166_3_lut (.I0(out_ep_data_valid), .I1(n12020), 
            .I2(has_data_stage), .I3(GND_net), .O(n12007));
    defparam i1_2_lut_rep_166_3_lut.LUT_INIT = 16'h0202;
    SB_LUT4 i5_4_lut (.I0(n12017), .I1(n41), .I2(\raw_setup_data[1][2] ), 
            .I3(n12112), .O(n12));
    defparam i5_4_lut.LUT_INIT = 16'h0020;
    
endmodule
//
// Verilog Description of module rising_edge_detector
//

module rising_edge_detector (all_data_sent, in_q, clk_48mhz) /* synthesis syn_module_defined=1 */ ;
    input all_data_sent;
    output in_q;
    input clk_48mhz;
    
    wire clk_48mhz /* synthesis SET_AS_NETWORK=clk_48mhz, is_clock=1 */ ;   // ../bootloader.v(22[8:17])
    
    SB_DFF in_q_7 (.Q(in_q), .C(clk_48mhz), .D(all_data_sent));   // ../../../common/edge_detect.v(8[10] 10[6])
    
endmodule
