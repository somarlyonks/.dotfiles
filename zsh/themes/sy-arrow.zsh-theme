if [ $UID -eq 0 ]; then
    NCOLOR="red";
elif [[ -n $SSH_CONNECTION ]]; then
    NCOLOR="yellow";
else
    NCOLOR="blue";
fi

shrink_path () {
    setopt localoptions
    setopt rc_quotes null_glob

    typeset -a tree expn
    typeset result part dir=${1-$PWD}
    typeset -i i

    [[ -d $dir ]] || return 0

    for part in ${(k)nameddirs}; {
        [[ $dir == ${nameddirs[$part]}(/*|) ]] && dir=${dir/${nameddirs[$part]}/\~$part}
    }
    dir=${dir/$HOME/\~}
    tree=(${(s:/:)dir})
    (
        unfunction chpwd 2> /dev/null
        if [[ $tree[1] == \~* ]] {
            cd ${~tree[1]}
            result=$tree[1]
            shift tree
        } else {
            cd /
        }
        for dir in $tree; {
            if (( $#tree == 1 )) {
                result+="/$tree"
                break
            }
            expn=(a b)
            part=''
            i=0
            until [[ (( ${#expn} == 1 )) || $dir = $expn || $i -gt 99 ]]  do
                (( i++ ))
                part+=$dir[$i]
                expn=($(echo ${part}*(-/)))
                break
            done
            result+="/$part"
            cd $dir
            shift tree
        }
        echo ${result:-/}
    )
}

PROMPT='%{$fg[$NCOLOR]%}> %{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}$(shrink_path)$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxCxegexcxcxbxbx"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=1;32:bd=34;46:cd=34:su=32:sg=32:tw=31:ow=31"
