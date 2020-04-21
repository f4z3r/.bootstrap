# run with bash for consistency

.DEFAULT_GOAL := info

OS_TYPE := $(shell bash installs/get_os.sh)
CURRENT_DIR := $(shell pwd)

SHELL := /bin/bash

FREE_SPACE := $(shell df -H --output=target,avail | grep '^/\s' | head -n1 | perl -ne 'print((split /\s+/, $$_)[1])' -)

PERL_BIN := $(shell which perl | head -n1)

#### Nim installation
.PHONY: nim
nim: nim-lang nimlsp
	@echo "[+] Nim ready to use"

.PHONY: nim-lang
nim-lang:
	@if [ ! $$(command -v nim) ]; then                                 \
		curl https://nim-lang.org/choosenim/init.sh -sSf > choosenim.sh; \
		sh choosenim.sh -y;                                              \
		rm -f choosenim.sh;                                              \
	fi

.PHONY: nimlsp
nimlsp:
	@if [ ! $$(command -v nimlsp) ]; then                \
		nimble install nimlsp;                             \
	fi

#### Rust installation
.PHONY: rust
rust:
	@curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	@echo "[+] Rust ready to use"


#### Perl installation
.PHONY: perl
perl: install-critic install-tidy
	@echo "[+] Installed perlcritic and perltidy"


#### Pacman configuration
.PHONY: pacman
pacman:
	@if [ -f /etc/pacman.conf ]; then sudo rm /etc/pacman.conf; fi
	@if [ ! -L /etc/pacman.conf ]; then sudo ln -s $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf; fi


#### Information display
.PHONY: info
info:
	@echo "Operating system:   $(OS_TYPE)"
	@echo
	@echo "Current directory:  $(CURRENT_DIR)"
	@echo "Home directory:     $(HOME)"
	@echo "Free space on /:    $(FREE_SPACE)"
	@echo "Perl install:       $(PERL_BIN)"


#### Minimal Setup
.PHONY: min
min: minimal-vim
	@echo "Minimal bootstrap finished !"
	@echo "Please run dein#update() inside (neo)vim to install all plugins"


#### Full setup
.PHONY: full
full: configure-vim configure-git configure-fish install-utils heal-pinky configure-xscreensaver configure-awesome install-power-management
	@echo "Bootstrap finished !"
	@echo "Please run dein#update() inside (neo)vim to install all plugins"
	@echo
	@echo "Run:"
	@echo "  nvim assets/vim-welcome.md"
	@echo

# TODO(@jakob): add other required applications here
.PHONY: install-utils
install-utils: install-ag install-skim configure-screen install-htop install-mupdf install-bluez configure-taskwarrior configure-timewarrior
	@echo "[+] Installed common utilities"

.PHONY: install-power-management
install-power-management: install-powertop install-brightnessctl install-tlp
	@echo "[+] Installed power management utilities"

.PHONY: configure-git
configure-git:
	@if [ ! -L $(HOME)/.gitconfig ]; then ln -s $(CURRENT_DIR)/conf/.gitconfig $(HOME)/.gitconfig; fi
	@if [ ! -L $(HOME)/.gitignore ]; then ln -s $(CURRENT_DIR)/conf/.gitignore $(HOME)/.gitignore; fi
	@echo "[+] Linked git configuration"

.PHONY: configure-vim
configure-vim: generate-config-dir install-vim install-dein install-fzf black yamllint vint pydocstyle proselint configure-vale flawfinder install-uncrustify configure-clang-format cpplint install-cppcheck reorder-python-imports bandit mypy yapf install-yarn
	@if [ -d $(HOME)/.config/nvim ]; then rm -rf $(HOME)/.config/nvim; fi
	@if [ ! -L $(HOME)/.config/nvim ]; then ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim; fi
	@echo "[+] Linked vim configuration"

.PHONY: configure-awesome
configure-awesome: install-fish configure-kitty install-awesome
	@if [ -d $(HOME)/.config/awesome ]; then rm -rf $(HOME)/.config/awesome; fi
	@if [ ! -L $(HOME)/.config/awesome ]; then ln -s $(CURRENT_DIR)/awesome/ $(HOME)/.config/awesome; fi
	@echo "[+] Linked awesome configuration"

.PHONY: install-awesome
install-awesome: install-fish install-mpd
	@fish installs/awesome_$(OS_TYPE).fish

.PHONY: install-mpd
install-mpd: install-fish
	@echo "[---] install mpd skipped"

.PHONY: minimal-vim
minimal-vim: generate-config-dir install-dein install-fzf
	bash installs/link_min_vim.bash $(CURRENT_DIR)
	@echo "[+] Linked minimal vim configuration"
	@echo "[---] Remove the source from .vimrc and .config/nvim/init.vim when done"

