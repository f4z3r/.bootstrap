# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#=================================================================================================
#============================================== Zsh ==============================================
#=================================================================================================

for config (~/.config/zsh/*.zsh) . $config

# opam configuration
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# fzf integration
test -f /usr/share/fzf/key-bindings.zsh && . /usr/share/fzf/key-bindings.zsh || true

# broot
test -r ~/.config/broot/launcher/bash/br && source ~/.config/broot/launcher/bash/br || true

test -r /usr/share/doc/hoard/hoard.zsh && bindkey '^o' _hoard_list_widget || true
