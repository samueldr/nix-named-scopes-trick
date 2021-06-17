Nix scopes trick
================

I'm not sure anyone documented this trick in the past, so here goes.

As a Nix library author, have you ever been aggravated by Nix showing
"anonymous function" as a name for your lovingly crafted functions?

This can happen if e.g. you `import` the functions from discrete files.

```
# See a.nix
.../nix-named-scopes $ nix-build ./test.nix -A a-fail
error: anonymous function at .../nix-named-scopes/a.nix:3:1 called with unexpected argument 'a', at .../nix-named-scopes/test.nix:5:12
```

Ugh! As a library user I want to know which call site I have to look at!
They've been named!!

Turns out you can trick Nix into giving it a nice name of you define your
function in a `let` block:

```
# See b.nix
.../nix-named-scopes $ nix-build ./test.nix -A b-fail
error: 'myLibFunction' at .../nix-named-scopes/b.nix:5:1 called with unexpected argument 'b', at .../nix-named-scopes/test.nix:9:12
```

Great!

Except that maybe your library has a form of hierarch, e.g. `myLib.myFunction`.

With a clever attrset use you can do it!

```
# See c.nix
.../nix-named-scopes 1 $ nix-build ./test.nix -A c-fail
error: 'myLib.myFunction' at .../nix-named-scopes/c.nix:5:1 called with unexpected argument 'c', at .../nix-named-scopes/test.nix:13:12
```

Great! The error if my bad use of `myLib.myFunction`!

* * *

Tested on:

```
.../nix-named-scopes $ nix --version
nix (Nix) 2.3.9
```
