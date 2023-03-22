# Manjaro Bootstrap

This document explains how to bootstrap a full development environment running on Manjaro from
scratch.

* [Minimal Setup](#minimal-setup)
* [Manjaro Install](#manjaro-install)
* [Setup](#setup)
  * [Install `zsh`](#install-`zsh`)
  * [Install Fura Code](#install-fura-code)
  * [Install `starship`](#install-`starship`)
  * [Install `awesome`](#install-`awesome`)
  * [Install utilities](#install-utilities)
* [Theming](#theming)
* [Install other](#install-other)
  * [Office](#office)
  * [yay](#yay)

## Minimal Setup

Configure minimal `vim` and `zsh` (or `bash`) setup using:

```bash
# also possible via make
just vim-minimal
just zsh-minimal
just bash-minimal
```

## Setup Colemak

Modify `/etc/X11/xorg.conf.d/00-keyboard.conf` to contain:

```conf
# Read and parsed by systemd-localed. It's probably wise not to edit this file
# manually too freely.
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us"
        Option "XkbModel" "pc105"
        Option "XkbVariant" "alt-intl"
EndSection
```

After having run `just` you will have to allow yourself to intercept keyboard inputs:

```bash
sudo groupadd uinput
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER
cat 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' > /etc/udev/rules.d/42-kanata.rules
sudo modprobe uinput
```

Then enable and disable Kanata for layered Colemak Mod-DH setup:

```bash
systemcl --user start kanata.service
systemcl --user enable kanata.service  # always start, is configured by default
systemcl --user status kanata.service  # check for issues
systemcl --user stop kanata.service    # stop
```

## Manjaro Install

Get a live bootable USB with XFCE version of Manjaro. Install it with `cryptomount` but without any
office suite.

## Setup

Install the `base-devel` package to ensure we have enough binaries for building most things from
source, especially when installing things from the AUR.

Install `git` to clone this repository. Also generate ssh keys.

> Maybe configure the appropriate mirror list before performing the `pacman` udpate:
>
> ```bash
> just configure-pacman-mirrors    # (in .bootstrap) or
> sudo pacman-mirrors -c Switzerland,Austria,Germany,Italy,Belgium
> ```

```bash
sudo pacman -Syu
ssh-keygen -t rsa -b 4096
```

### Install `zsh`

Install `zsh` and configure it.

```bash
sudo pacman -S zsh zsh-syntax-highlighting zsh-completions zsh-autosuggestions exa ripgrep just
```

> Note `exa` can also be installed via `cargo install`.

Set `zsh` to the default shell using `chsh -s`. Link configuration all files.

```bash
cd ~/.bootstrap/
just configure
```

### Install Fura Code

> CAREFUL: this will take a long time to download.

Install the `nerd-fonts-fira-code` repository from `nerd-fonts-complete-starship` from the AUR.

### Install `starship`

```bash
curl -fsSL https://starship.rs/install.sh | bash
```

### Install `awesome`

Install awesome and its main dependencies.

```bash
sudo pacman -S dmenu mpc scrot unclutter brightnessctl kitty \
  xsecurelock xss-lock xsel xclip yt-dlp git-delta mpv
sudo pacman -S awesome
```

In order to allow some widget keys, also install `utt` using `pip`.

> The switch to the `awesome` session is not functional at this point. At least continue with the
> utilities install below.

### Install utilities

> See [doc/utils.md](doc/utils.md) for more utility alternatives such as `exa`, `skim`, `bat`, etc.

```bash
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


In order to use `neovim`, install packages with `dein`. Launch `neovim` and call the install
function.

```viml
call dein#install()
```

## Theming

Finally, you can install a theme such as the `GTK-dracula` from

```bash
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

### Brave

Install `brave-browser` from `pacman`.
