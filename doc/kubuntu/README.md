# Manjaro

I want to make Manjaro my default driver. This will document every change I made to make the system
exactly behave the way I want.

> This means this repository will undergo massive changes in order to accustom this.

This will provide a Makefile, but only to setup a minimal development setup.

All other setup will be documented but not provided in the Makefile.

Minimal Setup:

- Fully setup of neovim
- AwesomeWM
- Bluetooth
- ncmcpcpp / mpd
- kitty
- git

## TOC

<!-- vim-markdown-toc GFM -->

* [Installation](#installation)
* [Setup](#setup)
  - [Install `fish`](#install-fish)
  - [Install Fura Code](#install-fura-code)
  - [Install `kitty`](#install-kitty)
  - [Install `awesome`](#install-awesome)
  - [Install utilities](#install-utilities)

<!-- vim-markdown-toc -->

## Installation

Download an LTS iso from their [official website](https://kubuntu.org/getkubuntu/). Then create a
bootable USB drive.

```sh
$ lsblk
$ sudo dd bs=4M if=/path/to/iso of=/path/to/dev
$ sync
```


## Setup

Install `git` to clone this repository. Also generate ssh keys.

```sh
$ ssh-keygen -t rsa -b 4096
```

Link configuration files.

```sh
$ cd ~/.bootstrap/
$ make configure
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

### Install Fura Code

```sh
$ cd ~/.bootstrap
$ git submodule update --init --depth 1 tools/nerd-fonts
$ cd tools/nerd-fonts
$ ./install.sh FiraCode
```

### Install `kitty`

```sh
$ sudo pacman -S kitty
```


### Install `awesome`

```sh
$ sudo pacman -S dmenu mpc scrot unclutter xsel
$ sudo pacman -S awesome
```

### Install utilities

```sh
$ sudo pacman -S the_silver_searcher mupdf-gl htop screen neovim
```

Install `fzf` locally for `neovim`.

```sh
$ cd ~/.bootstrap/
$ git submodule update --init --depth 1 /tools/fzf
$ cd ~/.boostrap/tools/fzf
$ ./install --bin
$ ln -s (pwd)/ $HOME/.fzf
```

