import macros

macro sfrb*(nam: expr, loc: int16): stmt {.immediate.} =
  result = newNimNode(nnkStmtList)
  nam.expectKind(nnkIdent)
  let name = $nam.ident
  result.add(parseStmt("template "&name&"*: expr = cast[ptr uint8]("&loc.repr&")[]"))

macro sfrw*(nam: expr, loc: int16): stmt {.immediate.} =
  result = newNimNode(nnkStmtList)
  nam.expectKind(nnkIdent)
  let name = $nam.ident
  result.add(parseStmt("template "&name&"*: expr = cast[ptr uint16]("&loc.repr&")[]"))

# Note: may have to be redefined on 20-bit msp430s
macro sfra*(nam: expr, loc: int16): stmt {.immediate.} =
  result = newNimNode(nnkStmtList)
  nam.expectKind(nnkIdent)
  let name = $nam.ident
  result.add(parseStmt("template "&name&"*: expr = cast[ptr void]("&loc.repr&")[]"))

## TODO: patch in volatile in appropriate places
## TODO: make const registers const
template const_sfrb*(nam,loc) = sfrb(nam,loc)
template const_sfrw*(nam,loc) = sfrw(nam,loc)
template const_sfra*(nam,loc) = sfra(nam,loc)
