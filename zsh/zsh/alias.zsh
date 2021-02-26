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
alias ck="cd \$(sk)"

# fuzzy search history and execute (repeat)
rpt () {
  command_line=$(history -1000 | tac - | sk --color=dark,hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1)
  command_raw=$(echo "$command_line" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
  echo "$command_raw"
  arguments=($(echo "$command_raw" | tr ' ' "\n"))
  eval $arguments
}
export rpt



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

# screen
alias sc="echo $STY"
alias scl="screen -ls"
alias scr="screen -R"
alias scx="screen -x"

# TaskWarrior / TimeWarrior
alias t="nvim -c 'TW'"
alias ta="task"
# task clear
alias tac="ta status:completed delete"
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
alias pomo='(sleep 25m; notify-send -t 10000 -u critical -c user,pomorodo \
              "System pomorodo completed" \
              "System pomodoro finished after 25 minutes. Please take a short break and start a new one.";
            echo "Pomodoro auto ended at $(date +"%a %d %b %Y %T"), duration: 25 minutes" >> /tmp/pomodoro.log) &'

# utilities
alias weather="curl wttr.in/Zurich"

# calendar
alias calw="gcalcli --calendar jakob.beckmann@ipt.ch --calendar Events calw --nodeclined --monday --military"

# mail
alias newmail='thunderbird -compose "from=beckmann_jakob@hotmail.fr,format=html,body=Dear X"'
