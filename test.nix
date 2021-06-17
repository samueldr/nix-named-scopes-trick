{ pkgs ? import <nixpkgs> {} }:

{
  a = pkgs.callPackage ./a.nix {} {};
  a-fail = pkgs.callPackage ./a.nix {} {
    a = "fail";
  };
  b = pkgs.callPackage ./b.nix {} {};
  b-fail = pkgs.callPackage ./b.nix {} {
    b = "fail";
  };
  c = pkgs.callPackage ./c.nix {} {};
  c-fail = pkgs.callPackage ./c.nix {} {
    c = "fail";
  };
}
