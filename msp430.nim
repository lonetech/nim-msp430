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

proc enable_interrupts*() {.header: "<intrinsics.h>", importc: "_EINT".}
proc disable_interrupts*() {.header: "<intrinsics.h>", importc: "_DINT".}

declGPIO(PA)
declGPIO(PJ)

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
