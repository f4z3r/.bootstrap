#=================================================================================================
#============================================= Alias =============================================
#=================================================================================================

# vim
alias vi="nvim"
alias vim="nvim"

# ag / sk
alias ag="ag --hidden --ignore .git --ignore .cache --color"
alias sk="sk -m"
alias ska="sk --ansi -i -c 'ag \"{}\"'"

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
