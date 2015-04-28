import msp430, unsigned, tables
# Encodings requires local OS support. So it must be spawned as
# a separate staticExec of a native program. Yay. 
#import encodings
#import marshal

{.pragma: usbram, codegenDecl: "$# __attribute__((section(\"usbram\"))) $#".}

type
  index = int8
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
    dtDevice = 1
    dtConfiguration = 2
    dtString = 3
    dtInterface = 4
    dtEndpoint = 5
    dtDeviceQualifier = 6
    dtOtherSpeedConfiguration = 7
    dtInterfacePower = 8
  UsbDeviceRequest* = tuple
    bmRequestType: uint8
    bRequest: uint8
    wValue: uint16
    wIndex: uint16
    wLength: uint16
  UsbDeviceDescriptor* = tuple
    bLength: uint8
    bDescriptorType: uint8
    bcdUSB: uint16
    bDeviceClass: uint8
    bDeviceSubClass: uint8
    bDeviceProtocol: uint8
    bMaxPacketSize0: uint8
    idVendor: uint16
    idProduct: uint16
    bcdDevice: uint16
    iManufacturer: index
    iProduct: index
    iSerialNumber: index
    bNumConfigurations: int8

var
  UsbSetupBlock {.extern:"USBSUBLK".} : UsbDeviceRequest
  ep0inbuf {.extern:"USBIEP0BUF".} : array[0..7, uint8]
  ep0outbuf {.extern:"USBOEP0BUF".} : array[0..7, uint8]
  #ep1buf {.usbram.} : array[0..7, int8] # = [1i8,2,3,4,5,6,7,8]
  newaddress : uint8 = 0x80

const
  serial = staticExec("./toutf16", "MSP430 Joystick")
  deviceDescriptor0 = (
    bLength: 18, bDescriptorType: dtDevice, bcdUSB: 0x0310,
    bDeviceClass: 0, bDeviceSubClass: 0, bDeviceProtocol: 0,
    bMaxPacketSize0: 8, idVendor: 0x16c0, idProduct: 0x27dc,  # V-USB HID Joystick, must set serial number text
    bcdDevice: 0, iManufacturer: 0, iProduct: 0, iSerialNumber: 0, bNumConfigurations: 0)
  descriptors = {(ord(dtDevice) shl 8) or 0: deviceDescriptor0,
                 #(ord(dtString) shl 8) or 0: serial,
                 }.toTable

ISR:
  proc USB_UBM() =
    if (USBIFG and SETUPIFG) != 0:      # Setup packet
      if UsbSetupBlock.bmRequestType shr 7 != 0:  # in/out direction bit
        USBCTL = USBCTL or DIR
      else:
        USBCTL = USBCTL and not cast[uint8](DIR)
      case UsbSetupBlock.bmRequestType
      of 0x80:   # standard device in
        case UsbSetupBlock.bRequest
        of ord(SetAddress):
          newaddress = UsbSetupBlock.wValue and 0xff
          UsbIepCnt0 = 0
        of ord(GetDescriptor):
          #let desc = ref descriptors[UsbSetupBlock.wValue]
          case UsbSetupBlock.wValue
          of 0x0100:   # device descriptor 0
            discard  # TODO: produce descriptor
          else: discard
        else: discard
      else: discard
      # Failure case: stall endpoint 0
      USBIEPCNF_0 = USBIEPCNF_0 or STALL
      USBOEPCNF_0 = USBOEPCNF_0 or STALL
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
      of USBVECINT_INPUT_ENDPOINT0:
        if (newaddress and 0x80) == 0:
          UsbFunAdr = newaddress
          newaddress = newaddress or 0x80
      of USBVECINT_OUTPUT_ENDPOINT0: discard
      #of USBVECINT_RSTR:  # reset - might want to auto-reset with FRSTE
      #of USBVECINT_SUSR:  # suspend
      #of USBVECINT_RESR:  # resume
      of USBVECINT_SETUP_PACKET_RECEIVED: discard # Setup transaction, handled above
      #of USBVECINT_STPOW_PACKET_RECEIVED: discard # should not happen, setup overwrite
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
  USBCTL = FEN or FRSTE
  USBIE = SETUPIE
  # Note: officially the resistor should not be enabled until PWR_VBUSOn
  UsbKeyID = 0    # Lock configuration registers

  # Clear endpoint 0 status
  USBIEPCNF_0 = UBME or USBIIE
  USBIEPCNT_0 = 0
  USBOEPCNF_0 = UBME or USBIIE
  USBOEPCNT_0 = 0
  # Enable interrupts for endpoint 0
  USBIEPIE = 1
  USBOEPIE = 1
