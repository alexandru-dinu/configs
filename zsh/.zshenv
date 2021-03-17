export LANG=en_US.UTF-8
export LC_ALL=$LANG

export FZF_DEFAULT_OPS="--extended"
export npm_config_prefix=$HOME/.node_modules

if [[ -z $TMUX ]]; then
    export PATH=$HOME/anaconda3/bin:$PATH
    export PATH=$HOME/.node_modules/bin:$PATH
fi
