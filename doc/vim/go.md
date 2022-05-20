# Go

## Binaries Installation

Install the `go`, `delve`, and `go-tools` packages.

## Coc Extension

Install the `coc` extension.

```viml
CocInstall coc-go
```

## Go Usage

Go uses the principle of a `$GOPATH`, where all source code (both self-written and dependencies),
binaries, and packages live. By default it is at `$HOME/go`, but can be modified.

For a clean `~/dev` folder, you will want to create a `~/dev/go` folder, and set `$GOPATH` to it.
