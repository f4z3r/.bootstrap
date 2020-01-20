# exports

set -g theme_display_git_master_branch yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_project_dir_length 1
set -g theme_display_k8s_context yes
set -g theme_display_virtualenv yes
set -g theme_display_user ssh
set -g theme_nerd_fonts yes
set -g theme_display_hostname ssh
set -g theme_color_scheme dark
set -g theme_display_cmd_duration yes
set -g theme_newline_prompt 'fish> '

if [ -d ~/.local/bin/ ]
  set PATH /home/jakob/.local/bin/ $PATH
end

set PATH . $PATH
set -g VISUAL vim

kitty + complete setup fish | source

set -x TERM xterm-256color
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x FZF_DEFAULT_COMMAND 'command ag --hidden --ignore .git --ignore .cache -g ""'

# source only if file exists
if [ -f ~/.asdf/asdf.fish ]
  source ~/.asdf/asdf.fish
end
