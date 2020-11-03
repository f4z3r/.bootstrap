# Lua

First, ensure `coc` is properly set up.

## Lua LSP

> Check if current lua version is supported on https://github.com/Alloyed/lua-lsp

Install `luarocks` via `pacman` and then the lua LSP via:

```bash
luarocks install --server=http://luarocks.org/dev lua-lsp
```

`coc` is configured to use `lua-lsp` directly.