.PHONY: configure-vale
configure-vale:
	@if [ ! -L $(HOME)/.vale.ini ]; then ln -s $(CURRENT_DIR)/conf/.vale.ini $(HOME)/.vale.ini; fi
	@if [ ! -L $(HOME)/.vale.d ]; then ln -s $(CURRENT_DIR)/conf/.vale.d $(HOME)/.vale.d; fi
	@echo "[+] Linked vale configuration"
	@if [ ! $$(command -v vale) ]; then echo "[---] Please install vale from their release page from Github"; fi

.PHONY: install-fzf
install-fzf:
	@bash installs/install_fzf.bash

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: install-maven
install-maven: install-java
	@perl installs/install-basic.pl mvn maven maven

.PHONY: install-java
install-java: install-perl
	@perl installs/install-basic.pl java jdk-openjdk openjdk-13-jdk

.PHONY: install-cppcheck
install-cppcheck: install-perl
	@perl installs/install-basic.pl cppcheck cppcheck cppcheck

.PHONY: install-skim
install-skim: install-fish
	@fish installs/skim_$(OS_TYPE).fish

.PHONY: install-yarn
install-yarn: install-node install-fish
	@fish installs/yarn_$(OS_TYPE).fish

.PHONY: install-node
install-node: install-perl
	@perl installs/install-basic.pl node nodejs nodejs

.PHONY: install-vim
install-vim: install-perl install-python
	@perl installs/install-basic.pl nvim neovim neovim

.PHONY: install-uncrustify
install-uncrustify: install-perl
	@perl installs/install-basic.pl uncrustify uncrustify uncrustify

.PHONY: configure-clang-format
configure-clang-format: install-clang-format
	@if [ ! -L $(HOME)/.clang-format ]; then ln -s $(CURRENT_DIR)/conf/.clang-format $(HOME)/.clang-format; fi
	@echo "[+] Linked clang-format configuration"

.PHONY: install-clang-format
install-clang-format: install-perl
	@perl installs/install-basic.pl clang-format clang clang-format

.PHONY: install-asdf
install-asdf: install-fish
	@fish installs/install_asdf.fish

.PHONY: install-mupdf
install-mupdf: install-perl
	@perl installs/install-basic.pl mupdf mupdf-gl mupdf
	@xdg-mime default mupdf.desktop application/pdf

.PHONY: install-bluez
install-bluez: install-perl
	@perl installs/install-basic.pl bluetoothctl "bluez bluez-utils" bluez

.PHONY: configure-screen
configure-screen: install-screen
	@if [ ! -L $(HOME)/.screenrc ]; then ln -s $(CURRENT_DIR)/conf/.screenrc $(HOME)/.screenrc; fi
	@echo "[+] Linked screen configuration"

.PHONY: configure-kitty
configure-kitty: generate-config-dir install-kitty install-fura-code
	@if [ ! -d $(HOME)/.config/kitty/ ]; then mkdir -p $(HOME)/.config/kitty; fi
	@if [ ! -L $(HOME)/.config/kitty/kitty.conf ]; then ln -s $(CURRENT_DIR)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf; fi
	@echo "[+] Linked kitty configuration"

.PHONY: install-kitty
install-kitty: install-perl
	@perl installs/install-basic.pl kitty kitty kitty

.PHONY: install-fura-code
install-fura-code: install-fish
	@fish installs/install_fura.fish

.PHONY: configure-xscreensaver
configure-xscreensaver: install-xscreensaver ~/.Xresources
	@if [ ! -L $(HOME)/.xscreensaver ]; then ln -s $(CURRENT_DIR)/conf/.xscreensaver $(HOME)/.xscreensaver; fi
	@echo "[+] Linked xscreensaver configuration"

~/.Xresources: conf/.Xresources conf/.xinitrc
	@if [ ! -L $(HOME)/.xinitrc ]; then ln -s $(CURRENT_DIR)/conf/.xinitrc $(HOME)/.xinitrc; fi
	@cp conf/.Xresources ~/.Xresources
	@echo "[+] Copied Xresources configuration"
	@echo "[---] Modify ~/.Xresources and add:"
	@echo "[---]   Xft.dpi: 144"
	@echo "[---] or 192 for even higher DPI screens. Then restart awesome."

.PHONY: install-xscreensaver
install-xscreensaver: install-fish
	@perl installs/install-basic.pl xscreensaver xscreensaver xscreensaver

.PHONY: install-screen
install-screen: install-perl
	@perl installs/install-basic.pl screen screen screen

.PHONY: install-ag
install-ag: install-perl
	@perl installs/install-basic.pl ag the_silver_searcher silversearcher-ag

.PHONY: install-htop
install-htop: install-perl
	@perl installs/install-basic.pl htop htop htop

.PHONY: black
black: install-pipx install-fish
	@fish installs/pipx/install.fish black

.PHONY: vint
vint: install-pipx install-fish
	@fish installs/pipx/vint.fish

.PHONY: proselint
proselint: install-pipx install-fish
	@fish installs/pipx/install.fish proselint

