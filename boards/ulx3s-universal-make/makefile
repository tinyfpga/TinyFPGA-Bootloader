# ******* project, board and chip name *******
PROJECT = ulx3s_bootloader
BOARD = ulx3s
# 12 25 45 85
FPGA_SIZE = 25

FPGA_PACKAGE = 6bg381c
# config flash: 1:SPI (standard), 4:QSPI (quad)
FLASH_SPI = 4
# chip: is25lp032d is25lp128f s25fl164k
FLASH_CHIP = is25lp128f

# ******* if programming with OpenOCD *******
# using local latest openocd until in linux distribution
OPENOCD=openocd_ft232r
# default onboard usb-jtag
OPENOCD_INTERFACE=$(SCRIPTS)/ft231x.ocd
# ulx3s-jtag-passthru
#OPENOCD_INTERFACE=$(SCRIPTS)/ft231x2.ocd
# ulx2s
#OPENOCD_INTERFACE=$(SCRIPTS)/ft232r.ocd
# external jtag
#OPENOCD_INTERFACE=$(SCRIPTS)/ft2232.ocd

# ******* design files *******
CONSTRAINTS = constraints/ulx3s_v20.lpf
TOP_MODULE = bootloader_sp_ulx3s
TOP_MODULE_FILE = top/$(TOP_MODULE).v

VERILOG_FILES = \
  $(TOP_MODULE_FILE) \
  clocks/clk_25M_200M.v \
  clocks/clk_200M_48M.v \
  ../../common/tinyfpgasp_bootloader.v \
  ../../common/edge_detect.v \
  ../../common/usb_fs_in_arb.v \
  ../../common/usb_fs_in_pe.v \
  ../../common/usb_fs_out_arb.v \
  ../../common/usb_fs_out_pe.v \
  ../../common/usb_fs_pe.v \
  ../../common/usb_fs_rx.v \
  ../../common/usb_fs_tx_mux.v \
  ../../common/usb_fs_tx.v \
  ../../common/usb_reset_det.v \
  ../../common/usb_sp_ctrl_ep.v
  

# *.vhd those files will be converted to *.v files with vhdl2vl (warning overwriting/deleting)
VHDL_FILES = 

# synthesis options
#YOSYS_OPTIONS = -noccu2

SCRIPTS = scripts
TRELLIS = /mt/scratch/tmp/openfpga/multiboot/prjtrellis/
include $(SCRIPTS)/ulx3s_diamond.mk

#include $(SCRIPTS)/ulx3s_trellis.mk

