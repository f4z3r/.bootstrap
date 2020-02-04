
```sh
# General TaskWarrior commands
alias t='task'
alias tn='task next +READY'
alias tnu="task next urgency \> ${urgencyPrio}"
alias ta='task add'
alias tan='task annotate'
alias tl='task log'
alias tac='task active'
alias tap='task add project:Personal'
alias taw='task add project:Work'

# TaskWarrior reports
# Tip: use `task timesheet` for a full report
alias tt='task modified:today completed'
alias ty='task modified:yesterday completed'
alias tey='task end.after:yesterday completed'
alias twork='task context work'
alias tpers='task context personal'
# Show task I completed in the last week
alias tclw='task end.after:today-1wk completed'

## TimeWarrior
alias twst='timew start'
alias twstop='timew stop'
alias tws='timew summary :week'
alias twlw='timew summary :lastweek'
alias twd='timew summary :day'
```


# Haskell

Install:

- stack (pacman or installer)
- hdevtools (stack)
- brittany (stack)
- stylish-haskell (stack or pacman)
- (haskell IDE engine? hie)
