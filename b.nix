{ runCommandNoCC }:

let myLibFunction = 

{ x ? 0
, y ? 1
, z ? 2
}:

runCommandNoCC "test-b" {
  inherit x y z;
} ''
echo $x >> $out
echo $y >> $out
echo $z >> $out
''

; in myLibFunction
