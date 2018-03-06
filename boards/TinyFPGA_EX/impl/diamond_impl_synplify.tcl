#-- Lattice Semiconductor Corporation Ltd.
#-- Synplify OEM project file

#device options
set_option -technology ECP5U
set_option -part LFE5U_45F
set_option -package MG285C
set_option -speed_grade -6

#compilation/mapping options
set_option -symbolic_fsm_compiler true
set_option -resource_sharing true

#use verilog 2001 standard option
set_option -vlog_std v2001

#map options
set_option -frequency auto
set_option -maxfan 1000
set_option -auto_constrain_io 0
set_option -disable_io_insertion false
set_option -retiming false; set_option -pipe true
set_option -force_gsr false
set_option -compiler_compatible 0
set_option -dup false

set_option -default_enum_encoding default

#simulation options


#timing analysis options



#automatic place and route (vendor) options
set_option -write_apr_constraint 1

#synplifyPro options
set_option -fix_gated_and_generated_clocks 1
set_option -update_models_cp 0
set_option -resolve_multiple_driver 0


#-- add_file options
set_option -include_path {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/bootloader.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/edge_detect.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/tinyfpga_bootloader.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_in_arb.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_in_pe.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_out_arb.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_out_pe.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_pe.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_rx.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_tx.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_fs_tx_mux.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_reset_det.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_serial_ctrl_ep.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/common/usb_spi_bridge_ep.v}
add_file -verilog {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/source/usb_pll_inst.v}

#-- top module name
set_option -top_module TinyFPGA_EX

#-- set result format/file last
project -result_file {C:/Users/lvale/Documents/TinyFPGA/repos/TinyFPGA-Bootloader/boards/TinyFPGA_EX/impl/diamond_impl.edi}

#-- error message log file
project -log_file {diamond_impl.srf}

#-- set any command lines input by customer


#-- run Synplify with 'arrange HDL file'
project -run
