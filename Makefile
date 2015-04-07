#MCU=msp430f5510
# MCU is now defined in msp403.nim

NIMFLAGS=-d:release --os:standalone --opt:size --gc:none --deadCodeElim:on
# avr is the closest cpu for the moment
NIMFLAGS+=--cpu:avr
# running one C compiler lets its errors show
NIMFLAGS+=--parallelBuild:1 --verbosity:1

%: %.nim panicoverride.nim
	nim c $(NIMFLAGS) $<

msp430f%.nim: /usr/msp430/include/msp430f%.h msp430_c2nim.ed
	c2nim -o:$@ $<
	ed -s $@ < msp430_c2nim.ed

blink: blink.nim msp430usb.nim msp430.nim

all: blink

# Uses python-msp430-tools
program: blink
	python -m msp430.bsl5.hid -e $^
