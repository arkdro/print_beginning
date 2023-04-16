open Files

let () =
  let _ = Line_processor.read_lines "/tmp/f1.txt" in
  print_endline "\nHello, World!"
