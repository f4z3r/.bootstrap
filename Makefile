# run with bash for consistency

SHELL := /bin/bash

CURRENT_DIR := $(shell pwd)

.PHONY: configure
configure: configure-vim configure-zsh configure-kitty configure-git configure-awesome configure-pinky configure-pacman configure-xscreensaver


.PHONY: configure-root
configure-root: configure-zsh-root

.PHONY: configure-git
configure-git:
	@if [ ! -L $(HOME)/.gitconfig ]; then ln -s $(CURRENT_DIR)/conf/.gitconfig $(HOME)/.gitconfig; fi
	@if [ ! -L $(HOME)/.gitignore ]; then ln -s $(CURRENT_DIR)/conf/.gitignore $(HOME)/.gitignore; fi
	@echo "[+] Linked git configuration"

.PHONY: configure-zsh-root
configure-zsh-root:
	@if [ ! -L /root/.zshrc ]; then sudo ln -s $(CURRENT_DIR)/zsh/.zshrc /root/.zshrc; fi
	@if [ ! -L /root/.config/zsh ]; then sudo ln -s $(CURRENT_DIR)/zsh/zsh /root/.config/zsh; fi
	@echo "[+] Linked zsh root configuration"

.PHONY: configure-zsh
configure-zsh:
	@if [ ! -L $(HOME)/.zshrc ]; then ln -s $(CURRENT_DIR)/zsh/.zshrc $(HOME)/.zshrc; fi
	@if [ ! -L $(HOME)/.config/zsh ]; then ln -s $(CURRENT_DIR)/zsh/zsh $(HOME)/.config/zsh; fi
	@echo "[+] Linked zsh configuration"

.PHONY: configure-vim
configure-vim: install-dein
	@if [ -d $(HOME)/.config/nvim ]; then rm -rf $(HOME)/.config/nvim; fi
	@if [ ! -L $(HOME)/.config/nvim ]; then ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim; fi
	@echo "[+] Linked vim configuration"

.PHONY: configure-awesome
configure-awesome:
	@if [ -d $(HOME)/.config/awesome ]; then rm -rf $(HOME)/.config/awesome; fi
	@if [ ! -L $(HOME)/.config/awesome ]; then ln -s $(CURRENT_DIR)/awesome/ $(HOME)/.config/awesome; fi
	@echo "[+] Linked awesome configuration"
	
.PHONY: configure-kitty
configure-kitty:
	@if [ ! -d $(HOME)/.config/kitty/ ]; then mkdir -p $(HOME)/.config/kitty; fi
	@if [ ! -L $(HOME)/.config/kitty/kitty.conf ]; then ln -s $(CURRENT_DIR)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf; fi
	@echo "[+] Linked kitty configuration"

.PHONY: pacman
configure-pacman:
	@if [ -f /etc/pacman.conf ]; then sudo rm /etc/pacman.conf; fi
	@if [ ! -L /etc/pacman.conf ]; then sudo ln -s $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf; fi

.PHONY: configure-xscreensaver
configure-xscreensaver:
	@if [ ! -L $(HOME)/.xscreensaver ]; then ln -s $(CURRENT_DIR)/conf/.xscreensaver $(HOME)/.xscreensaver; fi
	@if [ ! -L $(HOME)/.Xresources ]; then ln -s $(CURRENT_DIR)/conf/.Xresources $(HOME)/.Xresources; fi
	@echo "[+] Linked xscreensaver configuration"

#### Installs

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: configure-pinky
configure-pinky:
	@if [ ! -L $(HOME)/.Xmodmap ]; then ln -s $(CURRENT_DIR)/conf/.Xmodmap $(HOME)/.Xmodmap; fi
	@echo "[+] Linked Xmodmap configuration"
