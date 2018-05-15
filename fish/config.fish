# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
eval (python -m virtualfish)

# alias
## redis
# alias redis="redis-server"

## vf
# alias venv="vf activate venv"

## game
# alias rungame="BUILD_TYPE='game' npm run page"

## bazaar4
# alias runserver="python -Wi manage.py runserver"
# alias migrate="python -Wi manage.py migrate"

## git
# alias rebase="git rebase master"

# theme
## bobthefish
# set -g theme_display_git yes
# set -g theme_display_git_untracked yes
# set -g theme_display_git_ahead_verbose yes
# set -g theme_git_worktree_support yes
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_hg yes
# set -g theme_display_virtualenv yes
# set -g theme_display_ruby no
# set -g theme_display_user no
# set -g theme_display_vi yes
# set -g theme_display_date no
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path no
# set -g theme_title_use_abbreviated_path yes
# set -g theme_date_format "%H:%M"
# set -g theme_avoid_ambiguous_glyphs yes
# set -g theme_powerline_fonts yes
# set -g theme_nerd_fonts no
# set -g theme_show_exit_status yes
# # set -g default_user "sy"
# set -g theme_color_scheme dark
# set -g fish_prompt_pwd_dir_length 1
# set -g theme_project_dir_length 1

