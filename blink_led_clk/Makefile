# Define project-specific variables
PROJECTNAME=SOC
BOARD=VSDSquadronFM
BOARD_FREQ=12
CPU_FREQ=12
FPGA_VARIANT=up5k
FPGA_PACKAGE=sg48
VERILOGS= rgb_blink.v

#Uart Var	
PICO_DEVICE=/dev/ttyUSB0   # replace by the terminal used by your device
BAUDS=1000000


build:
	yosys -q -p "synth_ice40 -relut -top $(PROJECTNAME) -json $(PROJECTNAME).json" $(VERILOGS)
	nextpnr-ice40 --json $(PROJECTNAME).json --pcf $(BOARD).pcf --asc $(PROJECTNAME).asc --freq $(BOARD_FREQ) --$(FPGA_VARIANT) --package $(FPGA_PACKAGE) --pcf-allow-unconstrained
	# icetime -p $(BOARD).pcf -P $(FPGA_PACKAGE) -r $(PROJECTNAME).timings -d $(FPGA_VARIANT) -t $(PROJECTNAME).asc
	icepack $(PROJECTNAME).asc $(PROJECTNAME).bin

flash:
	iceprog $(PROJECTNAME).bin

clean:
	rm -rf *.blif *.asc *.bin *.json

terminal:
	sudo picocom -b $(BAUDS) $(PICO_DEVICE) --imap lfcrlf,crcrlf --omap delbs,crlf --send-cmd "ascii-xfr -s -l 30 -n"