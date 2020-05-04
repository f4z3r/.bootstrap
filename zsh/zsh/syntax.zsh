#=================================================================================================
#============================================ Syntax =============================================
#=================================================================================================


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Basic Syntax highlighting
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=8,bold' # grey
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'
ZSH_HIGHLIGHT_STYLES[alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=27' # dodger blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=96'  # plum 4
ZSH_HIGHLIGHT_STYLES[function]='fg=174,bold' # light pink 3
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=green'
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=77' # pale green 3
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=red'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]=
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=52' # dark red
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=blue'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=52' # dark red
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=3' # olive
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=3' # olive
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=3,bold' # olive
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='dim'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8' # grey
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=58' # orange 4
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=58' # orange 4
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[default]='none'


# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=178' # gold 3
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=133' # medium orchid 3
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=229' # wheat 1
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=103' # light slate grey
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='bg=black,bold'

# Custom patterns
ZSH_HIGHLIGHT_PATTERNS+=('sudo rm *' 'fg=white,bold,bg=red')
