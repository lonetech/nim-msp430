import msp430, unsigned

{.pragma: usbram, codegenDecl: "$# __attribute__((section(\"usbram\"))) $#".}

type
  Request* = enum
    GetStatus = 0
    ClearFeature = 1
    SetFeature = 3
    SetAddress = 5
    GetDescriptor = 6
    SetDescriptor = 7
    GetConfiguration = 8
    SetConfiguration = 9
    GetInterface = 10
    SetInterface = 11
    SynchFrame = 12
  DescriptorType* = enum
    Device = 1
    Configuration = 2
    String = 3
    Interface = 4
    Endpoint = 5
    DeviceQualifier = 6
    OtherSpeedConfiguration = 7
    InterfacePower = 8
  UsbDeviceRequest* = tuple
    bmRequestType: uint8
    bRequest: uint8
    wValue: uint16
    wIndex: uint16
    wLength: uint16

#var
#  ep0buf {.usbram.} : array[0..7, int8] # = [1i8,2,3,4,5,6,7,8]

ISR:
  proc USB_UBM() =
    while true:
      # computedGoto does not seem to understand the values are all even
      # {.computedGoto.}
      case USBVECINT
      of USBVECINT_NONE: return
      #of USBVECINT_PWR_DROP:
      #of USBVECINT_PLL_LOCK:
      #of USBVECINT_PLL_SIGNAL:
      #of USBVECINT_PLL_RANGE:
      #of USBVECINT_PWR_VBUSOn:
      #of USBVECINT_PWR_VBUSOff:
      #of USBVECINT_USB_TIMESTAMP:
      of USBVECINT_INPUT_ENDPOINT0: discard
      of USBVECINT_OUTPUT_ENDPOINT0: discard
      #of USBVECINT_RSTR:  # reset - might want to auto-reset with FRSTE
      #of USBVECINT_SUSR:  # suspend
      #of USBVECINT_RESR:  # resume
      of USBVECINT_SETUP_PACKET_RECEIVED: discard
      of USBVECINT_STPOW_PACKET_RECEIVED: discard
      #of USBVECINT_INPUT_ENDPOINT1:
      #of USBVECINT_INPUT_ENDPOINT2:
      #of USBVECINT_INPUT_ENDPOINT3:
      #of USBVECINT_INPUT_ENDPOINT4:
      #of USBVECINT_INPUT_ENDPOINT5:
      #of USBVECINT_INPUT_ENDPOINT6:
      #of USBVECINT_INPUT_ENDPOINT7:
      #of USBVECINT_OUTPUT_ENDPOINT1:
      #of USBVECINT_OUTPUT_ENDPOINT2:
      #of USBVECINT_OUTPUT_ENDPOINT3:
      #of USBVECINT_OUTPUT_ENDPOINT4:
      #of USBVECINT_OUTPUT_ENDPOINT5:
      #of USBVECINT_OUTPUT_ENDPOINT6:
      #of USBVECINT_OUTPUT_ENDPOINT7:
      else: discard

proc usbinit*() =
  # Raise operating voltage to levels that permit USB
  setVCoreUp 1
  setVCoreUp 2
  setVCoreUp 3

  # Enable XT2 oscillator
  enableXT2()
  # Or USBKEYPID if you believe the manual.
  UsbKeyID = cast[uint16](USBKEY)    # enable USB configuration
  # Configure USB PLL
  # TODO: wait 2ms for capacitors to charge?
  UsbPllCtl = cast[uint16](UPLLEN or UPFDEN)
  UsbPllDivB = cast[uint16](UsbPll_setClk_val_4p0)
  UsbPhyCtl = PUSEL   # enable USB function of USB phy
  # TODO: Wait 2ms and check PLL lock?
  # Enable USB module and pull up resistor
  USBCNF = USBCNF or cast[uint16](PUR_EN or USB_EN)
  # Note: officially the resistor should not be enabled until PWR_VBUSOn
  UsbKeyID = 0    # Lock configuration registers

