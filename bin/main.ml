open Files

let () =
  let lines = Line_processor.read_lines "/tmp/f1.txt" in
  let line = String.concat "\n" lines in
  print_endline "The lines:";
  print_endline line
