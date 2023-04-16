let default_max_lines = 5

let read_one_line fd = input_line fd

let read_lines filename max_lines =
  let f = open_in filename in
  let rec loop counter max_lines =
    try
      let next = input_line f in
      next :: loop (counter+1) max_lines
    with End_of_file ->
      close_in f;
      []
  in
  loop 0 max_lines

let read_lines filename =
  read_lines filename default_max_lines
