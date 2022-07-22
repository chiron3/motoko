# Int16
16-bit signed integers with checked arithmetic

Most operations are available as built-in operators (e.g. `1 + 1`).

## Type `Int16`
``` motoko no-repl
type Int16 = Prim.Types.Int16
```

16-bit signed integers

## Value `toInt`
``` motoko no-repl
let toInt : Int16 -> Int
```

Conversion.

## Value `fromInt`
``` motoko no-repl
let fromInt : Int -> Int16
```

Conversion. Traps on overflow/underflow.

## Value `fromIntWrap`
``` motoko no-repl
let fromIntWrap : Int -> Int16
```

Conversion. Wraps on overflow/underflow.

## Value `fromNat16`
``` motoko no-repl
let fromNat16 : Nat16 -> Int16
```

Conversion. Wraps on overflow/underflow.

## Value `toNat16`
``` motoko no-repl
let toNat16 : Int16 -> Nat16
```

Conversion. Wraps on overflow/underflow.

## Function `toText`
``` motoko no-repl
func toText(x : Int16) : Text
```

Returns the Text representation of `x`.

## Function `abs`
``` motoko no-repl
func abs(x : Int16) : Int16
```

Returns the absolute value of `x`. Traps when `x = -2^15`.

## Function `min`
``` motoko no-repl
func min(x : Int16, y : Int16) : Int16
```

Returns the minimum of `x` and `y`.

## Function `max`
``` motoko no-repl
func max(x : Int16, y : Int16) : Int16
```

Returns the maximum of `x` and `y`.

## Function `equal`
``` motoko no-repl
func equal(x : Int16, y : Int16) : Bool
```

Returns `x == y`.

## Function `notEqual`
``` motoko no-repl
func notEqual(x : Int16, y : Int16) : Bool
```

Returns `x != y`.

## Function `less`
``` motoko no-repl
func less(x : Int16, y : Int16) : Bool
```

Returns `x < y`.

## Function `lessOrEqual`
``` motoko no-repl
func lessOrEqual(x : Int16, y : Int16) : Bool
```

Returns `x <= y`.

## Function `greater`
``` motoko no-repl
func greater(x : Int16, y : Int16) : Bool
```

Returns `x > y`.

## Function `greaterOrEqual`
``` motoko no-repl
func greaterOrEqual(x : Int16, y : Int16) : Bool
```

Returns `x >= y`.

## Function `compare`
``` motoko no-repl
func compare(x : Int16, y : Int16) : {#less; #equal; #greater}
```

Returns the order of `x` and `y`.

## Function `neg`
``` motoko no-repl
func neg(x : Int16) : Int16
```

Returns the negation of `x`, `-x`. Traps on overflow.

## Function `add`
``` motoko no-repl
func add(x : Int16, y : Int16) : Int16
```

Returns the sum of `x` and `y`, `x + y`. Traps on overflow.

## Function `sub`
``` motoko no-repl
func sub(x : Int16, y : Int16) : Int16
```

Returns the difference of `x` and `y`, `x - y`. Traps on underflow.

## Function `mul`
``` motoko no-repl
func mul(x : Int16, y : Int16) : Int16
```

Returns the product of `x` and `y`, `x * y`. Traps on overflow.

## Function `div`
``` motoko no-repl
func div(x : Int16, y : Int16) : Int16
```

Returns the division of `x by y`, `x / y`.
Traps when `y` is zero.

## Function `rem`
``` motoko no-repl
func rem(x : Int16, y : Int16) : Int16
```

Returns the remainder of `x` divided by `y`, `x % y`.
Traps when `y` is zero.

## Function `pow`
``` motoko no-repl
func pow(x : Int16, y : Int16) : Int16
```

Returns `x` to the power of `y`, `x ** y`. Traps on overflow.

## Function `bitnot`
``` motoko no-repl
func bitnot(x : Int16, y : Int16) : Int16
```

Returns the bitwise negation of `x`, `^x`.

## Function `bitand`
``` motoko no-repl
func bitand(x : Int16, y : Int16) : Int16
```

Returns the bitwise and of `x` and `y`, `x & y`.

## Function `bitor`
``` motoko no-repl
func bitor(x : Int16, y : Int16) : Int16
```

Returns the bitwise or of `x` and `y`, `x \| y`.

## Function `bitxor`
``` motoko no-repl
func bitxor(x : Int16, y : Int16) : Int16
```

Returns the bitwise exclusive or of `x` and `y`, `x ^ y`.

## Function `bitshiftLeft`
``` motoko no-repl
func bitshiftLeft(x : Int16, y : Int16) : Int16
```

Returns the bitwise shift left of `x` by `y`, `x << y`.

## Function `bitshiftRight`
``` motoko no-repl
func bitshiftRight(x : Int16, y : Int16) : Int16
```

Returns the bitwise shift right of `x` by `y`, `x >> y`.

## Function `bitrotLeft`
``` motoko no-repl
func bitrotLeft(x : Int16, y : Int16) : Int16
```

Returns the bitwise rotate left of `x` by `y`, `x <<> y`.

## Function `bitrotRight`
``` motoko no-repl
func bitrotRight(x : Int16, y : Int16) : Int16
```

Returns the bitwise rotate right of `x` by `y`, `x <>> y`.

## Function `bittest`
``` motoko no-repl
func bittest(x : Int16, p : Nat) : Bool
```

Returns the value of bit `p mod 16` in `x`, `(x & 2^(p mod 16)) == 2^(p mod 16)`.

## Function `bitset`
``` motoko no-repl
func bitset(x : Int16, p : Nat) : Int16
```

Returns the value of setting bit `p mod 16` in `x` to `1`.

## Function `bitclear`
``` motoko no-repl
func bitclear(x : Int16, p : Nat) : Int16
```

Returns the value of clearing bit `p mod 16` in `x` to `0`.

## Function `bitflip`
``` motoko no-repl
func bitflip(x : Int16, p : Nat) : Int16
```

Returns the value of flipping bit `p mod 16` in `x`.

## Value `bitcountNonZero`
``` motoko no-repl
let bitcountNonZero : (x : Int16) -> Int16
```

Returns the count of non-zero bits in `x`.

## Value `bitcountLeadingZero`
``` motoko no-repl
let bitcountLeadingZero : (x : Int16) -> Int16
```

Returns the count of leading zero bits in `x`.

## Value `bitcountTrailingZero`
``` motoko no-repl
let bitcountTrailingZero : (x : Int16) -> Int16
```

Returns the count of trailing zero bits in `x`.

## Function `addWrap`
``` motoko no-repl
func addWrap(x : Int16, y : Int16) : Int16
```

Returns the sum of `x` and `y`, `x +% y`. Wraps on overflow.

## Function `subWrap`
``` motoko no-repl
func subWrap(x : Int16, y : Int16) : Int16
```

Returns the difference of `x` and `y`, `x -% y`. Wraps on underflow.

## Function `mulWrap`
``` motoko no-repl
func mulWrap(x : Int16, y : Int16) : Int16
```

Returns the product of `x` and `y`, `x *% y`. Wraps on overflow.

## Function `powWrap`
``` motoko no-repl
func powWrap(x : Int16, y : Int16) : Int16
```

Returns `x` to the power of `y`, `x **% y`. Wraps on overflow. Traps if `y < 0`.