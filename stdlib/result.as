let P = (import "prelude.as");

/**

 Result
 =========

 The result of a computation that may contain errors, exceptions, etc.
 
 ActorScript does not have exceptions, so we use a datatype to encode these outcomes.

 Rust does something analogous, for the same reason.  We use the Rust nomenclature for the datatype and its constructors.
 
 */

type Result<Ok,Err> = {
  #ok:Ok;
  #err:Err;
};



/**
 `assertUnwrap`
 ---------------
 assert that we can unwrap the result; should only be used in tests, not in canister implementations. This will trap.
*/
func assertUnwrap<Ok,Error>(r:Result<Ok,Error>):Ok {
  switch(r) {
    case (#err e) P.unreachable();
    case (#ok r) r;
  }
};

/**
 `assertUnwrapAny`
 ---------------
 */
func assertUnwrapAny<Ok>(r:Result<Ok,Any>):Ok {
  switch(r) {
    case (#err e) P.unreachable();
    case (#ok r) r;
  }
};

/**
 `assertOk`
 ---------------
*/
func assertOk(r:Result<Any,Any>) {
  switch(r) {
    case (#err _) assert false;
    case (#ok _) ();
  }
};

/**
 `assertErr`
 ---------------
*/
func assertErr(r:Result<Any,Any>) {
  switch(r) {
    case (#err _) ();
    case (#ok _) assert false;
  }
};

/**
 `assertErrIs`
 ---------------
*/
func assertErrIs<E>(r:Result<Any,E>, f:E->Bool) : Bool =
  assertErrAs<E,Bool>(r, f);

/**
 `assertErrAs`
 ---------------
*/
func assertErrAs<E,X>(r:Result<Any,E>, f:E->X) : X {
  switch(r) {
    case (#err e) f e;
    case (#ok _) P.unreachable();
  }
};

/**
 `bind`
 -------
 bind operation in result monad.
*/
func bind<R1,R2,Error>(
  x:Result<R1,Error>,
  y:R1 -> Result<R2,Error>) : Result<R2,Error> {
  switch x {
  case (#err e) (#err e);
  case (#ok r) (y r);  
  }
};

/**
 `fromOption`
 --------------
 create a result from an option, including an error value to handle the `null` case.
*/
func fromOption<R,E>(x:?R, err:E):Result<R,E> {
  switch x {
    case (? x) {#ok x};
    case null {#err err};
  }
};

/**
 `fromSome`
 ---------------
 asserts that the option is Some(_) form.
*/
func fromSome<Ok>(o:?Ok):Result<Ok,None> {
  switch(o) {
    case (?o) (#ok o);
    case _ P.unreachable();
  }
};

/**
 `joinArrayIfOk`
 ---------------
 a result that consists of an array of Ok results from an array of results, or the first error in the result array, if any.
*/
func joinArrayIfOk<R,E>(x:[Result<R,E>]) : Result<[R],E> {
  /**- return early with the first Err result, if any */
  for (i in x.keys()) {
    switch (x[i]) {
      case (#err e) { return #err(e) };
      case (#ok _) { };
    }
  };
  /**- all of the results are Ok; tabulate them. */
  #ok(Array_tabulate<R>(x.len(), func (i:Nat):R { assertUnwrap<R,E>(x[i]) }))
};