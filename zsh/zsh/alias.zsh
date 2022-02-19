#=================================================================================================
#============================================= Alias =============================================
#=================================================================================================

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
alias vi="nvim"
alias vim="nvim"
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
  alias vi="echo 'No nesting!'"
  alias vim="echo 'No nesting!'"
  alias nvim="echo 'No nesting!'"
fi

# start tmux on ssh
ssht() {
  ssh -t $@ -- /usr/bin/env bash -c 'tmux has-session && exec tmux attach || exec tmux'
}
export ssht

# ag / sk
alias ag="ag --hidden --ignore .git --ignore .cache --color"
alias sk="sk -m --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1"
alias ska="sk -m --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1 --ansi -i -c 'ag \"{}\"'"
alias ck="cd \"\$(sk)\""

# xclip
alias xclip="xclip -selection clipboard"

# clipcat
alias cedit=' clipcat-menu --finder=builtin edit'
alias cset=' clipcat-menu --finder=builtin insert'

# ls (use exa instead of boring ls)
alias l="exa -Fa"
alias ll="exa -alF --git"

# kubernetes
alias k="kubectl"
alias -g pf="port-forward"
alias kn="kubens"
alias kc="kubectx"
alias kv="k9s --headless --crumbsless"
alias ks="stern"

# screen
alias sc="echo $STY"
alias scl="screen -ls"
alias scr="screen -R"
alias scx="screen -x"

# todo.txt
alias t="nvim ~/.todo/todo.txt"
alias tpush="rclone sync ~/.todo cirusdrive:/todo"
alias tpull="rclone sync cirusdrive:/todo ~/.todo"
alias tdone="nvim ~/.todo/done.txt"
alias notes="nvim -c 'Pad search'"
alias noten="nvim -c 'Pad new'"
alias notel="nvim -c 'Pad ls'"

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

# pomorodo
alias pomo='(sleep 25m; notify-send -t 10000 -u critical -c user,pomorodo \
              "System pomorodo completed" \
              "System pomodoro finished after 25 minutes. Please take a short break and start a new one.";
            echo "Pomodoro auto ended at $(date +"%a %d %b %Y %T"), duration: 25 minutes" >> /tmp/pomodoro.log) &'
