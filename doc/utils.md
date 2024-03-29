# Utilities

This document list a set of alternatives to common linux commands and what their advantage is over
regular their regular counterpart.

* [Clipboard Managers](#clipboard-managers)
* [broot](#broot)
* [fselect](#fselect)
* [tldr](#tldr)
* [fd](#fd)
* [bat](#bat)
* [exa](#exa)
* [rip](#rip)
* [procs](#procs)
  * [Configuration](#configuration)
* [sd](#sd)
  * [Usage](#usage)
* [dust](#dust)
* [bottom](#bottom)
* [menyoki](#menyoki)
* [tokei](#tokei)
* [ripgrep](#ripgrep)
* [gping](#gping)
* [hyperfine](#hyperfine)
* [bandwhich](#bandwhich)
* [petname](#petname)
* [hoard](#hoard)
* [ouch](#ouch)
* [pueue](#pueue)
* [curlie](#curlie)
* [zoxide](#zoxide)
  * [Installation](#installation)
  * [Usage](#usage)
* [feh](#feh)
  * [Installation](#installation)
* [gfold](#gfold)
  * [Installation](#installation)
* [t-rec](#t-rec)
  * [Installation](#installation)
* [peek](#peek)
  * [Installation](#installation)
* [watchexec](#watchexec)
  * [Installation](#installation)
* [navi](#navi)
  * [Installation](#installation)
* [ttyper](#ttyper)
  * [Installation](#installation)
* [xsv](#xsv)
  * [Installation](#installation)
* [csview](#csview)
  * [Installation](#installation)
* [fblog](#fblog)
  * [Installation](#installation)
* [fend](#fend)
  * [Installation](#installation)
* [miniserve](#miniserve)
  * [Installation](#installation)
* [nomino](#nomino)
  * [Installation](#installation)
* [tiny-irc-client-git](#tiny-irc-client-git)
  * [Installation](#installation)
* [dua](#dua)
  * [Installation](#installation)
* [lynis](#lynis)
  * [Installation](#installation)
* [dog](#dog)
  * [Installation](#installation)

## Clipboard Managers

While we use `xsel` for most occasions due to its better performance and simpler syntax:

```bash
echo -n "hello world" | xsel -bi
```

we will also have `xclip` installed. The reason for this is because we like to copy binary files
such as images to the clipboard from time to time. This cannot be done with `xsel` but can be done
with `xclip`:

```bash
xclip -t image/png < ingress.png
xclip -t application/pdf < sample.pdf
```

> Note that xclip is an alias to use the clipboard by default.

This is useful to not have to open a terminal GUI to copy files that are binary.

Moreover, we use `clipcat` to manage the clipboard with history. This can be installed using
`yay`.

Create its default configuration:

```bash
mkdir -p                       $XDG_CONFIG_PATH/clipcat
clipcatd default-config      > $XDG_CONFIG_PATH/clipcat/clipcatd.toml
clipcatctl default-config    > $XDG_CONFIG_PATH/clipcat/clipcatctl.toml
clipcat-menu default-config  > $XDG_CONFIG_PATH/clipcat/clipcat-menu.toml
```

Start the clipcat daemon (this should be done automatically by `awesome`):

```bash
clipcatd
```

You can now use the following shortcuts to manage the clipboard:

```bash
# Edit clipboard selections
cedit
# Insert clipboard history into current clipboard
cset
```

## broot

> Alternative to zoxide, tree, and cd.

Configure `broot` using:

```bash
ln -s $HOME/.bootstrap/conf/broot.hjson $XDG_CONFIG_PATH/broot/conf.hjson
```

> Installed via `pacman`.

## fselect

> SQL like query language to get information about your filesystem.

Enables queries such as:

```bash
# count files in current dir with size greater than 7MiB
fselect 'count(*) from . where size > 7m'
# get absolute path and size of python files in specified path
fselect abspath, size from ~/Music where path = '*.py'
```
> Installed via `yay`.

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

## rip

> Alternative to `rm`.

Uses trash and recovery.

> Installed via `pacman` as `rm-improved`.

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

## bottom

> Alternative to `top` and `htop`.

Uses graphs to show usage.

> Installed via `pacman`.

## menyoki

An application that lets you record GIFs of your terminal session. It then also lets you edit those
GIFs. Technically, the application can also be used for screen captures and much more.

## tokei

An incredibly fast code line counter.

## ripgrep

An alternative to `grep` that can make recursive searching faster. On simple queries it is however
slower than `grep`.

## gping

An alternative to `ping` that provides graphical output.

## hyperfine

An application that allows to time and benchmark command line utilities.

## bandwhich

A utility that allows you to inspect the network traffic (especially outbound connections) made from
your computer.

## petname

A name generator.

> Installed via `cargo`.

## hoard

A script manager for one liners on your system. Allows you to manage all your scripts within a
single application.

> Installed from AUR.

## ouch

A simplified compression and decompression tool.

> Installed via AUR.

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


## feh

> Fast image viewer.

### Installation

Installed via `pacman`.

## gfold

> Finds git repositories on your machine.

### Installation

Installed via `pacman`.

## t-rec

> Records terminal sessions and turns them into GIFs.

### Installation

Installed from the AUR.

## peek

> Screen recorder to make GIFs.

This tool is not full terminal based, but supports recordings that include stuff like `Ctrl-C`
signals.

### Installation

Installed via `pacman`.

## watchexec

> Automatically execute command when files change.

### Installation

Installed via `pacman`.

## navi

> Cheat sheet management and fuzzy searcher.

### Installation

Installed from the AUR.

## ttyper

> Typing practice tool in the command line.

### Installation

Installed from the AUR.

## xsv

> CSV viewer and editor for the command line.

### Installation

Installed via `pacman`.

## csview

> CSV viewer in the command line.

### Installation

Installed from the AUR.

## fblog

> JSON log output parser.

### Installation

Installed from the AUR.

## fend

> Unit aware precision calculator.

### Installation

Installed from the AUR.

## miniserve

> Serve files via minimal HTTP server.

### Installation

Installed from the community repositories.

## nomino

> Rename files in bulk.

### Installation

Installed from the AUR.

## tiny-irc-client-git

> A tiny console-based IRC client written in Rust.

### Installation

Installed from the AUR.

## dua

> A CLI utility to manage disk usage and flag file for deletion.

### Installation

Installed as package `dua-cli` with Pacman.

## lynis

> A system hardening tool to analyze the security of your linux system.

### Installation

Installed as package `lynis` with Pacman.

## dog

> A DNS resolution tool.

### Installation

Installed as package `dog` with Pacman.
