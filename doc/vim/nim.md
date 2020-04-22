# Nim

First, ensure `coc` is properly set up.


<!-- vim-markdown-toc GFM -->

* [Coc Extension](#coc-extension)
* [Installation](#installation)
  - [Compiler](#compiler)
  - [LSP](#lsp)

<!-- vim-markdown-toc -->

## Coc Extension

`coc` is already configured to use `nimlsp` as a language server if installed.

## Installation

### Compiler

Install `nim` via `choosenim`.

```sh
$ curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

This will also install the latest stable version of `nim` and `nimble` automatically.

### LSP

Install the LSP via `nimble`.

```sh
$ nimble install nimlsp
```

