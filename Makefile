SHELL := /bin/bash

CURRENT_DIR := $(shell pwd)

.PHONY: configure
configure: configure-vim configure-zsh configure-tools configure-bash configure-kitty configure-git configure-awesome configure-pinky configure-pacman configure-logind thesaurus configure-ctags configure-tmux configure-asdf configure-pier configure-luakit

.PHONY: configure-root
configure-root: configure-zsh-root

.PHONY: backup
backup:
	@[ -d /mnt/drive ] || sudo mkdir /mnt/drive
	@-sudo mount /dev/sda1 /mnt/drive
	@rsync -vau --delete-after $(HOME)/Music/ /mnt/drive/music
	@rsync -vau --delete-after $(HOME)/.pad-notes/ /mnt/drive/notes
	@rsync -vau --delete-after $(HOME)/ipt/ /mnt/drive/ipt
	@rsync -vau --delete-after $(HOME)/Documents/ /mnt/drive/docs

.PHONY: configure-pacman-mirrors
configure-pacman-mirrors:
	@sudo pacman-mirrors -c Switzerland,Austria,Germany,Italy,Belgium
	@echo "[+] Configured Pacman mirrorlist"

.PHONY: configure-ctags
configure-ctags:
	@[ -L $(HOME)/.config/ctags ] || ln -s $(CURRENT_DIR)/conf/ctags $(HOME)/.config/ctags
	@echo "[+] Linked ctags configuration"

.PHONY: configure-git
configure-git:
	@[ -L $(HOME)/.gitconfig ] || ln -s $(CURRENT_DIR)/conf/.gitconfig $(HOME)/.gitconfig
	@[ -L $(HOME)/.gitignore ] || ln -s $(CURRENT_DIR)/conf/.gitignore $(HOME)/.gitignore
	@[ -L $(HOME)/.config/git ] || ln -s $(CURRENT_DIR)/conf/git $(HOME)/.config/git
	@[ -L $(HOME)/.config/git/active.conf ] || ln -s $(CURRENT_DIR)/conf/git/dark.conf $(HOME)/.config/git/active.conf
	@echo "[+] Linked git configuration"

.PHONY: configure-zsh-root
configure-zsh-root:
	@[ -L /root/.zshrc ] || sudo ln -s $(CURRENT_DIR)/zsh/.zshrc /root/.zshrc
	@[ -L /root/.config/zsh ] || sudo ln -s $(CURRENT_DIR)/zsh/zsh /root/.config/zsh
	@echo "[+] Linked zsh root configuration"

