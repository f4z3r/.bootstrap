#=================================================================================================
#============================================= Bash ==============================================
#=================================================================================================

#=================================================================================================
#============================================= Alias =============================================

# allow aliases for sudo (check space after alias)
alias sudo="sudo "

# systemctl query
alias sys='systemctl status'

# go to project root
alias rt='cd $( if git rev-parse --show-toplevel &> /dev/null; then; git rev-parse --show-toplevel; else; echo ""; fi; )'

# vim
alias vi="nvim"
alias vim="nvim"
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  alias vi="echo 'No nesting!'"
  alias vim="echo 'No nesting!'"
  alias nvim="echo 'No nesting!'"
fi

# start tmux on ssh
alias ssh="ssh -t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux'"

# ag / sk
alias ag="ag --hidden --ignore .git --ignore .cache --color"
alias sk="sk -m --color=${KITTY_THEME},hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1"
alias ska="sk -m --color=${KITTY_THEME},hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1 --ansi -i -c 'ag \"{}\"'"
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

# ls (use exa instead of boring ls)
alias l="exa -Fa"
alias ll="exa -alF --git"

# kubernetes
alias k="kubectl"
alias kn="kubens"
alias kc="kubectx"
alias kv="k9s"
alias ks="stern"

# screen
alias sc="echo $STY"
alias scl="screen -ls"
alias scr="screen -R"
alias scx="screen -x"

# TaskWarrior / TimeWarrior
alias t="nvim -c 'TW'"
alias ta="task"
alias ti="timew"

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

# podman
# podman image delete dangling
alias pidd="podman rmi \$(podman images -f 'dangling=true' -q)"
# podman image delete none
alias pidn="podman rmi \$(podman images -a | perl -lane 'print @F[2] if /<none>/')"
# podman container delete existed
alias pcde="podman container list -a | grep -i exited | cut -d' ' -f1 | xargs podman container rm"
# buildah container delete all
alias bcda="buildah containers | grep -vi 'container name' | cut -d' ' -f1 | xargs buildah rm"

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
  alias man -P less
fi

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .cache -g ""'

export CURR_SHELL="bash"

#=================================================================================================
#=========================================== Prompt ==============================================

eval "$(starship init bash)"

#=================================================================================================
#=========================================== Perl ================================================

[ -r ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc;
[ -r ~/perl5/perlbrew/etc/perlbrew-completion.bash ] && source ~/perl5/perlbrew/etc/perlbrew-completion.bash;


#=================================================================================================
#=========================================== Misc ================================================

shopt -s expand_aliases
shopt -s histappend


#=================================================================================================
#========================================== Security =============================================

umask 027
