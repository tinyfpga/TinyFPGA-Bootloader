#
# Bootloader for the ulx3s ECP5 board
# Builds with nextpnr-ecp5 and prjtrellis from git
#
IDCODE ?= 0x21111043 # 12f

all: bootloader.bit

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
