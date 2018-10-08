export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/alex/.oh-my-zsh

# Anaconda
export PATH="/home/alex/anaconda3/bin:$PATH"
# Cuda
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
# Stack
export PATH="/usr/local/bin/stack:$PATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zshmarks)

source $ZSH/oh-my-zsh.sh

# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# aliases
alias gdb="gdb -quiet"
alias cudachk="optirun python -c 'import torch; print(torch.cuda.is_available())'"
alias go="xdg-open"

cd_and_ls() {
    cd "$1" && ls
}

alias c="cd_and_ls"

sak() {
    eval $(ssh-agent -s) && ssh-add ~/.ssh/"$1"
}

rs() {
    [ "$1" = "x" ] && redshift -x || redshift -O "$1" -g 0.9
}

# directly download gdrive links
function gdrive_download () {
  CONFIRM=$(
  	wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies \
  	--no-check-certificate "https://docs.google.com/uc?export=download&id=$1" \
    -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p' \
  )
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}
