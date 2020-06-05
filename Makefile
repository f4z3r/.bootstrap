SHELL := /bin/bash

CURRENT_DIR := $(shell pwd)

.PHONY: configure
configure: configure-vim configure-zsh configure-bash configure-kitty configure-git configure-awesome configure-pinky configure-pacman thesaurus configure-ctags configure-lock

.PHONY: configure-root
configure-root: configure-zsh-root

.PHONY: configure-ctags
configure-ctags:
	@[ -L $(HOME)/.config/ctags ] || ln -s $(CURRENT_DIR)/conf/ctags $(HOME)/.config/ctags
	@echo "[+] Linked ctags configuration"

.PHONY: configure-git
configure-git:
	@[ -L $(HOME)/.gitconfig ] || ln -s $(CURRENT_DIR)/conf/.gitconfig $(HOME)/.gitconfig
	@[ -L $(HOME)/.gitignore ] || ln -s $(CURRENT_DIR)/conf/.gitignore $(HOME)/.gitignore
	@echo "[+] Linked git configuration"

.PHONY: configure-zsh-root
configure-zsh-root:
	@[ -L /root/.zshrc ] || sudo ln -s $(CURRENT_DIR)/zsh/.zshrc /root/.zshrc
	@[ -L /root/.config/zsh ] || sudo ln -s $(CURRENT_DIR)/zsh/zsh /root/.config/zsh
	@echo "[+] Linked zsh root configuration"

.PHONY: configure-zsh
configure-zsh:
	@[ -L $(HOME)/.zshrc ] || ln -s $(CURRENT_DIR)/zsh/.zshrc $(HOME)/.zshrc
	@[ -L $(HOME)/.config/zsh ] || ln -s $(CURRENT_DIR)/zsh/zsh $(HOME)/.config/zsh
	@echo "[+] Linked zsh configuration"

.PHONY: configure-bash
configure-bash:
	@-[ -f $(HOME)/.bashrc ] && rm $(HOME)/.bashrc
	@[ -L $(HOME)/.bashrc ] || ln -s $(CURRENT_DIR)/conf/.bashrc $(HOME)/.bashrc
	@echo "[+] Linked bash configuration"

.PHONY: configure-vim
configure-vim: install-dein link-ultisnips
	@-[ -d $(HOME)/.config/nvim ] && rm -rf $(HOME)/.config/nvim
	@[ -L $(HOME)/.config/nvim ] || ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim
	@echo "[+] Linked vim configuration"

.PHONY: configure-awesome
configure-awesome:
	@-[ -d $(HOME)/.config/awesome ] && rm -rf $(HOME)/.config/awesome
	@[ -L $(HOME)/.config/awesome ] || ln -s $(CURRENT_DIR)/awesome/ $(HOME)/.config/awesome
	@echo "[+] Linked awesome configuration"
	
.PHONY: configure-kitty
configure-kitty:
	@[ -d $(HOME)/.config/kitty/ ] || mkdir -p $(HOME)/.config/kitty
	@[ -L $(HOME)/.config/kitty/kitty.conf ] || ln -s $(CURRENT_DIR)/conf/kitty.conf $(HOME)/.config/kitty/kitty.conf
	@[ -L $(HOME)/.config/kitty/kitty-colors ] || ln -s $(CURRENT_DIR)/conf/kitty-colors $(HOME)/.config/kitty/kitty-colors
	@[ -L $(HOME)/.config/kitty/active-theme.conf ] || ln -s $(CURRENT_DIR)/conf/kitty-colors/gruvbox-material-dark-soft.conf $(HOME)/.config/kitty/active-theme.conf
	@[ -f $(HOME)/.config/kitty/active-theme ] || echo "dark" > $(HOME)/.config/kitty/active-theme
	@echo "[+] Linked kitty configuration"

.PHONY: configure-lock
configure-lock:
	@[ -L $(HOME)/.local/bin/fuzzy-lock.sh ] || ln -s $(CURRENT_DIR)/tools/fuzzy-lock.sh $(HOME)/.local/bin/fuzzy-lock.sh
	@echo "[+] Lockscreen configured"

.PHONY: pacman
configure-pacman:
	@-[ -f /etc/pacman.conf ] && sudo rm /etc/pacman.conf
	@[ -L /etc/pacman.conf ] || sudo ln -s $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf
	@echo "[+] Linked pacman configuration"

#### Installs

.PHONY: thesaurus
thesaurus:
	@mkdir -p ~/.vim/thesaurus
	@if [ ! -f ~/.vim/thesaurus/mthesaur.txt ]; then \
		curl -qfsS -o ~/.vim/thesaurus/mthesaur.txt https://www.gutenberg.org/files/3202/files/mthesaur.txt; \
		fi
	@if [ ! -f ~/.vim/thesaurus/openoffice-data.zip ]; then \
		curl -qfsS -o ~/.vim/thesaurus/openoffice-data.zip https://www.openoffice.org/lingucomponent/MyThes-1.zip; \
		mkdir -p ~/.vim/thesaurus/openoffice; \
		unzip -j ~/.vim/thesaurus/openoffice-data.zip -d ~/.vim/thesaurus/openoffice/ &> /dev/null; \
		fi
	@echo "[+] Downloaded thesaurus offline files"

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: link-ultisnips
link-ultisnips:
	@[ -d $(HOME)/.config/coc ] || mkdir -p $(HOME)/.config/coc
	@[ -d $(HOME)/.config/coc/ultisnips ] && rm -r $(HOME)/.config/coc/ultisnips
	@[ -L $(HOME)/.config/coc/ultisnips ] || ln -s $(CURRENT_DIR)/conf/ultisnips $(HOME)/.config/coc/ultisnips
	@echo "[+] Snippets linked"

.PHONY: vim-minimal
vim-minimal:
	@-[ -f $(HOME)/.vimrc ] && [ ! -f $(HOME)/.vimrc.bck ] && mv $(HOME)/.vimrc $(HOME)/.vimrc.bck && echo "[+] backup created"
	@[ -f $(HOME)/.vimrc ] || cp $(CURRENT_DIR)/conf/.vimrc $(HOME)/.vimrc && echo "[+] configuration copied"
	@[ -d $(HOME)/.config/nvim ] || mkdir -p $(HOME)/.config/nvim
	@[ -L $(HOME)/.config/nvim/init.vim ] || ln -s $(HOME)/.vimrc $(HOME)/.config/nvim/init.vim && echo "[+] configuration linked for nvim"

.PHONY: zsh-minimal
zsh-minimal:
	@-[ -f $(HOME)/.zshrc ] && [ ! -f $(HOME)/.zshrc.bck ] && mv $(HOME)/.zshrc $(HOME)/.zshrc.bck && echo "[+] backup created"
	@[ -f $(HOME)/.zshrc ] || cp $(CURRENT_DIR)/conf/.zshrc $(HOME)/.zshrc && echo "[+] configuration copied"

.PHONY: bash-minimal
bash-minimal:
	@-[ -f $(HOME)/.bashrc ] && [ ! -f $(HOME)/.bashrc.bck ] && mv $(HOME)/.bashrc $(HOME)/.bashrc.bck && echo "[+] backup created"
	@[ -f $(HOME)/.bashrc ] || cp $(CURRENT_DIR)/conf/.bashrc $(HOME)/.bashrc && echo "[+] configuration copied"

.PHONY: configure-pinky
configure-pinky:
	@[ -L $(HOME)/.Xmodmap ] || ln -s $(CURRENT_DIR)/conf/.Xmodmap $(HOME)/.Xmodmap
	@echo "[+] Linked Xmodmap configuration"
