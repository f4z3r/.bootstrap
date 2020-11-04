# Manjaro Bootstrap

This document explains how to bootstrap a full development environment running on Manjaro from
scratch.

* [Minimal Setup](#minimal-setup)
* [Manjaro Install](#manjaro-install)
* [Setup](#setup)
  * [Install `zsh`](#install-`zsh`)
  * [Install Fura Code](#install-fura-code)
  * [Install `awesome`](#install-`awesome`)
  * [Install utilities](#install-utilities)
* [Theming](#theming)
* [Install other](#install-other)
  * [Office](#office)
  * [yay](#yay)

## Minimal Setup

Configure minimal `vim` and `zsh` (or `bash`) setup using:

```sh
make vim-minimal
make zsh-minimal
make bash-minimal
```

## Manjaro Install

Get a live bootable USB with XFCE version of Manjaro. Install it with `cryptomount` but without any
office suite.

## Setup

Install `git` to clone this repository. Also generate ssh keys.

> Maybe configure the appropriate mirror list before performing the `pacman` udpate:
>
> ```sh
> make configure-pacman-mirrors    # (in .bootstrap) or
> sudo pacman-mirrors -c Switzerland,Austria,Germany,Italy,Belgium
> ```

```sh
sudo pacman -Syu
ssh-keygen -t rsa -b 4096
```

### Install `zsh`

Install `zsh` and configure it.

```sh
sudo pacman -S zsh zsh-syntax-highlighting zsh-theme-powerlevel10k zsh-completions zsh-autosuggestions
```

Set `zsh` to the default shell using `chsh -s`. Link configuration all files.

```sh
cd ~/.bootstrap/
make configure
```

### Install Fura Code

Install Fura Code nerd font for proper handling of ligatures and icons.

```sh
cd ~/.bootstrap
git submodule update --init --depth 1 tools/nerd-fonts
cd tools/nerd-fonts
./install.sh FiraCode
```

### Install `awesome`

Install awesome and its main dependencies.

```sh
sudo pacman -S dmenu mpc scrot unclutter brightnessctl kitty i3lock xss-lock xsel youtube-dl
sudo pacman -S awesome
```

In order to allow some widget keys, also install `task`, and `timew`. See [taskwarrior](doc/task.md)
and [timewarrior](doc/timew.md).

> The switch to the `awesome` session is not functional at this point. At least continue with the
> utilities install below.

### Install utilities

```sh
sudo pacman -S the_silver_searcher mupdf-gl neovim skim ctags tree tmux
```

> At this point `awesome` should be functional. For full functionality from `tmux`, also install
> `kubectx`.

Configure defaults for filetypes.

```zsh
xdg-mime default mupdf.desktop application/pdf
xdg-mime default nvim.desktop text/x-tex text/plain text/x-makefile text/rust text/x-log \
                              text/markdown application/x-perl text/x-python text/x-java \
                              application/json application/x-yaml text/x-csrc text/x-c++src \
                              text/x-chdr text/x-c++hdr
```

Install `fzf` locally for `neovim`.

```sh
cd ~/.bootstrap/
git submodule update --init --remote --depth 1 tools/fzf
cd ~/.boostrap/tools/fzf
./install --bin
ln -s $(pwd)/ $HOME/.fzf
```

In order to use `neovim`, install packages with `dein`. Launch `neovim` and call the install
function.

```viml
call dein#install()
```

## Theming

Finally, you can install a theme such as the `GTK-dracula` from

```sh
mkdir -p ~/.local/share/themes/
cd ~/.local/share/themes/
curl -SsL -o dracula.zip https://github.com/dracula/gtk/archive/master.zip
unzip dracula.zip
```

Then install `lxappearance`, launch it and select the `gtk-master` theme. The same application can
be used to configure icon sets, etc.


## Install other

Other tools and utilities can be installed and configured. In order to have a better idea on how the
how to install and configure some of those tools, see `doc` directory. Examples that require no
configuration and that are extremely useful are for instance `rsync`.

### Office

Use the `libreoffice-fresh` package to have the latest features of the `libreoffice` suite.

### yay

Install `yay` for AUR support.
