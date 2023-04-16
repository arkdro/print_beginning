let get_args () =
  let usage_msg = "PROG [Directory] [-n Number_of_lines]" in
  let directory = ref "" in
  let n_lines = ref Defaults.default_n_lines_arg in
  let anon_fn in_dir = directory := in_dir in
  let speclist =
    [
      (* ("-d", Arg.Set_string dir, "Directory to scan"); *)
      ("-n", Arg.Set_int n_lines, "Number of lines to read");
    ] in
  let _ = Arg.parse speclist anon_fn usage_msg in
  (!directory, !n_lines)

