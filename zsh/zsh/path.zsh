#=================================================================================================
#============================================== Path =============================================
#=================================================================================================

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin"                    # system bins
[ -d "/usr/bin/core_perl/" ] && PATH="$PATH:/usr/bin/core_perl/"       # perl core bins
[ -d "/usr/bin/vendor_perl/" ] && PATH="$PATH:/usr/bin/vendor_perl/"   # perl vendor bins
[ -d "$HOME/.local/bin/" ] && PATH="$PATH:$HOME/.local/bin/"           # local bins
[ -d "$HOME/.nimble/bin" ] && PATH="$PATH:$HOME/.nimble/bin"           # nim bins
[ -d "$HOME/.cargo/bin" ] && PATH="$PATH:$HOME/.cargo/bin"             # rust bins
export PATH

# also provide local /bin -> /share/man pages
MANPATH=""
[ -d "$HOME/.local/share/man" ] && MANPATH="$MANPATH:$HOME/.local/share/man"
export MANPATH

GOPATH=$HOME/go
[ -d "$HOME/dev/go" ] && GOPATH=$HOME/dev/go
export GOPATH
