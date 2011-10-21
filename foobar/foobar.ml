open Sexplib
open Conv

type t = {
  a : int;
  b : string;
  } with sexp, fields

let _ =
  let foo = { a = 1; b="foo" } in
  let bar = { a = 2; b="bar" } in
  Printf.printf "foo=%s\n" (Sexp.to_string (sexp_of_t foo));
  Printf.printf "bar=%s\n" (Sexp.to_string (sexp_of_t bar));
