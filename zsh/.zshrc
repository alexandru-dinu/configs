export LANG=en_US.UTF-8
export LC_ALL=$LANG

export ZSH=$HOME/.zsh
export ZSH_FRAMEWORK=$ZSH/simple-zsh

ZSH_ENABLE_CASE_SENSITIVE="false"
ZSH_ENABLE_CORRECTION="true"
ZSH_ENABLE_GIT_INFO="true"
ZSH_ENABLE_CONDA_INFO="true"
ZSH_ENABLE_VI_MODE="true"

plugins=(fzf zshmarks zsh-autosuggestions)

source $ZSH_FRAMEWORK/simple-zsh.zsh
source $HOME/gizmos.git/zsh/aliases.sh
