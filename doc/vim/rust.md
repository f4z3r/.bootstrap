# Rust

First, ensure `coc` is properly set up.


<!-- vim-markdown-toc GFM -->

* [Coc Extension](#coc-extension)
* [Installation](#installation)

<!-- vim-markdown-toc -->

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-rls
```

## Installation

Install `rust` via `rustup`.

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

This will automatically install the stable version of `rust`. The installation of `rls` will be
handled by `coc`.

