#=================================================================================================
#============================================= Bash ==============================================
#=================================================================================================

#=================================================================================================
#============================================= Alias =============================================

# go to project root
alias rt='cd $( if git rev-parse --show-toplevel &> /dev/null; then; git rev-parse --show-toplevel; else; echo ""; fi; )'

# systemctl query
alias sys='systemctl status'

# vim
if command -v nvim &> /dev/null; then
  alias vim="nvim"
fi

# ls
alias l="ls -FA --color=always"
alias ll="ls -alF --color=always"
alias ls="ls -FA --color=always"

# open
alias open="xdg-open"

# screen
alias sc="echo $STY"
alias scl="screen -ls"
alias scr="screen -R"
alias scx="screen -x"

# tree
alias tree="tree -C"

# ip
alias ip="ip -c"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"


#=================================================================================================
#========================================= Colored Grep  =========================================

export GREP_COLORS='mt=01;33:ms=01;33:mc=01;33:sl=:cx=:fn=35:ln=32:bn=32:se=36'


#=================================================================================================
#======================================== Colored Man Pages ======================================

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;74m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[31;1;4m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;146m'
export LESS_TERMCAP_mr=$'\E[01;33m'


#=================================================================================================
#============================================== Env ==============================================

# EDITORS
export VISUAL="vim"
export EDITOR="vim"
export SUDO_EDITOR="vim"


#=================================================================================================
#=========================================== Prompt ==============================================

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local curr_exit="$?"

    PS1='\033[01:35m\A \033[01:32m(\u@\H) \033[01:34m\W \033[00m\$ '

    if [ "$curr_exit" != 0 ]; then
        PS1="\033[01:31m?$curr_exit $PS1"
    fi
}


#=================================================================================================
#=========================================== Misc ================================================

shopt -s expand_aliases
shopt -s histappend


#=================================================================================================
#========================================== Security =============================================

umask 027
