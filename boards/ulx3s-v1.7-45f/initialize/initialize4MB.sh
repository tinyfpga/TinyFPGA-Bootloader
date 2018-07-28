#!/bin/sh -e

# Initializer for ECP5 dual boot.

# first half of the FLASH is for user bitstram
# bootloader bitstream starts at second half of the FLASH
# board metadata at last 0x1000 bytes
# Jump command at last 0x100 bytes

# flash size:  16 Mbit =  2 MB =  0x200000
# flash size:  32 Mbit =  4 MB =  0x400000
# flash size:  64 Mbit =  8 MB =  0x800000
# flash size: 128 Mbit = 16 MB = 0x1000000
 
bootloader_image_address=$(printf "%d" 0x000000) # 0
golden_image_address=$(printf "%d" 0x100000) # 0x100000 (1MB) (backup of bootloader)
board_meta_address=$(printf "%d" 0x3FF000)   # flash size - 0x1000
jump_command_address=$(printf "%d" 0x3FFF00) # flash size - 0x100

tinyprog -a $bootloader_image_address -u ../../boards/ulx3s-v1.7-45f/tinyfpga_45k.bit
tinyprog -a $golden_image_address -u ../../boards/ulx3s-v1.7-45f/tinyfpga_45k.bit
tinyprog -a $(printf "%d" $board_meta_address) -u boardmeta4MB.bin
./jump.py $golden_image_address > jump.bin
tinyprog -a $(printf "%d" $jump_command_address) -u jump.bin
# hexdump -C jump.bin
# check that's board is recognized by tingprog
tinyprog -l
#tinyprog -m
