open Files

let () =
  let lines = Line_processor.read_lines "/tmp/f1.txt" in
  let line = String.concat "\n" lines in
  print_endline "\nHello, World!";
  print_endline line
