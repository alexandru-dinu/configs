export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git zshmarks zsh-syntax-highlighting)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[comment]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=magenta,bold'

source $ZSH/oh-my-zsh.sh
source $HOME/configs.git/zsh/aliases.sh
