let token lb =
  let tok = Lexer.token lb in
	(* Printf.printf "%s" (Lexer.token_to_string(tok)); *)
	tok

let main () =
  let filename = Sys.argv.(1) in 
  let is = open_in filename in 
  let lexer = Lexing.from_channel is in
  lexer.Lexing.lex_curr_p <-
    {lexer.Lexing.lex_curr_p with Lexing.pos_fname = filename};
  try
    let prog = Parser.prog token lexer in 
    Printf.printf "\nChecking %s:\n" filename;
    let ve, te, ke = Typing.check_prog prog in
    (* Type.Env.iter (fun v con -> Printf.printf "  type %s := %s\n" v (Con.to_string con)) te; *)
    Con.Env.iter (fun con k -> Printf.printf "  type %s %s\n" (Con.to_string con) (Type.string_of_kind k)) ke;
    Type.Env.iter (fun v (t, mut) -> Printf.printf "  %s : %s\n" v (Type.string_of_typ t)) ve;
    let context = Typing.adjoin_cons (Typing.adjoin_typs (Typing.adjoin_vals Typing.empty_context ve) te) ke in
    Printf.printf "\nInterpreting %s (tracing function calls):\n" filename;
    ignore (Interpret.interpret_prog prog (fun dyn_ve ->
			Printf.printf "\nFinal state %s:\n" filename;
			Type.Env.iter (fun v (t, mut) ->
				let w = Interpret.unrollV (Value.Env.find v dyn_ve) in
				let w =
          match mut with
					| Type.Const -> Value.as_val_bind w
					| Type.Mut -> !(Value.as_var_bind w)
				in Printf.printf "  %s = %s\n" v (Value.string_of_val context.cons t w)
      ) ve;
		  Value.unit
    ))
  with
  | Lexer.Error (r, m) ->
    let r = Source.string_of_region r in
    Printf.printf "%s: syntax error, %s\n" r m;
  | Parser.Error ->
    let r = Source.string_of_region (Lexer.region lexer) in
    Printf.printf " %s: syntax error\n" r;
  | Typing.TypeError (r, m)  -> 
    let r = Source.string_of_region r in
    Printf.printf "%s: type error, %s\n" r m;
  | Typing.KindError (r, m) ->
    let r = Source.string_of_region r in
    Printf.printf "%s: type error, %s\n" r m;
  | e ->
     let r = Source.string_of_region !Interpret.last_region in
     let context = !Interpret.last_context in
     let ve = context.Interpret.vals in
     Value.Env.iter (fun v w -> 
    	 Printf.printf "  %s = %s\n" v (Value.debug_string_of_recbind w)) ve;
     Printf.printf "%s: %s\n" r
       (match e with
       | Operator.Overflow -> "arithmetic overflow"
       | _ -> Printexc.to_string e);
     Printf.printf "%s" (Printexc.get_backtrace ())
  ;
  close_in is


let () = main ()
