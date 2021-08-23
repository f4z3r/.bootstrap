# nnn (n^3)

> This is a terminal file manager with a strong focus on 0-config and performance.


## Installation

Install the `nnn` package from the Archlinux repositories.

Plugin installation can be done with:

```bash
curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
```

This will provide all available plugins. However, we have only a set standard that are configured,
namely `preview-tui` and `fzopen` to fuzzy open files. Moreover we use `cd` on exit to ensure we
land in the current work directory of `nnn` on exit.

## Usage

The general navigation works as with `neovim`. Check `?` for more information on its usage.

## Configuration

`nnn` should be automatically configured by default. See [the `nnn` shell configuration for
`zsh`][1].

[1]: ../zsh/zsh/nnn.zsh


