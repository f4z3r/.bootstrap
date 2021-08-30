#=================================================================================================
#=========================================== History =============================================
#=================================================================================================

HISTFILE=$HOME/.zhistory
setopt APPEND_HISTORY
HISTSIZE=1200
SAVEHIST=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# do not store any command containing password in history
function zshaddhistory() {
  emulate -L zsh
  if [[ $1 = *"password"* ]]; then
    return 1
  fi
}
