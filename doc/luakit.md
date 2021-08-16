# Luakit

`luakit` is a web-browser that fully utilises keyboard shortcuts.

## Basic Shortcuts

- `o` to open a new link. `shift+o` to edit the current URI.
- `t` to open a new link in a new tab. `shift+t` to edit the current URI in a new tab.
- `f` to index links.
- `shift+f` to index links an open in new tab.
- `shift-h` to go back in browser history.
- `shift-l` to go forward in browser history.
- use `[search-engine] [term]` to search within a search engine.
- `gd` to open downloads, `shift+d` to do the same in a new tab.
- `gb` to open bookmarks, `shift+b` to do the same in a new tab.
- `r` to reload the page.
- `d` to close/delete the page.
- `y` to yank current URI.
- `a+[num]` go to tab `num`.
- `M{a-zA-Z0-9}` to set a quickmark. `gn{a-zA-Z0-9}` to access the quickmark in a new tab, or with
  `go` to open it in the current tab. `:qmarks` to list them.

## Configuration

Configuration is done via the `~/.config/luakit/rc.lua` and `~/.config/luakit/theme.lua` files.
These are setup automatically when installing this repo via `make`.

## Proxies

Use `:proxy proxy-name socks://localhost:8000` to add proxies. Run the command without arguments to
see the list of proxies that are available. The active one will be marked.

## TODOs

- pin tabs,
- dark mode,
- integrate with Bitwarden
