export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cabal/bin:$PATH

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.dotfiles/zsh

ZSH_THEME="sy-arrow"

autoload -U compinit promptinit
compinit

# CASE_SENSITIVE="true"

# ENABLE_CORRECTION="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  zsh-autosuggestions
)
#   zsh-syntax-highlighting

# source ~/.oh-my-zsh/plugins/incr/incr-0.2.zsh
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export PROJECT_HOME=$HOME/Repos
export TERM="screen-256color"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_sy"

# proxy
export RPOXYCHAINS_SOCKS5=6489
# export HTTP_PROXY="socks5://127.0.0.1:6489"
# export HTTPS_PROXY="socks5://127.0.0.1:6489"
# export FTP_PROXY="socks5://127.0.0.1:6489"

# JAVA
export JAVA_HOME=/opt/java/jdk
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# Go
export GOPATH=$HOME/go

# C
# export ARCHFLAGS="-arch x86_64"

# python
export WORKON_HOME=$HOME/.virtualenvs
export PYTHONSTARTUP=$HOME/.pythonrc.py
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/.pyenv/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# alias
alias curl="noglob curl"
alias enw="emacs -nw"
# alias vi="nvim"
