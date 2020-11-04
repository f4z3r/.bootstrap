# tmux

## Installation

Install the `tmux` package using `pacman`.

## Configuration

The configuration for `tmux` should be set up via the `Makefile`.

## Usage

The current configuration has the following properties:

- `C-a` is the prefix.
- `C-h/j/k/l` to move between panes.
- `-` or `"` to split vertically.
- `|` or `%` to split horizontally.
- `c` to create new window.
- `n/p` for next/previous window.
- `l` or `a` for last window.
- `d` to detach.
- `s` to list sessions.
- `w` to list windows.
- `,` to rename current window.
- `$` to rename session.
- `x` to close pane.
- `&` to close window.
- `:` to enter command mode.
- `!` break pane out to new window.
- `z` zoom active pane.
- `f` search for text in active windows.
- mouse support is turned off.
- `tmux` is automatically launched on ssh connections and within `awesome` and `i3`.

