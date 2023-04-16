let get_args () =
  let usage_msg = "PROG [options] [DIR] - search the directory for files " ^
                    "using match, print several beginning lines for the files" in
  let directory = ref Defaults.default_directory in
  let n_lines = ref Defaults.default_n_lines_arg in
  let file_match = ref Defaults.default_file_match in
  let compact = ref Defaults.default_compact in
  let anon_fn in_dir = directory := in_dir in
  let speclist =
    [
      ("-c", Arg.Set compact, "Compact - no newline after every file");
      ("-n", Arg.Set_int n_lines, "Number of lines to read");
      ("-m", Arg.Set_string file_match, "File regex match, e.g. [0-9]*\\.txt.*");
    ] in
  let _ = Arg.parse speclist anon_fn usage_msg in
  (!directory, !n_lines, !file_match, !compact)
