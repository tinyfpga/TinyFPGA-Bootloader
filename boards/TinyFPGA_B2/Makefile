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

PROJ = bootloader
OUTDIR = build

PIN_DEF = pins.pcf
DEVICE = lp8k
PKG = cm81

all: $(OUTDIR)/fw.bin

$(OUTDIR)/fw.bin: $(OUTDIR)/$(PROJ).img
	cp $< $@

$(OUTDIR)/$(PROJ).blif $(OUTDIR)/$(PROJ).yosys.json $(OUTDIR)/$(PROJ).synthesis.rpt: $(PROJ).v ../../common/*.v
$(OUTDIR)/$(PROJ).asc: $(PIN_DEF)
$(OUTDIR)/$(PROJ).nextpnr.asc: $(PIN_DEF)

$(OUTDIR)/bootmeta.json:
	@mkdir -p $(@D)
	echo '{' > $@
	echo '  "bootloader": "TinyFPGA USB Bootloader",' >> $@
	echo '  "bver": "$(shell git describe --tags || echo "Unknown")",' >> $@
	echo '  "addrmap": {' >> $@
	echo '    "bootloader": "0x00000-0x27FFF",' >> $@
	echo '    "userimage":  "0x28000-0x4FFFF",' >> $@
	echo '    "userdata":   "0x50000-0x7EFFF",' >> $@
	echo '    "bootmeta":   "0x7F000-0x7FFFF"' >> $@
	echo '  }' >> $@
	echo '}' >> $@

%.img: %.bin %.rpt $(OUTDIR)/bootmeta.json
	@mkdir -p $(@D)
	cp $< $(patsubst %.bin,%_0.bin,$<)
	cp $< $(patsubst %.bin,%_1.bin,$<)
	icemulti -v -o $@ -a15 -p0 $(patsubst %.bin,%_0.bin,$<) $(patsubst %.bin,%_1.bin,$<)
	truncate -s 512K $@
	dd if=$(OUTDIR)/bootmeta.json of=$@ bs=1 seek=508K conv=notrunc

%.blif %.yosys.json %.synthesis.rpt:
	@mkdir -p $(@D)
	yosys -q -l $*.synthesis.rpt -p 'synth_ice40 -top $(PROJ) -blif $*.blif -json $*.yosys.json' $^

%.asc: %.blif
	@mkdir -p $(@D)
	arachne-pnr -d 8k -P $(PKG) -o $@ -p $(filter %.pcf,$^) $(filter %.blif,$^)

%.nextpnr.asc: %.yosys.json
	@mkdir -p $(@D)
	nextpnr-ice40 --$(DEVICE) --package $(PKG) --json $(filter %.yosys.json,$^) --pcf $(filter %.pcf,$^) --asc $@

%.bin: %.asc
	@mkdir -p $(@D)
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

%_syn.v: %.blif
	yosys -p 'read_blif -wideports $^; write_verilog $@'

clean:
	[ -z "$(OUTDIR)" ] || rm -rf $(OUTDIR)/

.SECONDARY:
.PHONY: all clean
