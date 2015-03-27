import macros

const mcu="msp430f5510"

{.passC: "-mmcu="&mcu.}
{.passL: "-mmcu="&mcu.}

type
  GPIO = tuple
    IN:  int16
    OUT: int16
    DIR: int16
    REN: int16
    DS:  int16
    SEL: int16
    # Only port A (aka port 1 and 2) has interrupts
    padc, pade, pad10, pad12, pad14, pad16: int16
    IES: int16
    IE:  int16
    IFG: int16

# Some sugar to do bit twiddling
proc `[]`*(word: int16, bit: range[0..15]): range[0..1] =
  if (word and (1 shl bit))!=0: return 1
  else: return 0
template `[]=`*(word: var int16, bit: range[0..15], value: range[0..1]) =
  let bitval : int16 =  1 shl bit
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
  result.add(parseStmt("var "&name&"IN {.header: \"<msp430.h>\", importc.} : int16"),
             parseStmt("template "&name&"*: expr = cast[ptr GPIO](addr "&name&"IN)"))

var
  WDTCTL* {.header: "<msp430.h>", importc.} : int16
  P1IV* {.header: "<msp430.h>", importc.} : int16
  P2IV* {.header: "<msp430.h>", importc.} : int16
  PMMCTL0_H {.header: "<msp430.h>", importc.} : uint8
  PMMCTL0_L {.header: "<msp430.h>", importc.} : int8
  PMMIFG {.header: "<msp430.h>", importc.} : int16
  SVSMHCTL {.header: "<msp430.h>", importc.} : int16
  SVSMLCTL {.header: "<msp430.h>", importc.} : int16
#const
  SVSMHDLYIFG {.header: "<msp430.h>", importc.} : int16
  SVSMLDLYIFG {.header: "<msp430.h>", importc.} : int16
  SVMLVLRIFG {.header: "<msp430.h>", importc.} : int16
  SVMLIFG {.header: "<msp430.h>", importc.} : int16
  SVSHE {.header: "<msp430.h>", importc.} : int16
  SVSHRVL0 {.header: "<msp430.h>", importc.} : int16
  SVMHE {.header: "<msp430.h>", importc.} : int16
  SVSMHRRL0 {.header: "<msp430.h>", importc.} : int16
  SVSLE {.header: "<msp430.h>", importc.} : int16
  SVMLE {.header: "<msp430.h>", importc.} : int16
  SVSMLRRL0 {.header: "<msp430.h>", importc.} : int16
  PMMCOREV0 {.header: "<msp430.h>", importc.} : int8
  SVSLRVL0 {.header: "<msp430.h>", importc.} : int16


proc enable_interrupts*() {.header: "<intrinsics.h>", importc: "_EINT".}
proc disable_interrupts*() {.header: "<intrinsics.h>", importc: "_DINT".}

declGPIO(PA)
declGPIO(PJ)


proc setVCoreUp*(level: range[0..3]) =
  ## Set core voltage level - only shift one level at a time!
  # Open PMM registers for write access
  PMMCTL0_H = 0xa5
  # Make sure no flags are set for iterative sequences
  while (PMMIFG and (SVSMHDLYIFG or SVSMLDLYIFG)) != 0: continue
  # Set SVS/SVM high side new level
  SVSMHCTL = SVSHE or SVSHRVL0 * level or SVMHE or SVSMHRRL0 * level
  # Set SVM low side to new level
  SVSMLCTL = SVSLE or SVMLE or SVSMLRRL0 * level
  # Wait till SVM is settled
  while (PMMIFG and SVSMLDLYIFG) == 0: continue
  # Clear already set flags
  PMMIFG = PMMIFG and not (SVMLVLRIFG or SVMLIFG)
  # Set VCore to new level
  PMMCTL0_L = PMMCOREV0 * level
  # Wait till new level reached
  if (PMMIFG and SVMLIFG) != 0:
    while (PMMIFG and SVMLVLRIFG) == 0: continue
  # Set SVS/SVM low side to new level
  SVSMLCTL = SVSLE or SVSLRVL0 * level or SVMLE or SVSMLRRL0 * level
  # Lock PMM registers for write access
  PMMCTL0_H = 0x00


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
  ## Statement macro that modifies a proc to work as interrupt handler
  # The vectors are only resolved at C level, so this routine does not
  # need to know which exist. 
  let keeps = newNimNode(nnkStmtList)
  # TODO: parse the C header file to extract numbers like these
  for node in procs.children:
    node.expectKind(nnkProcDef)
    let name : string = $node.name.ident
    node.setPragma("codegenDecl", "$# __attribute__((__interrupt__("&name&"_VECTOR))) $# $#")
    node.setPragma("exportc", "ISR_" & name)
    keeps.add(newNimNode(nnkDiscardstmt).add(node.name))
  # discard statements are generated to keep the proc referenced
  # dead code elimination doesn't know of the ISR vector table
  result = procs.add(keeps)

# Example usage
#ISR:
#  proc SYSNMI() =
#    return

# Disable watchdog timer
WDTCTL = 0x5a80
