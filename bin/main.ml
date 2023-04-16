open Files

let () =
  let (directory, n_lines) = Args.get_args () in
  let _ = Dir_processor.process_dir directory n_lines in
  let lines = Line_processor.read_lines "/tmp/f1.txt" in
  let line = String.concat "\n" lines in
  print_endline "The args:";
  print_endline directory;
  print_endline (Printf.sprintf "%i" n_lines);
  print_endline "The lines:";
  print_endline line
