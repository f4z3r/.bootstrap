#=================================================================================================
#============================================== Env ==============================================
#=================================================================================================

# EDITORS
export VISUAL="nvim"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
if which bat &> /dev/null; then
  export PAGER="bat"
  alias man="man -P less"
fi

# ZSH
setopt INC_APPEND_HISTORY
setopt sharehistory
# # set history size
# export HISTSIZE=10000
# # save history after logout
# export SAVEHIST=10000
# # history file
# export HISTFILE=~/.zhistory
# # append into history file
# setopt INC_APPEND_HISTORY
# # save only one command if 2 common are same and consistent
# setopt HIST_IGNORE_DUPS
# # timestamp for each entry
# setopt EXTENDED_HISTORY



# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .cache -g ""'

export CURR_SHELL="zsh"

# Locale
# export LC_COLLATE=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8
# export LC_MESSAGES=en_US.UTF-8
# export LC_MONETARY=en_US.UTF-8
# export LC_NUMERIC=en_US.UTF-8
# export LC_TIME=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LANGUAGE=en_US.UTF-8
# export LESSCHARSET=utf-8

