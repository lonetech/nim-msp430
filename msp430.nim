import macros, unsigned

const mcu="msp430f5510"
const msp430includes="/usr/msp430/include"
#const msp430includes=staticExec("msp430mcu-config --incpath"

{.passC: "-mmcu="&mcu.}
{.passL: "-mmcu="&mcu.}

macro importmsp430(header: static[string]): stmt =
  # We could use os.`/` but the target has no OS. 
  #discard staticExec("c2nim -o:"&header&".nim "&msp430includes&"/"&header&".h")
  # Rename __MSP430 macros and import iomacros
  #if header==mcu:
  #  discard staticExec("ed -s "&header&".nim < msp430_c2nim.ed")
  discard staticExec("make "&header&".nim")
  return parseStmt("include "&header)
importmsp430(mcu)

type
  GPIO = tuple
    IN:  uint16
    OUT: uint16
    DIR: uint16
    REN: uint16
    DS:  uint16
    SEL: uint16
    # Only port A (aka port 1 and 2) has interrupts
    padc, pade, pad10, pad12, pad14, pad16: uint16
    IES: uint16
    IE:  uint16
    IFG: uint16

proc `[]`*(word: uint16, bit: range[0..15]): range[0..1] =
  if (word and (1u16 shl bit))!=0: return 1
  else: return 0
template `[]=`*(word: var uint16, bit: range[0..15], value: range[0..1]) =
  let bitval : uint16 =  1 shl bit
  if value!=0:
    word = word or bitval
  else:
    word = word and not bitval

macro declGPIO(n: expr): stmt {.immediate.} =
  result = newNimNode(nnkStmtList)
  n.expectKind(nnkIdent)
  let name = $n.ident
  # Doing it this way sadly leaves parsing modules (parseutils, strutils,
  # macros) which have initializers in the runtime (empty, but each wastes
  # six words). But building the expression directly is awfully clumsy.
  # This makes me see more appeal to lisp. 
  result.add(parseStmt("template "&name&"*: expr = cast[ptr GPIO](addr "&name&"IN)"))

proc enable_interrupts*() {.header: "<intrinsics.h>", importc: "_EINT".}
proc disable_interrupts*() {.header: "<intrinsics.h>", importc: "_DINT".}

declGPIO(PA)
declGPIO(PB)
declGPIO(PC)
declGPIO(PJ)

template enableXT2*() =
  # TODO: Implement various possible values
  # Set XT2 parameters for 4MHz crystal
  UCSCTL6 = (UCSCTL6 and 0xffu16) or 0b00_0_0_000_0_00000000u16
  #          00  lowest drive strength for 4MHz crystal
  #             -  reserved
  #               0  not bypassed (enable osc amp)
  #                 ---  reserved
  #                     0  turn osc on (even if not used by UCS)
  #                       xxxxxxxx  don't touch XT1 settings
  # Map the pins to XT2
  PC_SEL = PC_SEL or 0b1100u16
  # We could wait for it to lock:
  when false:
    while UCSCTL7[3]:
      UCSCTL7[3]=0

template setPragma(node: stmt, name: string, value: string) =
  if node.pragma.kind==nnkEmpty:
    node.pragma=newNimNode(nnkPragma)
  node.pragma.add(newNimNode(nnkExprColonExpr)
                  .add(newIdentNode(name))
                  .add(newStrLitNode(value)))
template setPragma(node: stmt, name: string) =
  if node.pragma.kind==nnkEmpty:
    node.pragma=newNimNode(nnkPragma)
  node.pragma.add(newIdentNode(name))

macro ISR*(procs: stmt): stmt {.immediate.} =
  # Statement macro that modifies a proc to work as interrupt handler
  # The vectors are only resolved at C level, so this routine does not
  # need to know which exist. 
  let keeps = newNimNode(nnkStmtList)
  # TODO: parse the C header file to extract numbers like these
  for node in procs.children:
    node.expectKind(nnkProcDef)
    let name : string = $node.name.ident
    # Rename the ISR to not collide with C macros
    node.setPragma("exportc", "ISR_" & name)
    node.pragma.add(newNimNode(nnkExprColonExpr)
                    .add(newIdentNode("codegenDecl"))
                    .add(parseExpr("\"$# __attribute__((__interrupt__(\"& $"&name&"_VECTOR&\"))) $# $#\"")))
    keeps.add(newNimNode(nnkDiscardstmt).add(node.name))
  # discard statements are generated to keep the proc referenced
  # dead code elimination doesn't know of the ISR vector table
  return procs.add(keeps)

# Example usage
#ISR:
#  proc SYSNMI() =
#    return

# Disable watchdog timer
WDTCTL = 0x5a80
