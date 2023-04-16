open Files

let () =
  let (directory, n_lines, file_match, compact) = Args.get_args () in
  let _ = Dir_processor.process_dir directory n_lines file_match compact in
  ()
