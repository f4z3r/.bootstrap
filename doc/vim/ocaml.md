# OCaml

First, ensure `coc` is properly set up.

* [Installation](#installation)
* [Compiling Executables](#compiling-executables)
  * [Dune](#dune)
* [Tools](#tools)
  * [`utop`](#`utop`)
  * [OCaml LSP](#ocaml-lsp)
  * [Others](#others)

## Installation

Link the `.ocamlinit` file (mostly used by the toplevels):

```sh
ln -s ~/.bootstrap/conf/.ocamlinit ~/.ocamlinit
ln -s ~/.bootstrap/conf/.ocp-indent ~/.ocp-indent
```

Install `opam` via `pacman`. And run `opam init`. You can then switch versions with `opam switch`.

## Compiling Executables

### Dune

Dune is a project compilation tool for OCaml. You can install it via `opam`. Then create the
following file within a folder to create an executable that uses the core library (`dune` file):

```lisp
(executable
  (name hello_world)
  (libraries core)
  (preprocess (pps ppx_jane)))
```

Then for instance the following source file (`hello_world.md`):

```ocaml
open Core

let () =
  Sexp.to_string_hum [%sexp ([3;4;5] : int list)]
  |> print_endline
```

And finally run `dune build hello_world`.

## Tools

### `utop`

In order to install `utop`, run

```sh
opam install core utop
opam install async yojson core_extended core_bench cohttp async_graphics cryptokit menhir
```

### OCaml LSP

Install `ocaml-lsp-server` via `opam`:

```sh
opam install ocaml-lsp-server
```

### Others

Have a look at:

https://github.com/ocamlpro/ocp-index
