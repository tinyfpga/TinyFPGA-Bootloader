#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/launch_synplify.tcl
#-- Written on Mon Mar  5 23:49:33 2018

project -close
set filename "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/impl_syn.prj"
if ([file exists "$filename"]) {
	project -load "$filename"
	project_file -remove *
} else {
	project -new "$filename"
}
set create_new 0

#device options
set_option -technology ECP5U
set_option -part LFE5U_25F
set_option -package MG285C
set_option -speed_grade -6

if {$create_new == 1} {
#-- add synthesis options
	set_option -symbolic_fsm_compiler true
	set_option -resource_sharing true
	set_option -vlog_std v2001
	set_option -frequency auto
	set_option -maxfan 1000
	set_option -auto_constrain_io 0
	set_option -disable_io_insertion false
	set_option -retiming false; set_option -pipe true
	set_option -force_gsr false
	set_option -compiler_compatible 0
	set_option -dup false
	
	set_option -default_enum_encoding default
	
	
	
	set_option -write_apr_constraint 1
	set_option -fix_gated_and_generated_clocks 1
	set_option -update_models_cp 0
	set_option -resolve_multiple_driver 0
	
	
}
#-- add_file options
set_option -include_path "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/bootloader.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/edge_detect.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/tinyfpga_bootloader.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_in_arb.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_in_pe.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_out_arb.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_out_pe.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_pe.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_rx.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_tx.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_tx_mux.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_reset_det.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_serial_ctrl_ep.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_spi_bridge_ep.v"
add_file -verilog "C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/source/usb_pll_inst.v"
#-- top module name
set_option -top_module {TinyFPGA_EX}
project -result_file {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/impl.edi}
project -save "$filename"
