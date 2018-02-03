# Makefile borrowed from https://github.com/cliffordwolf/icestorm/blob/master/examples/icestick/Makefile
#
# The following license is from the icestorm project and specifically applies to this file only:
#
#  Permission to use, copy, modify, and/or distribute this software for any
#  purpose with or without fee is hereby granted, provided that the above
#  copyright notice and this permission notice appear in all copies.
#
#  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
#  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
#  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
#  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
#  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
#  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

PROJ = TinyFPGA_BX

PIN_DEF = pins.pcf
DEVICE = lp8k

all: $(PROJ).rpt $(PROJ).bin

%.blif: %.v *.v 
	yosys -p 'synth_ice40 -top $(PROJ) -blif $@' $^

%.asc: $(PIN_DEF) %.blif
	arachne-pnr -d 8k -P cm81 -o $@ -p $^

%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

%_tb: %_tb.v %.v
	iverilog -o $@ $^

%_tb.vcd: %_tb
	vvp -N $< +vcd=$@

%_syn.v: %.blif
	yosys -p 'read_blif -wideports $^; write_verilog $@'

%_syntb: %_tb.v %_syn.v
	iverilog -o $@ $^ `yosys-config --datdir/ice40/cells_sim.v`

%_syntb.vcd: %_syntb
	vvp -N $< +vcd=$@

prog: $(PROJ).bin
	iceprog $<

sudo-prog: $(PROJ).bin
	@echo 'Executing prog as root!!!'
	sudo iceprog $<

clean:
	rm -f $(PROJ).blif $(PROJ).asc $(PROJ).rpt $(PROJ).bin

.SECONDARY:
.PHONY: all prog clean
