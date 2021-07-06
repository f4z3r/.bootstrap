#=================================================================================================
#============================================== Path =============================================
#=================================================================================================

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin"                        # system bins
[ -d "/var/lib/snapd/snap/bin/" ] && PATH="$PATH:/var/lib/snapd/snap/bin/" # snap bins
[ -d "/usr/bin/core_perl/" ] && PATH="$PATH:/usr/bin/core_perl/"           # perl core bins
[ -d "/usr/bin/vendor_perl/" ] && PATH="$PATH:/usr/bin/vendor_perl/"       # perl vendor bins
[ -d "$HOME/.local/bin/" ] && PATH="$PATH:$HOME/.local/bin/"               # local bins
[ -d "$HOME/.nimble/bin" ] && PATH="$PATH:$HOME/.nimble/bin"               # nim bins
[ -d "$HOME/.cargo/bin" ] && PATH="$PATH:$HOME/.cargo/bin"                 # rust bins
[ -d "$HOME/.krew/bin" ] && PATH="$PATH:$HOME/.krew/bin"                   # krew bins
[ -d "$HOME/.asdf" ] && . $HOME/.asdf/asdf.sh                              # asdf bins
export PATH

# also provide local /bin -> /share/man pages
MANPATH=""
[ -d "$HOME/.local/share/man" ] && MANPATH="$MANPATH:$HOME/.local/share/man"
export MANPATH
