# Julia

First, ensure `coc` is properly set up.


<!-- vim-markdown-toc GFM -->

* [Coc extension](#coc-extension)
* [Install packages](#install-packages)

<!-- vim-markdown-toc -->

## Coc extension

Install the `coc` extension.

```viml
CocInstall coc-julia
```

## Install packages

Install the following packages: `PackageCompiler`, then open a Julia file and run:

```vim
CocCommand julia.CompileLanguageServerSysimg
```
