# Utilities

This document list a set of alternatives to common linux commands and what their advantage is over
regular their regular counterpart.

* [tldr](#tldr)
* [fd](#fd)
* [bat](#bat)
* [exa](#exa)
* [procs](#procs)
  * [Configuration](#configuration)
* [sd](#sd)
  * [Usage](#usage)
* [dust](#dust)
* [ytop](#ytop)
* [zoxide](#zoxide)
  * [Usage](#usage)

## tldr

> Alternative to `man`.

Provides example based _short_ manual references for commands. It is client-server based, meaning
you can find manual pages for uninstalled commands, but require an internet connection.

> Installed via `pacman`, use the `tealdeer` cargo install for the rust implementation.


## fd

> Alternative to `find`.

Uses simpler syntax than `find`, is significantly faster, has a better omission strategy, and
produces coloured output.

> Installed via `pacman`.


## bat

> Alternative to `cat` and `less`.

Can syntax highlight a lot of files. Uses `ncurses` to achieve a cleaner interface. Integrates with
`git` to show diff.

> Installed via `pacman`.


## exa

> Alternative to `ls`.

Has more colourful output. Integrates with `git` to show changes on long list.

> Installed via `pacman`.

## procs

> Alternative to `ps`.

Has more colourful output. Provides more human readable output. Enables easy search and better
configurability.

> Installed via AUR or `cargo`.

### Configuration

```bash
ln -s ~/.bootstrap/conf/procs.toml ~/.config/procs/config.toml
```

## sd

> Alternative to `sed`.

Simpler syntax, but offers far less functionality.

> Installed via `pacman`.

### Usage

```bash
sd this that     # replace this with that
```

## dust

> Alternative to `du`.

Better visual representation of disk usage with graphics.

> Installed via `cargo` (package name is `du-dust`!).

## ytop

> Alternative to `top` and `htop`.

Uses graphs to show usage.

> Installed via AUR or `cargo`.

## zoxide

> Alternative to `cd`.

Integrates fuzzy searching.

> Installed via AUR or `cargo`.

### Usage

```bash
z foo       # cd to highest ranked directory matching foo
z foo bar   # cd to highest ranked directory matching foo and bar

z foo/      # can also cd into actual directories

zi foo      # cd with interactive selection using fzf

zq foo      # echo the best match, don't cd

za /foo     # add /foo to the database
zr /foo     # remove /foo from the database
```
