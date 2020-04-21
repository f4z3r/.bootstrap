# run with bash for consistency

.DEFAULT_GOAL := info

SHELL := /bin/bash

CURRENT_DIR := $(shell pwd)

.PHONY: configure
configure: configure-vim configure-fish configure-kitty configure-git configure-awesome configure-pinky configure-pacman

.PHONY: configure-git
configure-git:
	@if [ ! -L $(HOME)/.gitconfig ]; then ln -s $(CURRENT_DIR)/conf/.gitconfig $(HOME)/.gitconfig; fi
	@if [ ! -L $(HOME)/.gitignore ]; then ln -s $(CURRENT_DIR)/conf/.gitignore $(HOME)/.gitignore; fi
	@echo "[+] Linked git configuration"
	
.PHONY: configure-vim
configure-vim: install-dein install-fzf
	@if [ -d $(HOME)/.config/nvim ]; then rm -rf $(HOME)/.config/nvim; fi
	@if [ ! -L $(HOME)/.config/nvim ]; then ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim; fi
	@echo "[+] Linked vim configuration"

.PHONY: configure-awesome
configure-awesome:
	@if [ -d $(HOME)/.config/awesome ]; then rm -rf $(HOME)/.config/awesome; fi
	@if [ ! -L $(HOME)/.config/awesome ]; then ln -s $(CURRENT_DIR)/awesome/ $(HOME)/.config/awesome; fi
	@echo "[+] Linked awesome configuration"
	
.PHONY: configure-fish
configure-fish:
	@if [ -d $(HOME)/.config/fish ]; then rm -rf $(HOME)/.config/fish; fi
	@if [ ! -L $(HOME)/.config/fish ]; then ln -s $(CURRENT_DIR)/fish/ $(HOME)/.config/fish; fi
	@echo "[+] Linked fish configuration"

.PHONY: configure-kitty
configure-kitty:
	@if [ ! -d $(HOME)/.config/kitty/ ]; then mkdir -p $(HOME)/.config/kitty; fi
	@if [ ! -L $(HOME)/.config/kitty/kitty.conf ]; then ln -s $(CURRENT_DIR)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf; fi
	@echo "[+] Linked kitty configuration"

.PHONY: pacman
configure-pacman:
	@if [ -f /etc/pacman.conf ]; then sudo rm /etc/pacman.conf; fi
	@if [ ! -L /etc/pacman.conf ]; then sudo ln -s $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf; fi
	

#### Installs

.PHONY: install-fzf
install-fzf:
	@bash installs/install_fzf.bash

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: configure-pinky
configure-pinky:
	@if [ ! -L $(HOME)/.Xmodmap ]; then ln -s $(CURRENT_DIR)/conf/.Xmodmap $(HOME)/.Xmodmap; fi
	@echo "[+] Linked Xmodmap configuration"
