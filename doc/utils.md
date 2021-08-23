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
* [menyoki](#menyoki)
* [tokei](#tokei)
* [ripgrep](#ripgrep)
* [hyperfine](#hyperfine)
* [bandwhich](#bandwhich)
* [petname](#petname)
* [pier](#pier)
* [pueue](#pueue)
* [zoxide](#zoxide)
  * [Installation](#installation)
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

## menyoki

An application that lets you record GIFs of your terminal session. It then also lets you edit those
GIFs. Technically, the application can also be used for screen captures and much more.

## tokei

An incredibly fast code line counter.

## ripgrep

An alternative to `grep` that can make recursive searching faster. On simple queries it is however
slower than `grep`.

## hyperfine

An application that allows to time and benchmark command line utilities.

## bandwhich

A utility that allows you to inspect the network traffic (especially outbound connections) made from
your computer.

## petname

A name generator.

> Installed via `cargo`.

## pier

A script manager for one liners on your system. Allows you to manage all your scripts within a
single application.

> Installed via `cargo`.

## pueue

An amazing task scheduler to manage long running tasks on your machine.

> Installed via `pacman`.

## curlie

A http request builder that is easier to use than plain `curl`. It is based on `httpie` but as a few
nice features such as streamed output, and the `--curl` flag that allows to print the `curl` command
that would be equivalent.

> Installed via `pacman`.

## zoxide

> Alternative to `cd`.

Integrates fuzzy searching.

> Installed via AUR or `cargo`.

### Installation

First, install `fzf` and then the binary. Then run the following the appropriate shell:

```bash
eval "$(zoxide init zsh)"
eval "$(zoxide init bash)"
```

By default this is already setup in the bootstrap setup.

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
