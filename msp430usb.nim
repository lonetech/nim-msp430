import msp430


type
  USBVECINT_value = enum
    NONE                   = 0x00
    PWR_DROP               = 0x02
    PLL_LOCK               = 0x04
    PLL_SIGNAL             = 0x06
    PLL_RANGE              = 0x08
    PWR_VBUSOn             = 0x0A
    PWR_VBUSOff            = 0x0C
    USB_TIMESTAMP          = 0x10
    INPUT_ENDPOINT0        = 0x12
    OUTPUT_ENDPOINT0       = 0x14
    RSTR                   = 0x16
    SUSR                   = 0x18
    RESR                   = 0x1A
    SETUP_PACKET_RECEIVED  = 0x20
    STPOW_PACKET_RECEIVED  = 0x22
    INPUT_ENDPOINT1        = 0x24
    INPUT_ENDPOINT2        = 0x26
    INPUT_ENDPOINT3        = 0x28
    INPUT_ENDPOINT4        = 0x2A
    INPUT_ENDPOINT5        = 0x2C
    INPUT_ENDPOINT6        = 0x2E
    INPUT_ENDPOINT7        = 0x30
    OUTPUT_ENDPOINT1       = 0x32
    OUTPUT_ENDPOINT2       = 0x34
    OUTPUT_ENDPOINT3       = 0x36
    OUTPUT_ENDPOINT4       = 0x38
    OUTPUT_ENDPOINT5       = 0x3A
    OUTPUT_ENDPOINT6       = 0x3C
    OUTPUT_ENDPOINT7       = 0x3E

var
  USBVECINT* {.header: "<msp430.h>", importc.} : USBVECINT_value

ISR:
  proc USB_UBM() =
    while true:
      # computedGoto does not seem to understand the values are all even
      # {.computedGoto.}
      case USBVECINT
      of NONE:
        return
      of PWR_DROP:
        PA.OUT = 4
      of PLL_LOCK:
        PA.OUT = 5
      of PLL_SIGNAL:
        PA.OUT = 6
      of PLL_RANGE:
        PA.OUT = 7
      of PWR_VBUSOn:
        PA.OUT = 1
      of PWR_VBUSOff:
        PA.OUT = 2
      of USB_TIMESTAMP:
        PA.OUT = 8
      of INPUT_ENDPOINT0:
        PA.OUT = 9
      of OUTPUT_ENDPOINT0:
        PA.OUT = 9
      of RSTR:
        PA.OUT = 9
      of SUSR:
        PA.OUT = 9
      of RESR:
        PA.OUT = 9
      of SETUP_PACKET_RECEIVED:
        PA.OUT = 9
      of STPOW_PACKET_RECEIVED:
        PA.OUT = 9
      of INPUT_ENDPOINT1:
        PA.OUT = 9
      of INPUT_ENDPOINT2:
        PA.OUT = 9
      of INPUT_ENDPOINT3:
        PA.OUT = 9
      of INPUT_ENDPOINT4:
        PA.OUT = 9
      of INPUT_ENDPOINT5:
        PA.OUT = 9
      of INPUT_ENDPOINT6:
        PA.OUT = 9
      of INPUT_ENDPOINT7:
        PA.OUT = 9
      of OUTPUT_ENDPOINT1:
        PA.OUT = 9
      of OUTPUT_ENDPOINT2:
        PA.OUT = 9
      of OUTPUT_ENDPOINT3:
        PA.OUT = 9
      of OUTPUT_ENDPOINT4:
        PA.OUT = 9
      of OUTPUT_ENDPOINT5:
        PA.OUT = 9
      of OUTPUT_ENDPOINT6:
        PA.OUT = 9
      of OUTPUT_ENDPOINT7:
        PA.OUT = 9

proc usbinit*():
  # Enable XT2 oscillator
  enableXT2()
