(* open Str *)

let read_one_dir dir =
  let handle = Unix.opendir dir in
  let rec loop ((dirs, files) as acc) =
    try
      let item = Unix.readdir handle in
      match item with
      | "." | ".." ->
         loop acc
      | _ ->
         (
           let item_with_dir = Filename.concat dir item in
           match Sys.is_directory item_with_dir with
           | true ->
              loop (item_with_dir :: dirs, files)
           | false ->
              loop (dirs, item_with_dir :: files)
         )
    with End_of_file ->
      acc
  in
  loop ([], [])

let get_list_of_files directory =
  let dirs = [directory] in
  let files = [[]] in
  let acc = (dirs, files) in
  let rec loop acc =
    match acc with
    | ([], list_of_list_of_files) ->
       List.flatten list_of_list_of_files
    | (dir :: dirs, list_of_list_of_files) ->
       (
         let (new_dirs, new_files) = read_one_dir dir in
         let new_acc = (dirs @ new_dirs, new_files :: list_of_list_of_files ) in
         loop new_acc
       )
  in
  loop acc
  (* ["/tmp/f1.txt"; "/tmp/321.txt"; "652.txt"] *)

let get_base_name file =
  Filename.basename file

let file_matches file file_regex =
  let basename = get_base_name file in
  Str.string_match file_regex basename 0

let filter_matched_files files file_regex =
  List.filter (function x -> file_matches x file_regex) files

let print_one_file file n_lines =
  Printf.printf "%s %i\n" file n_lines

let print_files files n_lines =
  print_endline "The result:";
  List.iter (fun x -> print_one_file x n_lines) files;
  print_endline "end of result"

let process_dir directory n_lines file_match =
  let files = get_list_of_files directory in
  let file_regex = Str.regexp file_match in
  let matched_files = filter_matched_files files file_regex in
  print_files matched_files n_lines
