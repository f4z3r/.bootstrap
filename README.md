# Manjaro Bootstrap

This document explains how to bootstrap a full development environment running on Manjaro from
scratch.

<!-- vim-markdown-toc GFM -->

* [Setup](#setup)
  - [Install `zsh`](#install-zsh)
  - [Install Fura Code](#install-fura-code)
  - [Install `awesome`](#install-awesome)
  - [Install utilities](#install-utilities)
* [Install other](#install-other)
  - [yay](#yay)

<!-- vim-markdown-toc -->

## Setup

Install `git` to clone this repository. Also generate ssh keys.

```sh
sudo pacman -Syu
ssh-keygen -t rsa -b 4096
```

### Install `zsh`

Install `zsh` and configure it.

```sh
sudo pacman -S zsh zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-completions
```

Link configuration all files.

```zsh
cd ~/.bootstrap/
make configure
```

### Install Fura Code

Install Fura Code nerd font for proper handling of ligatures and icons.

```zsh
cd ~/.bootstrap
git submodule update --init --depth 1 tools/nerd-fonts
cd tools/nerd-fonts
./install.sh FiraCode
```

### Install `awesome`

Install awesome and its main dependencies.

```zsh
sudo pacman -S dmenu mpc scrot unclutter xsel brightnessctl kitty
sudo pacman -S awesome
```

In order to allow some widget keys, also install `task`, and `timew`. See [taskwarrior](doc/task.md)
and [timewarrior](doc/timew.md).

### Install utilities

```zsh
sudo pacman -S the_silver_searcher mupdf-gl screen neovim xscreensaver skim
```

Configure defaults for filetypes.

```zsh
xdg-mime default mupdf.desktop application/pdf
xdg-mime default nvim.desktop text/x-tex text/plain text/x-makefile text/rust text/x-log \
                              text/markdown application/x-perl text/x-python text/x-java \
                              application/json application/x-yaml text/x-csrc text/x-c++src \
                              text/x-chdr text/x-c++hdr
```

Configure screen.

```zsh
ln -s ~/.bootstrap/conf/.screenrc ~/.screenrc
```

Install `fzf` locally for `neovim`.

```zsh
cd ~/.bootstrap/
git submodule update --init --depth 1 /tools/fzf
cd ~/.boostrap/tools/fzf
./install --bin
ln -s $(pwd)/ $HOME/.fzf
```

In order to use `neovim`, install packages with `dein`. Launch `neovim` and call the install
function.

```viml
call dein#install()
```

## Install other

Other tools and utilities can be installed and configured. In order to have a better idea on how the
how to install and configure some of those tools, see `doc` directory.

### yay

Install `yay` for AUR support.
