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
full: configure-vim configure-git configure-fish
	@echo "Bootstrap finished !"
	$(MAKE) launch-dein-install

.PHONY: configure-git
configure-git:
	@if [ ! -L $(HOME)/.gitconfig ]; then ln -s $(CURRENT_DIR)/git/.gitconfig $(HOME)/.gitconfig; fi
	@if [ ! -L $(HOME)/.gitignore ]; then ln -s $(CURRENT_DIR)/git/.gitignore $(HOME)/.gitignore; fi
	@echo "[+] Linked git configuration"

.PHONY: configure-fish
configure-fish:
	@echo "[-] TODO implement fish configure"

.PHONY: configure-vim
configure-vim: install-vim install-dein install-javals install-fzf black yamllint vint pyls proselint
	@if [ ! -L $(HOME)/.config/nvim ]; then ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim; fi
	@echo "[+] Linked vim configuration"

.PHONY: install-fzf
install-fzf:
	fish installs/install_fzf.fish

.PHONY: install-dein
install-dein:
	@sh tools/install-dein.sh ~/.cache/dein > /dev/null
	@echo "[+] Dein installed"

.PHONY: launch-dein-install
launch-dein-install:
	nvim -c "call dein#install()" assets/vim-welcome.md

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

.PHONY: install-fish
install-fish:
	bash installs/fish_$(OS_TYPE).sh
