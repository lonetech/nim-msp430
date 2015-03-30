import msp430
import msp430usb

# Trivial blink demo for now.

template toggleLED() =
  PJ.OUT = PJ.OUT xor 8

proc main =
  PJ.DIR = PJ.DIR or 8
  while true:
    toggleLED()
    var i {.volatile.} = 0x7350  # volatile to keep delay loop
    while i!=0:
      i = i - 1

proc testvol =
  PA.OUT = 5
  PA.OUT = 5

main()
testvol()

# My first project is a PC joystick to USB adapter based on an
# Olimexino-5510 board (a MSP430 board resembling an Arduino Pro).
# Judging by the SW/HW I2C solder jumpers on the board, the
# designer was unaware that this chip can remap those functions. 
# I intend to measure the analog resistances by timing a capacitor
# charge, similar to the original card. Luckily the f5510 has
# more than four timer capture pins for this.
# I also intend to add a Gravis Grip decoder, for which the
# pin change interrupts will come in handy. 
# Pins connected on adapter board so far:
# 1,8,9,15  5v
# 4,5,12   gnd
# 7  b2   d3   ta0_0
# 6  y1   d4   ta0_1   needs capacitor
# 14 b3   d2   p1_0
# 13 y2   d5   ta0_2   needs capacitor
# 11 x2   d6   ta0_3   needs capacitor
# 3  x1   d7   ta0_4   needs capacitor
# pins yet to connect
# 2  b1   d8   p1_6
# 10 b4   d9   p1_7
