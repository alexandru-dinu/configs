export LANG=en_US.UTF-8
export LC_ALL=$LANG

export ZSH=$HOME/.zsh/simple-zsh
export ZSH_CACHE_DIR=$HOME/.zsh/cache

ENABLE_CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
ENABLE_GIT_INFO="true"
ENABLE_CONDA_INFO="true"
ENABLE_VI_MODE="true"

plugins=(zshmarks zsh-autosuggestions)

source $ZSH/simple-zsh.zsh
source $HOME/gizmos.git/zsh/aliases.sh
