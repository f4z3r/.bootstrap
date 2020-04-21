# Kubuntu

I want to make Kubuntu my default driver. This will document every change I made to make the system
exactly behave the way I want.

> This means this repository will undergo massive changes in order to accustom this.

The final goal is to allow a user to install (K)ubuntu, and run some script to perform a full
install of the desired software.

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
  - [Install `neovim`](#install-neovim)
  - [Install `awesome`](#install-awesome)

<!-- vim-markdown-toc -->

## Installation

Download an LTS iso from their [official website](https://kubuntu.org/getkubuntu/). Then create a
bootable USB drive.

```sh
$ lsblk
$ sudo dd bs=4M if=/path/to/iso of=/path/to/dev
$ sync
```

Link configuration files.

```sh
$ sudo apt install make
$ cd ~/.bootstrap/
$ make configure
```

## Setup

Install `git` to clone this repository. Also generate ssh keys.

```sh
$ ssh-keygen -t rsa -b 4096
```

### Install `fish`

Install fish and configure it enough to make it usable on Konsole.

```sh
$ sudo apt install fish curl
$ curl -L https://get.oh-my.fish | fish
$ fish -c "omf install bobthefish"
$ chsh -s /usr/bin/fish
$ sudo chsh -s /usr/bin/fish
```

Configure fish.

```sh
$ cd ~/.bootstrap
$ make configure-fish
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
$ curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
$ ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
```

### Install `neovim`

```sh
$ sudo apt install neovim
```


### Install `awesome`

```sh
$ sudo apt install dmenu mpc scrot unclutter xsel
$ sudo apt install awesome
```

