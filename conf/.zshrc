#=================================================================================================
#============================================== Zsh ==============================================
#=================================================================================================

#=================================================================================================
#============================================= Alias =============================================

# go to project root
alias rt='cd $( if git rev-parse --show-toplevel &> /dev/null; then; git rev-parse --show-toplevel; else; echo ""; fi; )'

# systemctl query
alias sys='systemctl status'

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
#=========================================== Completion ==========================================

fpath=($HOME/.config/zsh/completions $fpath)
autoload -Uz compinit
compinit -u
#autoload -U ~/.zsh/completion/*(:t)
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#=================================================================================================
#============================================== Env ==============================================

# EDITORS
export VISUAL="vim"
export EDITOR="vim"


#=================================================================================================
#=========================================== History =============================================

HISTFILE=$HOME/.zhistory
setopt APPEND_HISTORY
HISTSIZE=1200
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY


#=================================================================================================
#============================================ Keybind ============================================

bindkey -v

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Add custom binds
bindkey "fd" vi-cmd-mode
bindkey -a "^H" vi-beginning-of-line
bindkey -a "^L" vi-end-of-line


typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
	function zle-line-init () {
		printf '%s' "${terminfo[smkx]}"
	}
	function zle-line-finish () {
		printf '%s' "${terminfo[rmkx]}"
	}
	zle -N zle-line-init
	zle -N zle-line-finish
fi


#=================================================================================================
#=========================================== Prompt ==============================================

PROMPT='%B%F{red}%(?..?%? )%F{magenta}%T %F{green}(%n@%M%a%) %F{blue}%1~%f%b %# '


#=================================================================================================
#========================================== Security =============================================

umask 077
