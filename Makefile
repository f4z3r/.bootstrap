# run with bash for consistency

.DEFAULT_GOAL := info

OS_TYPE := $(shell bash installs/get_os.sh)
CURRENT_DIR := $(shell pwd)


.PHONY: info
info:
	@echo "Operating system:   $(OS_TYPE)"
	@echo
	@echo "Current directory:  $(CURRENT_DIR)"
	@echo "Home directory:     $(HOME)"

.PHONY: full
full: configure-vim configure-git configure-fish install-utils heal-pinky configure-xscreensaver configure-rclocal
	@echo "Bootstrap finished !"
	nvim -c "call dein#install()" assets/vim-welcome.md

.PHONY: min
min: minimal-vim
	@echo "Minimal bootstrap finished !"
	nvim -c "call dein#install()" assets/vim-welcome.md

.PHONY: install-utils
install-utils: install-ag install-skim configure-screen install-htop configure-kitty install-mupdf install-bluez
	@echo "[+] Installed common utilities"

.PHONY: pacman
pacman:
	@if [ -f /etc/pacman.conf ]; then sudo rm /etc/pacman.conf; fi
	@if [ ! -L /etc/pacman.conf ]; then sudo ln -s $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf; fi

.PHONY: configure-git
configure-git:
	@if [ ! -L $(HOME)/.gitconfig ]; then ln -s $(CURRENT_DIR)/git/.gitconfig $(HOME)/.gitconfig; fi
	@if [ ! -L $(HOME)/.gitignore ]; then ln -s $(CURRENT_DIR)/git/.gitignore $(HOME)/.gitignore; fi
	@echo "[+] Linked git configuration"

.PHONY: configure-vim
configure-vim: generate-config-dir install-vim install-dein install-javals install-fzf black yamllint vint pyls proselint configure-vale
	@if [ -d $(HOME)/.config/nvim ]; then rm -rf $(HOME)/.config/nvim; fi
	@if [ ! -L $(HOME)/.config/nvim ]; then ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim; fi
	@echo "[+] Linked vim configuration"

.PHONY: minimal-vim
minimal-vim: generate-config-dir install-dein install-fzf
	bash installs/link_min_vim.bash $(CURRENT_DIR)
	@echo "[+] Linked minimal vim configuration"
	@echo "[-] Remove the source from .vimrc and .config/nvim/init.vim when done"

.PHONY: configure-vale
configure-vale:
	@if [ ! -L $(HOME)/.vale.ini ]; then ln -s $(CURRENT_DIR)/conf/.vale.ini $(HOME)/.vale.ini; fi
	@if [ ! -L $(HOME)/.vale.d ]; then ln -s $(CURRENT_DIR)/conf/.vale.d $(HOME)/.vale.d; fi
	@echo "[+] Linked vale configuration"
	@echo "[-] Please install vale from their release page from Github"

.PHONY: install-fzf
install-fzf:
	bash installs/install_fzf.bash

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: install-javals
install-javals: install-maven
	fish installs/install_javals.fish

.PHONY: install-maven
install-maven: install-java-13
	fish installs/maven_$(OS_TYPE).fish

.PHONY: install-java-13
install-java-13:
	fish installs/java-13_$(OS_TYPE).fish

.PHONY: install-vim
install-vim: install-fish install-python
	fish installs/vim_$(OS_TYPE).fish

.PHONY: install-skim
install-skim: install-fish
	fish installs/skim_$(OS_TYPE).fish

.PHONY: install-mupdf
install-mupdf: install-fish
	fish installs/mupdf_$(OS_TYPE).fish

.PHONY: install-bluez
install-bluez: install-fish
	fish installs/bluez_$(OS_TYPE).fish

.PHONY: configure-screen
configure-screen: install-screen
	@if [ ! -L $(HOME)/.screenrc ]; then ln -s $(CURRENT_DIR)/conf/.screenrc $(HOME)/.screenrc; fi
	@echo "[+] Linked screen configuration"

.PHONY: configure-kitty
configure-kitty: generate-config-dir install-kitty
	@if [ ! -d $(HOME)/.config/kitty/ ]; then mkdir -p $(HOME)/.config/kitty; fi
	@if [ ! -L $(HOME)/.config/kitty/kitty.conf ]; then ln -s $(CURRENT_DIR)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf; fi
	@echo "[+] Linked kitty configuration"

.PHONY: install-kitty
install-kitty: install-fish
	fish installs/kitty_$(OS_TYPE).fish

.PHONY: configure-xscreensaver
configure-xscreensaver: install-xscreensaver ~/.Xresources
	@if [ ! -L $(HOME)/.xscreensaver ]; then ln -s $(CURRENT_DIR)/conf/.xscreensaver $(HOME)/.xscreensaver; fi
	@echo "[+] Linked xscreensaver configuration"

.PHONY: configure-rclocal
configure-rclocal:
	@if [ ! -L /etc/rc.local ]; then sudo ln -s $(CURRENT_DIR)/conf/rc.local /etc/rc.local; fi
	@echo "[+] Linked rc.local configuration"

~/.Xresources: conf/.Xresources
	@cp conf/.Xresources ~/.Xresources
	@echo "[+] Copied Xresources configuration"
	@echo "[-] Modify ~/.Xresources and add:"
	@echo "[-]   Xtf.dpi: 144"
	@echo "[-] or 192 for even higher DPI screens. Then run:"
	@echo "[-]   xrdb -merge ~/.Xresources"

.PHONY: install-xscreensaver
install-xscreensaver: install-fish
	fish installs/xscreensaver_$(OS_TYPE).fish

.PHONY: install-screen
install-screen: install-fish
	fish installs/screen_$(OS_TYPE).fish

.PHONY: install-ag
install-ag: install-fish
	fish installs/ag_$(OS_TYPE).fish

.PHONY: install-htop
install-htop: install-fish
	fish installs/htop_$(OS_TYPE).fish

.PHONY: black
black: install-pipx
	fish installs/pipx/install.fish black

.PHONY: vint
vint: install-pipx
	fish installs/pipx/vint.fish

.PHONY: proselint
proselint: install-pipx
	fish installs/pipx/install.fish proselint

.PHONY: pyls
pyls: install-pipx
	fish installs/pipx/pyls.fish

.PHONY: yamllint
yamllint: install-pipx
	fish installs/pipx/install.fish yamllint

.PHONY: install-pipx
install-pipx: install-pip
	fish installs/pipx_$(OS_TYPE).fish

.PHONY: install-pip
install-pip: install-python
	fish installs/pip3_$(OS_TYPE).fish

.PHONY: install-python
install-python: install-fish
	fish installs/python3_$(OS_TYPE).fish

.PHONY: configure-fish
configure-fish:
	@if [ -d $(HOME)/.config/fish ]; then rm -rf $(HOME)/.config/fish; fi
	@if [ ! -L $(HOME)/.config/fish ]; then ln -s $(CURRENT_DIR)/fish/ $(HOME)/.config/fish; fi
	@echo "[+] Linked fish configuration"

.PHONY: install-fish
install-fish:
	bash installs/fish_$(OS_TYPE).sh

.PHONY: heal-pinky
heal-pinky:
	@if [ ! -L $(HOME)/.xmodmap ]; then ln -s $(CURRENT_DIR)/conf/.xmodmap $(HOME)/.xmodmap; fi
	@echo "[+] Linked xmodmap configuration"

.PHONY: generate-config-dir
generate-config-dir:
	@if [ ! -d $(HOME)/.config/ ]; then mkdir $(HOME)/.config; fi
