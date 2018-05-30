# Path

export ZSH=/home/sy/.oh-my-zsh

autoload -U compinit promptinit
compinit

# Theme

ZSH_THEME="sy-arrow"

# Plugin

plugins=(
  git
)

# oh-my-zsh

source $ZSH/oh-my-zsh.sh

# User configuration

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
export TERM="screen-256color"
export JAVA_HOME=/opt/java/jdk
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

# Alias

alias curl="noglob curl"
