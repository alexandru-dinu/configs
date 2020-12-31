export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="own"

CASE_SENSITIVE="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# plugins: ~/.oh-my-zsh/plugins/*
# custom plugins: ~/.oh-my-zsh/custom/plugins/
plugins=(fzf git zshmarks zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/gizmos.git/zsh/aliases.sh
