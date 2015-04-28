import encodings

proc main () =
  let orig = stdin.readAll()
  let result = convert(orig, "utf-16", "utf-8")
  stdout.write(result)

main ()
