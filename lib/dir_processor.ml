(* open Str *)

let get_list_of_files directory =
  ["/tmp/f1.txt"; "/tmp/321.txt"; "652.txt"]

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
