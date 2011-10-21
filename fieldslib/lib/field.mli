(******************************************************************************
 *                             Fieldslib                                      *
 *                                                                            *
 * Copyright (C) 2008- Jane Street Holding, LLC                               *
 *    Contact: opensource@janestreet.com                                      *
 *    WWW: http://www.janestreet.com/ocaml                                    *
 *                                                                            *
 *                                                                            *
 * This library is free software; you can redistribute it and/or              *
 * modify it under the terms of the GNU Lesser General Public                 *
 * License as published by the Free Software Foundation; either               *
 * version 2 of the License, or (at your option) any later version.           *
 *                                                                            *
 * This library is distributed in the hope that it will be useful,            *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of             *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU          *
 * Lesser General Public License for more details.                            *
 *                                                                            *
 * You should have received a copy of the GNU Lesser General Public           *
 * License along with this library; if not, write to the Free Software        *
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA  *
 *                                                                            *
 ******************************************************************************)

(** OCaml record field. *)

(* ['record] is the type of the record.  ['field] is the type of the
   values stored in the record field with name [name]. *)
type ('record, 'field) t = {
  name : string;
  setter : ('record -> 'field -> unit) option;
  getter : ('record -> 'field);
  fset   : ('record -> 'field -> 'record);
}

val name : (_, _) t -> string
val get  : ('r, 'a) t -> 'r -> 'a
val fset : ('r, 'a) t -> 'r -> 'a -> 'r
val setter : ('r, 'a) t -> ('r -> 'a -> unit) option

type ('record,'result) user =
    {f : 'field. ('record,'field) t -> 'result}