.PHONY: configure-asdf
configure-asdf:
	@[ -d $(HOME)/.asdf ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
	@echo "[+] asdf is downloaded"

.PHONY: configure-zsh
configure-zsh:
	@[ -L $(HOME)/.zshrc ] || ln -s $(CURRENT_DIR)/zsh/.zshrc $(HOME)/.zshrc
	@[ -L $(HOME)/.config/zsh ] || ln -s $(CURRENT_DIR)/zsh/zsh $(HOME)/.config/zsh
	@[ -L $(HOME)/.config/starship.toml ] || ln -s $(CURRENT_DIR)/conf/starship.toml $(HOME)/.config/starship.toml
	@echo "[+] Linked zsh configuration"

.PHONY: configure-tmux
configure-tmux:
	@[ -d $(HOME)/.tmux/plugins ] || mkdir -p $(HOME)/.tmux/plugins
	@[ -d $(HOME)/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	@[ -L $(HOME)/.tmux.conf ] || ln -s $(CURRENT_DIR)/conf/.tmux.conf $(HOME)/.tmux.conf
	@echo "[+] Linked tmux configuration"

.PHONY: configure-tools
configure-tools:
	@install -d /$(HOME)/.local/bin
	@install $(CURRENT_DIR)/zsh/zsh/utils/ytp $(HOME)/.local/bin/
	@install $(CURRENT_DIR)/zsh/zsh/utils/drawio $(HOME)/.local/bin/
	@install -d /$(HOME)/.local/share/man/man1
	@install $(CURRENT_DIR)/zsh/zsh/utils/ytp.1 /$(HOME)/.local/share/man/man1
	@install $(CURRENT_DIR)/zsh/zsh/utils/drawio.1 /$(HOME)/.local/share/man/man1
	@echo "[+] Installed shell tools"

.PHONY: configure-pier
configure-pier:
	@[ -L $(HOME)/.config/pier.toml ] || ln -s $(CURRENT_DIR)/conf/pier.toml $(HOME)/.config/pier.toml
	@echo "[+] Linked pier configuration"

.PHONY: configure-bash
configure-bash:
	@-[ -f $(HOME)/.bashrc ] && rm $(HOME)/.bashrc
	@[ -L $(HOME)/.bashrc ] || ln -s $(CURRENT_DIR)/conf/.bashrc $(HOME)/.bashrc
	@echo "[+] Linked bash configuration"

.PHONY: configure-vim
configure-vim: install-dein link-ultisnips
	@-mkdir -p $(HOME)/.pad-notes/
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

.PHONY: configure-pacman
configure-pacman:
	@sudo cp -u $(CURRENT_DIR)/conf/pacman.conf /etc/pacman.conf
	@sudo chmod 664 /etc/pacman.conf
	@echo "[+] Copied pacman configuration"

.PHONY: configure-logind
configure-logind:
	@sudo cp -u $(CURRENT_DIR)/conf/systemd/logind.conf /etc/systemd/logind.conf
	@echo "[+] Copied logind configuration"

#### Installs

.PHONY: thesaurus
thesaurus:
	@mkdir -p ~/.vim/thesaurus
	@if [ ! -f ~/.vim/thesaurus/mthesaur.txt ]; then \
		wget --quiet -c -O ~/.vim/thesaurus/mthesaur.txt https://www.gutenberg.org/files/3202/files/mthesaur.txt; \
		echo "[+] Downloaded thesaurus mthesaur"; \
		fi
	@if [ ! -f ~/.vim/thesaurus/openoffice-data.zip ]; then \
		wget --no-check-certificate --quiet -c -O ~/.vim/thesaurus/openoffice-data.zip https://www.openoffice.org/lingucomponent/MyThes-1.zip; \
		mkdir -p ~/.vim/thesaurus/openoffice; \
		unzip -j ~/.vim/thesaurus/openoffice-data.zip -d ~/.vim/thesaurus/openoffice/ &> /dev/null; \
		echo "[+] Downloaded openoffice files"; \
		fi
	@echo "[+] Downloaded thesaurus offline files"

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: link-ultisnips
link-ultisnips:
	@[ -d $(HOME)/.config/coc ] || mkdir -p $(HOME)/.config/coc
	@-[ -d $(HOME)/.config/coc/ultisnips ] && rm -r $(HOME)/.config/coc/ultisnips
	@[ -L $(HOME)/.config/coc/ultisnips ] || ln -s $(CURRENT_DIR)/conf/ultisnips $(HOME)/.config/coc/ultisnips
	@echo "[+] Snippets linked"

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

.PHONY: configure-luakit
configure-luakit:
	@[ -d $(HOME)/.config/luakit ] || mkdir -p $(HOME)/.config/luakit
	@[ -L $(HOME)/.config/luakit/rc.lua ] || ln -s $(CURRENT_DIR)/conf/luakit/rc.lua $(HOME)/.config/luakit/rc.lua
	@[ -L $(HOME)/.config/luakit/theme.lua ] || ln -s $(CURRENT_DIR)/conf/luakit/theme.lua $(HOME)/.config/luakit/theme.lua
	@echo "[+] Linked luakit configuration"

.PHONY: configure-pinky
configure-pinky:
	@[ -L $(HOME)/.Xmodmap ] || ln -s $(CURRENT_DIR)/conf/.Xmodmap $(HOME)/.Xmodmap
	@echo "[+] Linked Xmodmap configuration"
