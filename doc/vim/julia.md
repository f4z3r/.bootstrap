# Julia

First, ensure `coc` is properly set up.


<!-- vim-markdown-toc GFM -->

* [Coc extension](#coc-extension)
* [Install packages](#install-packages)

<!-- vim-markdown-toc -->

## Coc extension

> ATTENTION: The extension currently does not work. The LSP is configured manually in
> `coc-settings.json`. This hardcodes the Julia version, which might need to be updated based on
> where the `LanguageServer` is installed.

Install the `coc` extension.

```viml
CocInstall coc-julia
```

## Install packages

Install the following packages: `LanguageServer`, `StaticLint`, `SymbolServer`.
