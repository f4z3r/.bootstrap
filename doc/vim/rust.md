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

Install `rust` via `rustup`. This will let you handle several Rust versions without having issues at
the system level.

```sh
sudo pacman -S rustup
# install stable and set it to the default toolchain
rustup default stable
```

The installation of `rls` will be handled by `coc`.

