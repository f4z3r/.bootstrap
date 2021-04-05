# Lua

First, ensure `coc` is properly set up.

## Version Manager

Use `asdf` plugin:

```bash
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf plugin-add luaJIT https://github.com/smashedtoatoms/asdf-luaJIT.git
```

To install luaJIT `2.0.5` with luarocks `2.4.4`:

```bash
asdf install luaJIT 2.0.5--2.4.4
```

## Lua VSCode Language Server

Ensure you have `ninja` installed as a dependency and also have C++17.

Then clone the project:

```bash
mkdir -vp ~/.local/opt && cd ~/.local/opt
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
```

> Note that the clone must be in said directory in order to work with the `coc` configuration.

Then build the project:

```bash
cd 3rd/luamake
ninja -f ninja/linux.ninja
cd ../..
./3rd/luamake/luamake rebuild
```

Finally it can be run using:

```bash
./bin/Linux/lua-language-server -E ./main.lua
```

## Lua LSP

> Check if current lua version is supported on https://github.com/Alloyed/lua-lsp

Install `luarocks` via `pacman` and then the lua LSP via:

```bash
luarocks install --server=http://luarocks.org/dev lua-lsp
```

`coc` is not configured to use `lua-lsp` directly. Add the following to use this LSP:

```json
"lua": {
  "command": "lua-lsp",
  "filetypes": ["lua"]
}
```

