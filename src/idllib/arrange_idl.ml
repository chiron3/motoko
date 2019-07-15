open Source
open Syntax
open Wasm.Sexpr

let string_of_prim p =
  match p with
  | Nat -> "nat"
  | Nat8 -> "nat8"
  | Nat16 -> "nat16"
  | Nat32 -> "nat32"
  | Nat64 -> "nat64"
  | Int -> "int"
  | Int8 -> "int8"
  | Int16 -> "int16"
  | Int32 -> "int32"
  | Int64 -> "int64"
  | Float32 -> "float32"
  | Float64 -> "float64"
  | Bool -> "bool"
  | Text -> "text"
  | Null -> "null"
  | Reserved -> "reserved"          

let string_of_mode m =
  match m.it with
  | Oneway -> "oneway"
  | Pure -> "pure"
                 
let ($$) head inner = Node (head, inner)

and id i = Atom i.it
and tag i = Atom ("#" ^ i.it)

let field_tag (tf : typ_field)
  = tf.it.name.it ^ "(" ^ Lib.Uint32.to_string tf.it.id ^ ")"

let rec typ_field (tf : typ_field)
  = field_tag tf $$ [typ tf.it.typ]

and typ_meth (tb : typ_meth)
  = tb.it.var.it $$ [typ tb.it.meth]

and mode m = Atom (string_of_mode m)
  
and typ t = match t.it with
  | VarT s        -> "VarT" $$ [id s]
  | PrimT p             -> "PrimT" $$ [Atom (string_of_prim p)]
  | RecordT ts        -> "RecordT" $$ List.map typ_field ts
  | VecT t       -> "VecT" $$ [typ t]
  | OptT t              -> "OptT" $$ [typ t]
  | VariantT cts        -> "VariantT" $$ List.map typ_field cts
  | FuncT (ms, s, t) -> "FuncT" $$ List.map typ_field s @ List.map typ_field t @ List.map mode ms
  | ServT ts -> "ServT" $$ List.map typ_meth ts
  | PreT -> Atom "PreT"
                        
and dec d = match d.it with
  | TypD (x, t) ->
     "TypD" $$ [id x] @ [typ t]
  | ImportD (f, fp) ->
     "ImportD" $$ [Atom (if !fp = "" then f else !fp)]

and actor a = match a with
  | None -> Atom "NoActor"
  | Some {it=ActorD (x, t); _} -> 
     "ActorD" $$ id x :: [typ t]
    
and prog prog = "Decs" $$ List.map dec prog.it.decs @ [actor prog.it.actor]


(* Pretty printing  *)
              
open Printf
let string_of_list f sep list = String.concat sep (List.map f list)
         
let rec string_of_typ t =
  match t.it with
  | VarT id -> sprintf "var %s" id.it
  | PrimT s -> string_of_prim s
  | FuncT (ms,s,t) ->
     sprintf "(%s) -> (%s) %s" (string_of_list string_of_field ", " s) (string_of_list string_of_field ", " t) (string_of_list string_of_mode " " ms)
  | OptT t -> "opt " ^ string_of_typ t
  | VecT t -> "vec " ^ string_of_typ t
  | RecordT fs -> sprintf "{%s}" (string_of_list string_of_field "; " fs)
  | VariantT fs -> sprintf "variant {%s}" (string_of_list string_of_field "; " fs)
  | ServT ms -> sprintf "service {%s}" (string_of_list string_of_meth "; " ms)
  | PreT -> "Pre"

and string_of_field f =
  sprintf "%s : %s" f.it.name.it (string_of_typ f.it.typ)
and string_of_meth m =
  sprintf "%s : %s" m.it.var.it (string_of_typ m.it.meth)
