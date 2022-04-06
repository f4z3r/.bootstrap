SHELL := /bin/bash

CURRENT_DIR := $(shell pwd)

.PHONY: vim-minimal
vim-minimal:
	@-[ -f $(HOME)/.vimrc ] && [ ! -f $(HOME)/.vimrc.bak ] && mv $(HOME)/.vimrc $(HOME)/.vimrc.bak && echo "[+] backup created"
	@[ -L $(HOME)/.vimrc ] || ln -s $(CURRENT_DIR)/conf/.vimrc $(HOME)/.vimrc && echo "[+] configuration linked"
	@[ -d $(HOME)/.config/nvim ] || mkdir -p $(HOME)/.config/nvim
	@[ -L $(HOME)/.config/nvim/init.vim ] || ln -s $(HOME)/.vimrc $(HOME)/.config/nvim/init.vim && echo "[+] configuration linked for nvim"

.PHONY: zsh-minimal
zsh-minimal:
	@-[ -f $(HOME)/.zshrc ] && [ ! -f $(HOME)/.zshrc.bak ] && mv $(HOME)/.zshrc $(HOME)/.zshrc.bak && echo "[+] backup created"
	@[ -L $(HOME)/.zshrc ] || ln -s $(CURRENT_DIR)/conf/.zshrc $(HOME)/.zshrc && echo "[+] configuration linked"
	@[ -L $(HOME)/.config/starship.toml ] || ln -s $(CURRENT_DIR)/conf/starship.toml $(HOME)/.config/starship.toml

.PHONY: bash-minimal
bash-minimal:
	@-[ -f $(HOME)/.bashrc ] && [ ! -f $(HOME)/.bashrc.bak ] && mv $(HOME)/.bashrc $(HOME)/.bashrc.bak && echo "[+] backup created"
	@[ -L $(HOME)/.bashrc ] || ln -s $(CURRENT_DIR)/conf/.bashrc $(HOME)/.bashrc && echo "[+] configuration copied"
	@[ -L $(HOME)/.config/starship.toml ] || ln -s $(CURRENT_DIR)/conf/starship.toml $(HOME)/.config/starship.toml
