export npm_config_prefix=$HOME/.node_modules

if [[ -z $TMUX ]]; then
    export PATH=$HOME/miniconda3/bin:$PATH
    export PATH=$HOME/.node_modules/bin:$PATH
fi
