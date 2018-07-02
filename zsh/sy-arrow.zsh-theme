if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="blue"; fi

PROMPT='%{$fg[$NCOLOR]%}> %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxCxegexcxcxbxbx"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;32:bd=34;46:cd=34:su=32:sg=32:tw=31:ow=31"
