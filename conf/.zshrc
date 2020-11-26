#=================================================================================================
#============================================== Zsh ==============================================
#=================================================================================================

#=================================================================================================
#============================================= Alias =============================================

# systemctl
alias -g sys="systemctl"
alias -g sysl="systemctl list-units"
alias -g syse="systemctl is-enabled"
alias -g sysa="systemctl is-active"
alias -g syss="systemctl status"
alias -g syst="systemctl start"
alias -g sysp="systemctl stop"

# go to project root
alias rt='cd $( if git rev-parse --show-toplevel &> /dev/null; then; git rev-parse --show-toplevel; else; echo ""; fi; )'

# vim
if command -v nvim &> /dev/null; then
  alias vim="nvim"
fi

# start tmux on ssh
alias ssh="ssh -t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux'"

# ls (use exa instead of boring ls)
alias l="exa -Fa"
alias ll="exa -alF --git"

# kubernetes
alias k="kubectl"
alias -g pf="port-forward"
alias kn="kubens"
alias kc="kubectx"
alias kv="k9s"
alias ks="stern"

# open
alias open="xdg-open"

# screen
alias sc="echo $STY"
alias scl="screen -ls"
alias scr="screen -R"
alias scx="screen -x"

# ag / sk
alias ag="ag --hidden --ignore .git --ignore .cache --color"
alias sk="sk -m --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1"
alias ska="sk -m --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1 --ansi -i -c 'ag \"{}\"'"
alias ck="cd \$(sk)"

# fuzzy search history and execute
skh () {
  command_line=$(history 1000 | sk --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1)
  command_raw=$(echo "$command_line" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
  echo "$command_raw"
  arguments=($(echo "$command_raw" | tr ' ' "\n"))
  eval $arguments
}
export skh

# tree
alias tree="tree -C"

# find
alias fnd='fd'

# ip
alias ip="ip -c"

# grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# docker
# docker image remove dangling
alias did="docker rmi \$(docker images -f 'dangling=true' -q)"
# docker image remove none
alias din="docker rmi \$(docker images -a | perl -lane 'print @F[2] if /<none>/')"
# docker container remove existed
alias dcd="docker container list -a | grep -i exited | cut -d' ' -f1 | xargs docker container rm"

# pomorodo
alias pomo="(sleep 25m; notify-send -t 10000 -u critical -c user,pomorodo \
              'System pomorodo completed' \
              'System pomodoro finished after 25 minutes. Please take a short break and start a new one.') &"

# utilities
alias weather="curl wttr.in/Zurich"

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

[ -d $HOME/.config/zsh/completions ] && fpath=($HOME/.config/zsh/completions $fpath)
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
#========================================= Controlled Path =======================================

GOPATH=$HOME/go
[ -d "$HOME/dev/go" ] && GOPATH=$HOME/dev/go
export GOPATH

GOBIN="$GOPATH/bin"
export GOBIN

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin"                    # system bins

[ -d "/usr/bin/core_perl/" ] && PATH="$PATH:/usr/bin/core_perl/"       # perl core bins
[ -d "/usr/bin/vendor_perl/" ] && PATH="$PATH:/usr/bin/vendor_perl/"   # perl vendor bins
[ -d "$HOME/.local/bin/" ] && PATH="$PATH:$HOME/.local/bin/"           # local bins
[ -d "$HOME/.nimble/bin" ] && PATH="$PATH:$HOME/.nimble/bin"           # nim bins
[ -d "$HOME/.cargo/bin" ] && PATH="$PATH:$HOME/.cargo/bin"             # rust bins
[ -n "$GOBIN" ] && PATH="$PATH:$GOBIN"                                 # go bins

export PATH


#=================================================================================================
#============================================== Env ==============================================

# EDITORS
export VISUAL="vim"
export EDITOR="vim"
export SUDO_EDITOR="vim"
export TERM="xterm-256color"    # required for colors and backspace handling over ssh
if which bat &> /dev/null; then
  export PAGER="bat"
  export BAT_THEME="gruvbox"
  alias man="man -P less"
fi

export CURR_SHELL="zsh"


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

eval "$(starship init zsh)"

zle -N zle-keymap-select


#=================================================================================================
#=========================================== Perl ================================================

[ -r ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc;
[ -r ~/perl5/perlbrew/etc/perlbrew-completion.bash ] && source ~/perl5/perlbrew/etc/perlbrew-completion.bash;


#=================================================================================================
#============================================ Syntax =============================================

if [ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Basic Syntax highlighting
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=8,bold' # grey
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'
ZSH_HIGHLIGHT_STYLES[alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=96'  # plum 4
ZSH_HIGHLIGHT_STYLES[function]='fg=174,bold' # light pink 3
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=green'
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=77' # pale green 3
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=red'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]=
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=52' # dark red
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=blue'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=3' # olive
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=3' # olive
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=3,bold' # olive
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='dim'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8' # grey
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=58' # orange 4
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=58' # orange 4
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[default]='none'


# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=178' # gold 3
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=133' # medium orchid 3
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=229' # wheat 1
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=103' # light slate grey
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='bg=black,bold'

# Custom patterns
ZSH_HIGHLIGHT_PATTERNS+=('sudo rm *' 'fg=white,bold,bg=red')


#=================================================================================================
#========================================== Security =============================================

umask 027
