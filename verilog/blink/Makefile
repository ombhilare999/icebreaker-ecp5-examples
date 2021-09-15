PROJ=blink

all: ${PROJ}.bit

%.json: %.v
	yosys -p "synth_ecp5 -json $@" $<

%_out.config: %.json
	nextpnr-ecp5 --json $< --textcfg $@ --12k --package CABGA256 --lpf ${PROJ}.pcf

%.bit: %_out.config
	ecppack --compress $< $@

prog: ${PROJ}.bit
	ecpprog -S ${PROJ}.bit

flash: ${PROJ}.bit
	ecpprog ${PROJ}.bit

clean:
	$(RM) -f ${PROJ}.bit ${PROJ}_out.config ${PROJ}.json 

.PHONY: prog clean
