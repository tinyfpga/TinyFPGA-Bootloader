#
# Bootloader for the ulx3s ECP5 board
# Builds with nextpnr-ecp5 and prjtrellis from git as of 2019-07-05
#
IDCODE ?= 0x21111043 # 12f

all: fw.bin

flash: fw.bin bootloader.bit
	@echo "-- Plug in both USB ports on the ecp5 --"
	ujprog bootloader.bit
	sleep 2
	tinyprog -a 1 --security boardmeta.json
	tinyprog -a 2 --security bootmeta.json
	tinyprog -a 0 --program-image fw.bin
	sleep 5
	tinyprog -m

fw.bin: bootloader.bit
	ecpmulti \
		--input-idcode 0x41111043 \
		--output-idcode $(IDCODE) \
		-v \
		--output $@ \
		--flashsize 128 \
		--input $< \
		--address 0x100000 \
		--input $<


%.json: %.v
	yosys \
		-p "read_verilog -I../../common $<" \
		-p "synth_ecp5 -json $@" \
		-E .$(basename $@).d \
		-q \

%.config: %.json
	nextpnr-ecp5 \
		--json $< \
		--textcfg $@ \
		--lpf ulx3s_v20.lpf \
		--timing-allow-fail \
		--25k

%.bit: %.config
	ecppack --idcode $(IDCODE) $< $@

%.svf: %.config
	ecppack --idcode $(IDCODE) --input $< --svf $@

%.flash: %.bit
	ujprog $<
%.terminal: %.bit
	ujprog -t -b 3000000 $<

clean:
	$(RM) *.config *.bit .*.d *.svf
-include .*.d
