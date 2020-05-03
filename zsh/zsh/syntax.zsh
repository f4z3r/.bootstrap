#=================================================================================================
#============================================ Syntax =============================================
#=================================================================================================


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

ZSH_HIGHLIGHT_STYLES[default]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='red'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=green'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=green'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='none'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='bg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='bg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='bg=red'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='bg=red'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='none'

# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='bg=red'

# Custom patterns
ZSH_HIGHLIGHT_PATTERNS+=('sudo rm *' 'fg=white,bold,bg=red')
