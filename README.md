# Manjaro Bootstrap

This document explains how to bootstrap a full development environment running on Manjaro from
scratch.

## Base Installation

Download the Xfce iso from their official website. Then create a
bootable USB drive.

```sh
$ lsblk
$ sudo dd bs=4M if=/path/to/iso of=/path/to/dev
$ sync
```

<!-- vim-markdown-toc GFM -->

* [Setup](#setup)
  - [Install `fish`](#install-fish)
  - [Install Fura Code](#install-fura-code)
  - [Install `awesome`](#install-awesome)
  - [Install utilities](#install-utilities)
* [Install other](#install-other)
  - [yay](#yay)
  - [Other Utilities](#other-utilities)

<!-- vim-markdown-toc -->
## Setup

Install `git` to clone this repository. Also generate ssh keys.

```sh
$ sudo pacman -Syu
$ ssh-keygen -t rsa -b 4096
```

### Install `fish`

Install fish and configure it enough to make it usable on Konsole.

```sh
$ sudo pacman -S fish
$ curl -L https://get.oh-my.fish | fish
$ fish -c "omf install bobthefish"
$ chsh -s /usr/bin/fish
$ sudo chsh -s /usr/bin/fish
```

Link configuration all files.

```sh
$ cd ~/.bootstrap/
$ make configure
```

### Install Fura Code

Install Fura Code nerd font for proper handling of ligatures and icons.

```sh
$ cd ~/.bootstrap
$ git submodule update --init --depth 1 tools/nerd-fonts
$ cd tools/nerd-fonts
$ ./install.sh FiraCode
```

### Install `awesome`

Install awesome and its main dependencies.

```sh
$ sudo pacman -S dmenu mpc scrot unclutter xsel xorg-xbacklight kitty
$ sudo pacman -S awesome
```

In order to allow some widget keys, also install `task`. See [taskwarrior](doc/task.md).

### Install utilities

```sh
$ sudo pacman -S the_silver_searcher mupdf-gl screen neovim xscreensaver skim
```

Configure defaults for filetypes.

```sh
$ xdg-mime default mupdf.desktop application/pdf
$ xdg-mime default nvim.desktop text/x-tex text/plain text/x-makefile text/rust text/x-log \
                                text/markdown application/x-perl text/x-python text/x-java \
                                application/json application/x-yaml text/x-csrc text/x-c++src \
                                text/x-chdr text/x-c++hdr
```

Configure screen.

```sh
$ ln -s ~/.bootstrap/conf/.screenrc ~/.screenrc
```

Install `fzf` locally for `neovim`.

```sh
$ cd ~/.bootstrap/
$ git submodule update --init --depth 1 /tools/fzf
$ cd ~/.boostrap/tools/fzf
$ ./install --bin
$ ln -s (pwd)/ $HOME/.fzf
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

Install `yay` for AUR support. Either install from git as show below, or install with `pacman`.

```sh
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
$ cd ..
$ rm -rf yay
```

### Other Utilities

1. `brightnessctl`: allows for more fine-grained control over all devices than `xbacklight`.