.PHONY: pydocstyle
pydocstyle: install-pipx install-fish
	@fish installs/pipx/install.fish pydocstyle

.PHONY: yamllint
yamllint: install-pipx install-fish
	@fish installs/pipx/install.fish yamllint

.PHONY: flawfinder
flawfinder: install-fish install-pipx
	@fish installs/pipx/install.fish flawfinder

.PHONY: cpplint
cpplint: install-fish install-pipx
	@fish installs/pipx/install.fish cpplint

.PHONY: reorder-python-imports
reorder-python-imports: install-fish install-pipx
	@fish installs/pipx/install.fish reorder-python-imports

.PHONY: bandit
bandit: install-fish install-pipx
	@fish installs/pipx/install.fish bandit

.PHONY: mypy
mypy: install-fish install-pipx
	@fish installs/pipx/install.fish mypy

.PHONY: yapf
yapf: install-fish install-pipx
	@fish installs/pipx/install.fish yapf

.PHONY: install-pipx
install-pipx: install-pip
	@if [ ! $$(command -v pipx) ]; then pip3 install --user pipx; fi

.PHONY: install-pip
install-pip: install-python
	@perl installs/install-basic.pl pip3 python-pip python3-pip

.PHONY: install-python
install-python: install-perl
	@perl installs/install-basic.pl python3 python python3

.PHONY: configure-timewarrior
configure-timewarrior: install-timewarrior
	@if [ ! -d $(HOME)/.task/hooks ]; then mkdir -p $(HOME)/.task/hooks; fi
	@if [ ! -L $(HOME)/.task/hooks/on-modify.timewarrior ]; then ln -s $(CURRENT_DIR)/conf/on-modify.timewarrior $(HOME)/.task/hooks/on-modify.timewarrior; fi
	@if [ ! -d $(HOME)/.timewarrior ]; then mkdir -p $(HOME)/.timewarrior; fi
	@if [ ! -L $(HOME)/.timewarrior/timewarrior.cfg ]; then ln -s $(CURRENT_DIR)/conf/timewarrior.cfg $(HOME)/.timewarrior/timewarrior.cfg; fi
	@echo "[+] Linked timewarrior configuration and hook"

.PHONY: install-timewarrior
install-timewarrior: install-perl
	@perl installs/install-basic.pl timew timew timewarrior

.PHONY: configure-taskwarrior
configure-taskwarrior: install-taskwarrior
	@if [ -d $(HOME)/.config/taskwarrior ]; then rm -rf $(HOME)/.config/taskwarrior; fi
	@if [ ! -L $(HOME)/.config/taskwarrior ]; then ln -s $(CURRENT_DIR)/conf/taskwarrior $(HOME)/.config/taskwarrior; fi
	@if [ ! -L $(HOME)/.taskrc ]; then ln -s $(CURRENT_DIR)/conf/.taskrc $(HOME)/.taskrc; fi
	@echo "[+] Linked taskwarrior configuration"

.PHONY: install-taskwarrior
install-taskwarrior: install-perl
	@perl installs/install-basic.pl task taskwarrior taskwarrior

.PHONY: install-powertop
install-powertop: install-perl
	@perl installs/install-basic.pl powertop powertop powertop

.PHONY: install-brightnessctl
install-brightnessctl: install-perl
	@perl installs/install-basic.pl brightnessctl brightnessctl brightnessctl

.PHONY: install-tlp
install-tlp: install-fish
	@fish installs/tlp_$(OS_TYPE).fish

.PHONY: install-critic
install-critic:
	@if [ ! $$(command -v perlcritic) ]; then sudo cpan -i Perl::Critic; fi

.PHONY: install-tidy
install-tidy:
	@if [ ! $$(command -v perltidy) ]; then sudo cpan -i Perl::Tidy; fi

.PHONY: install-perl
install-perl:
	@if [ ! $$(command -v perl) ]; then echo "[---] Please install perl and cpan"; exit 1; fi

.PHONY: configure-fish
configure-fish: install-fish
	@if [ -d $(HOME)/.config/fish ]; then rm -rf $(HOME)/.config/fish; fi
	@if [ ! -L $(HOME)/.config/fish ]; then ln -s $(CURRENT_DIR)/fish/ $(HOME)/.config/fish; fi
	@echo "[+] Linked fish configuration"

.PHONY: install-fish
install-fish:
	@bash installs/fish_$(OS_TYPE).sh

.PHONY: heal-pinky
heal-pinky:
	@if [ ! -L $(HOME)/.Xmodmap ]; then ln -s $(CURRENT_DIR)/conf/.Xmodmap $(HOME)/.Xmodmap; fi
	@echo "[+] Linked Xmodmap configuration"

.PHONY: generate-config-dir
generate-config-dir:
	@if [ ! -d $(HOME)/.config/ ]; then mkdir $(HOME)/.config; fi
