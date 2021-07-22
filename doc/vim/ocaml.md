# OCaml

First, ensure `coc` is properly set up.

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
* [Tools](#tools)
  - [`utop`](#utop)
  - [OCaml LSP](#ocaml-lsp)
  - [Others](#others)

<!-- vim-markdown-toc -->

## Installation

Link the `.ocamlinit` file:

```sh
ln -s ~/.bootstrap/conf/.ocamlinit ~/.ocamlinit
ln -s ~/.bootstrap/conf/.ocp-indent ~/.ocp-indent
```

Install `opam` via `pacman`. And run `opam init`.


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
