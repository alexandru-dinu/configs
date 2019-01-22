#!/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

declare -a vscode_exts=(
    "gerane.theme-sunburst"
    "geeebe.duplicate"
    "justusadam.language-haskell"
    "ms-python.python"
    "ms-vscode.cpptools"
    "13xforever.language-x86-64-assembly"
)


config_zsh () {
    echo "${green}Configuring Oh-My-Zsh...${reset}"

    rm -rf $HOME/.zshrc
    rm -rf $HOME/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp zsh/.zshrc $HOME/.zshrc

    echo "zshmarks"
    git clone https://github.com/jocelynmallon/zshmarks.git $HOME/.oh-my-zsh/custom/plugins/zshmarks
    echo "custom theme"
    cp zsh/robbyrussell.zsh-theme $HOME/.oh-my-zsh/themes/
    echo "custom git show"
    mv $HOME/.oh-my-zsh/lib/git.zsh $HOME/.oh-my-zsh/lib/git.zsh.orig
    cat zsh/git.zsh | cat - $HOME/.oh-my-zsh/lib/git.zsh.orig > $HOME/.oh-my-zsh/lib/git.zsh

    echo "env-vars"
    ex -s -c '6i|export PATH=$HOME/anaconda3/bin:$PATH' -c x $HOME/.zshrc
    ex -s -c '7i|export PATH=/usr/local/cuda/bin:$PATH' -c x $HOME/.zshrc
    ex -s -c '8i|export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' -c x $HOME/.zshrc

    echo "Done!"
}

config_vim () {
    echo "${green}Configuring vim...${reset}"

    rm -rf $HOME/.vim*
    ln -s `realpath vim/.vimrc` $HOME/.vimrc
    git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    echo "Done!"
}

config_ghci () {
    echo "${green}Configuring ghci...${reset}"

    rm -f $HOME/.ghci
    ln -s `realpath ghci/.ghci` $HOME/.ghci
    chmod go-w $HOME/.ghci

    echo "Done"
}

config_gdb () {
    echo "${green}Configuring gdb...${reset}"

    rm -rf $HOME/peda
    rm -rf $HOME/.gdbinit
    git clone https://github.com/longld/peda.git $HOME/peda
    ln -s `realpath gdb/.gdbinit` $HOME/.gdbinit

    echo "Done!"
}

config_vscode () {
    echo "${green}Configuring vscode...${reset}"

    VSCODE_CFG_DIR=$HOME/.config/Code/User

    rm -rf $HOME/.vscode
    rm -rf $HOME/.config/Code
    mkdir -p $VSCODE_CFG_DIR
    ln -s `realpath vscode/keybindings.json` $VSCODE_CFG_DIR/keybindings.json
    ln -s `realpath vscode/settings.json` $VSCODE_CFG_DIR/settings.json

    for ext in "${vscode_exts[@]}"
    do
        code --install-extension $ext
    done

    echo "Done!"
}

config_jetbrains () {
    echo "${green}Configuring JetBrains...${reset}"

    PYCHARM_CFG_DIR=$(locate .PyCharm -n 1)
    rm -rf $PYCHARM_CFG_DIR/config/keymaps
    ln -s `realpath jetbrains/keymaps` $PYCHARM_CFG_DIR/config/keymaps
    echo "Keymaps for PyCharm set."

    echo "Done!"
}

config_terminator () {
    echo "${green}Configuring terminator...${reset}"

    rm -rf  $HOME/.config/terminator
    mkdir -p $HOME/.config/terminator
    ln -s `realpath terminals/terminator.settings` $HOME/.config/terminator/config

    echo "Done!"
}

config_i3 () {
    echo "${green}Configuring i3...${reset}"

    rm -rf $HOME/.config/i3
    mkdir $HOME/.config/i3
    ln -s `realpath i3/config` $HOME/.config/i3/config
    ln -s `realpath i3/i3status.conf` $HOME/.config/i3/i3status.conf
    ln -s `realpath i3/i3blocks.conf` $HOME/.config/i3/i3blocks.conf

    echo "Done!"
}

get_configs () {
    grep -oE "^config_[a-z0-9]+" $0
}

help () {
    echo "Usage: $0 --all OR $0 <pkg_name>\n"
    echo "Can configure following packages:"
    get_configs | cut -d"_" -f2
}


case "$1" in
    ""|--help|-h)
        help
        ;;
    --all)
        for cfg in $(get_configs); do $cfg; done
        ;;
    *)
        for item in "$@"; do config_$item; done
        ;;
esac
