#=================================================================================================
#============================================== Env ==============================================
#=================================================================================================

# EDITORS
export VISUAL="nvim"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"

if [[ $(cat ~/.config/kitty/active-theme) == "dark" ]]; then
  if which bat &> /dev/null; then
    export BAT_THEME="gruvbox-dark"
    export MANPAGER="sh -c 'col -bx | bat --theme=gruvbox-dark -l man -p'"
  fi
  export POWER_BACK=237
  export KITTY_THEME=dark
  export COLORFGBG="7;0"
else
  if which bat &> /dev/null; then
    export BAT_THEME="gruvbox-light"
    export MANPAGER="sh -c 'col -bx | bat --theme=gruvbox-light -l man -p'"
  fi
  export BAT_THEME="gruvbox-light"
  export POWER_BACK=249
  export KITTY_THEME=light
  export COLORFGBG="7;0"
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

# XDG
export XDG_CONFIG_PATH="${HOME}/.config"

# Mates
export MATES_DIR="$HOME/.local/share/contacts"
export MATES_INDEX="$HOME/.local/share/mates-index"


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

