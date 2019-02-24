#!/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

prompt () {
    echo -e "${green}$1${reset}"
}

declare -a vscode_exts=(
    "gerane.theme-sunburst"
    "geeebe.duplicate"
    "justusadam.language-haskell"
    "ms-python.python"
    "ms-vscode.cpptools"
    "13xforever.language-x86-64-assembly"
    "gruntfuggly.todo-tree"
)


config_zsh () {
    prompt "Configuring Oh-My-Zsh"

    rm -rf $HOME/.zshrc
    rm -rf $HOME/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp zsh/.zshrc $HOME/.zshrc

    echo "zshmarks"
    git clone https://github.com/jocelynmallon/zshmarks.git $HOME/.oh-my-zsh/custom/plugins/zshmarks

    echo "zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    echo "custom theme"
    cp zsh/robbyrussell.zsh-theme $HOME/.oh-my-zsh/themes/

    echo "custom git show"
    mv $HOME/.oh-my-zsh/lib/git.zsh $HOME/.oh-my-zsh/lib/git.zsh.orig
    (cat zsh/git.zsh ; echo ""; cat $HOME/.oh-my-zsh/lib/git.zsh.orig) > $HOME/.oh-my-zsh/lib/git.zsh
    rm $HOME/.oh-my-zsh/lib/git.zsh.orig
    cd $HOME/.oh-my-zsh && git add . && git commit -m "Custom." && cd -

    echo "env-vars"

    echo "anaconda? [y/n]" && read a
    [ $a == 'y' ] && ex -s -c '5i|export PATH=$HOME/anaconda3/bin:$PATH' -c x $HOME/.zshrc
    echo "cuda? [y/n]" && read c
    [ $c == 'y' ] && ex -s -c '6i|export PATH=/usr/local/cuda/bin:$PATH' -c x $HOME/.zshrc
    [ $c == 'y' ] && ex -s -c '7i|export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' -c x $HOME/.zshrc

    prompt "Done"
}

config_vim () {
    prompt "Configuring vim"

    rm -rf $HOME/.vim*
    ln -s `realpath vim/.vimrc` $HOME/.vimrc
    git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    prompt "Done"
}

config_spacemacs () {
    prompt "Configuring spacemacs"

    rm -rf $HOME/.emacs.d
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ln -s `realpath spacemacs/.spacemacs` $HOME/.spacemacs

    prompt "Done"
}

config_ghci () {
    prompt "Configuring ghci"

    rm -f $HOME/.ghci
    ln -s `realpath ghci/.ghci` $HOME/.ghci
    chmod go-w $HOME/.ghci

    prompt "Done"
}

config_gdb () {
    prompt "Configuring gdb"

    rm -rf $HOME/peda
    rm -rf $HOME/.gdbinit
    git clone https://github.com/longld/peda.git $HOME/peda
    ln -s `realpath gdb/.gdbinit` $HOME/.gdbinit

    prompt "Done"
}

config_vscode () {
    prompt "Configuring vscode"

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

    prompt "Done"
}

config_jetbrains () {
    prompt "Configuring JetBrains"

    declare -a cfg_dirs=(
        $(find $HOME -name ".PyCharm")
        $(find $HOME -name ".CLion")
    )

    for d in "${cfg_dirs[@]}"
    do
        rm -rf $d/config/keymaps
        ln -s `realpath jetbrains/keymaps` $d/config/keymaps
        echo "Keymaps for [$d] set."
    done

    prompt "Done"
}

config_terminator () {
    prompt "Configuring terminator"

    rm -rf  $HOME/.config/terminator
    mkdir -p $HOME/.config/terminator
    ln -s `realpath terminals/terminator.settings` $HOME/.config/terminator/config

    prompt "Done"
}

config_i3 () {
    prompt "Configuring i3"

    rm -rf $HOME/.config/i3
    mkdir $HOME/.config/i3
    ln -s `realpath i3/config` $HOME/.config/i3/config
    ln -s `realpath i3/i3status.conf` $HOME/.config/i3/i3status.conf
    ln -s `realpath i3/i3blocks.conf` $HOME/.config/i3/i3blocks.conf

    sudo cp i3/blurlock /usr/bin/ && sudo chown $USER:$USER /usr/bin/blurlock && sudo chmod +x /usr/bin/blurlock
    sudo cp i3/i3exit /usr/bin/ && sudo chown $USER:$USER /usr/bin/i3exit && sudo chmod +x /usr/bin/i3exit

    prompt "Done"
}

config_ipython () {
    prompt "Configuring IPython"

    ln -sf `realpath ipython/ipython_config.py` $HOME/.ipython/profile_default/

    prompt "Done"
}

config_git () {
    prompt "Configuring git"

    git config --global pull.rebase true
    git config --global core.fileMode false
    git config --global core.editor vim

    prompt "Done"
}


get_configs () {
    grep -oE "^config_[a-z0-9]+" $0 | cut -d"_" -f2 | sort
}

help () {
    echo -e "Usage: $0 --all OR $0 <pkg_name>\n"
    echo "Can configure following packages:" && get_configs
}


case "$1" in
    ""|--help|-h)
        help
        ;;
    --list|-l)
        get_configs
        ;;
    --all)
        for cfg in $(get_configs); do $cfg; done
        ;;
    *)
        for item in "$@"; do config_$item; done
        ;;
esac
