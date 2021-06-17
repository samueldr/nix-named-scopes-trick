{ runCommandNoCC }:

let scope = { "myLib.myFunction" =

{ x ? 0
, y ? 1
, z ? 2
}:

runCommandNoCC "test-c" {
  inherit x y z;
} ''
echo $x >> $out
echo $y >> $out
echo $z >> $out
''

;}; in scope."myLib.myFunction"
