[ActiveSupport MAP]
Device = LFE5U-45F;
Package = CSFBGA285;
Performance = 6;
LUTS_avail = 43848;
LUTS_used = 1189;
FF_avail = 43966;
FF_used = 497;
INPUT_LVCMOS33 = 2;
OUTPUT_LVCMOS33 = 7;
BIDI_LVCMOS33 = 2;
IO_avail = 118;
IO_used = 11;
EBR_avail = 108;
EBR_used = 0;
;
; start of DSP statistics
MULT18X18D = 0;
MULT9X9D = 0;
ALU54B = 0;
ALU24B = 0;
PRADD18A = 0;
PRADD9A = 0;
DSP_MULT_avail = 144;
DSP_MULT_used = 0;
DSP_ALU_avail = 72;
DSP_ALU_used = 0;
DSP_PRADD_avail = 144;
DSP_PRADD_used = 0;
; end of DSP statistics
;
; Begin PLL Section
Instance_Name = usb_pll_inst_inst/PLLInst_0;
Type = EHXPLLL;
CLKOP_Post_Divider_A_Input = DIVA;
CLKOS_Post_Divider_B_Input = DIVB;
CLKOS2_Post_Divider_C_Input = DIVC;
CLKOS3_Post_Divider_D_Input = DIVD;
FB_MODE = CLKOP;
CLKI_Divider = 1;
CLKFB_Divider = 3;
CLKOP_Divider = 12;
CLKOS_Divider = 1;
CLKOS2_Divider = 1;
CLKOS3_Divider = 1;
CLKOP_Desired_Phase_Shift(degree) = 0;
CLKOP_Trim_Option_Rising/Falling = FALLING;
CLKOP_Trim_Option_Delay = 0;
CLKOS_Desired_Phase_Shift(degree) = 0;
CLKOS_Trim_Option_Rising/Falling = FALLING;
CLKOS_Trim_Option_Delay = 0;
CLKOS2_Desired_Phase_Shift(degree) = 0;
CLKOS3_Desired_Phase_Shift(degree) = 0;
; End PLL Section
