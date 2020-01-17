# run with bash for consistency

.DEFAULT_GOAL := info

OS_TYPE := $(shell bash installs/get_os.sh)
CURRENT_DIR := $(shell pwd)


.PHONY: info
info:
	@echo Operating system $(OS_TYPE)
	@echo Current directory $(CURRENT_DIR)
	@echo Home directory $(HOME)

.PHONY: full
full: black yamllint vint pyls proselint configure-vim
	@echo "Bootstrap finished !"

.PHONY: configure-vim
configure-vim: install-vim
	-ln -s $(CURRENT_DIR)/nvim/ $(HOME)/.config/nvim

.PHONY: install-vim
install-vim: install-fish
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
