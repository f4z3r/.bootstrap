# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#=================================================================================================
#============================================== Zsh ==============================================
#=================================================================================================

for config (~/.config/zsh/*.zsh) source $config

# opam configuration
test -r /home/jakob/.opam/opam-init/init.zsh && . /home/jakob/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
