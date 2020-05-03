#=================================================================================================
#============================================ Syntax =============================================
#=================================================================================================


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Basic Syntax highlighting
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=green'
ZSH_HIGHLIGHT_STYLES[path]='fg=green'
#ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=green,bold'
#ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=red'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=blue'
# ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]=
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=red'
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]=
# ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]=
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=blue'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=blue'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red,dim'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='dim'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=black'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=blue'
ZSH_HIGHLIGHT_STYLES[default]='none'


# Brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,dim'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,dim'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue,dim'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=magenta,dim'
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='bg=red,bold'

# Custom patterns
ZSH_HIGHLIGHT_PATTERNS+=('sudo rm *' 'fg=white,bold,bg=red')
