#=================================================================================================
#============================================= Alias =============================================
#=================================================================================================

# vim
alias vi="nvim"
alias vim="nvim"

# ag / sk
alias ag="ag --hidden --ignore .git --ignore .cache --color"
alias sk="sk -m --color=${KITTY_THEME},hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1"
alias ska="sk -m --color=${KITTY_THEME},hl:3,spiller:2,fg+:9,hl+:3,selected:6,query:5,matched_bg:-1 --ansi -i -c 'ag \"{}\"'"

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

# TaskWarrior / TimeWarrior
alias t="task"
alias ti="timew"

# tree
alias tree="tree -C"

# ip
alias ip="ip -c"

# grep
alias grep="grep --color=auto"
