#!/bin/sh -e
# -a n*1024*1024-4*1024
# this doesn't work
tinyprog -a $(printf "%d" 0x3FF000) -u boardmeta.bin
tinyprog -a $(printf "%d" 0x140000) -u ../../boards/ulx3s-v1.7-45f/tinyfpga_45k.bit
./jump.py > jump.bin
tinyprog -a $(printf "%d" 0x3FFF00) -u jump.bin
hexdump -C jump.bin
