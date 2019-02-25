#!/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

prompt () {
    echo -e "${green}$1${reset}"
}


config_zsh () {
    prompt "Configuring Oh-My-Zsh"

    rm -rf ~/.zshrc ~/.zshenv ~/.oh-my-zsh
    echo "exit" | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    cp zsh/.zshrc ~/.zshrc
    cp zsh/.zshenv ~/.zshenv

    prompt "zshmarks"
    git clone --depth=1 https://github.com/jocelynmallon/zshmarks.git ~/.oh-my-zsh/custom/plugins/zshmarks

    prompt "zsh-syntax-highlighting"
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    prompt "custom theme"
    cp zsh/robbyrussell.zsh-theme ~/.oh-my-zsh/themes/

    prompt "custom git show"
    mv ~/.oh-my-zsh/lib/git.zsh ~/.oh-my-zsh/lib/git.zsh.orig
    (cat zsh/git.zsh ; echo ""; cat ~/.oh-my-zsh/lib/git.zsh.orig) > ~/.oh-my-zsh/lib/git.zsh
    rm ~/.oh-my-zsh/lib/git.zsh.orig
    cd ~/.oh-my-zsh && git add . && git commit -m "Custom." && cd -

    prompt "environment variables"
    local l=5

    echo "anaconda2? [y/n]" && read a
    [ $a == 'y' ] && ex -s -c "$l"'a|export PATH=~/anaconda2/bin:$PATH' -c x ~/.zshenv && l=$((l+1))

    echo "anaconda3? [y/n]" && read a
    [ $a == 'y' ] && ex -s -c "$l"'a|export PATH=~/anaconda3/bin:$PATH' -c x ~/.zshenv && l=$((l+1))

    echo "cuda? [y/n]" && read c
    [ $c == 'y' ] && ex -s -c "$l"'a|export PATH=/usr/local/cuda/bin:$PATH' -c x ~/.zshenv && l=$((l+1))
    [ $c == 'y' ] && ex -s -c "$l"'a|export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' -c x ~/.zshenv && l=$((l+1))

    prompt "Done"
}

config_vim () {
    prompt "Configuring vim"

    rm -rf ~/.vim*
    ln -s `realpath vim/.vimrc` ~/.vimrc
    git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

    prompt "Done"
}

config_spacemacs () {
    prompt "Configuring spacemacs"

    rm -rf ~/.emacs.d
    git clone --depth=1 https://github.com/syl20bnr/spacemacs ~/.emacs.d
    ln -sf `realpath spacemacs/.spacemacs` ~/.spacemacs

    prompt "Done"
}

config_ghci () {
    prompt "Configuring ghci"

    rm -f ~/.ghci
    ln -s `realpath ghci/.ghci` ~/.ghci
    chmod go-w ~/.ghci

    prompt "Done"
}

config_gdb () {
    prompt "Configuring gdb"

    rm -rf ~/peda ~/.gdbinit
    git clone --depth=1 https://github.com/longld/peda.git ~/peda
    ln -s `realpath gdb/.gdbinit` ~/.gdbinit

    prompt "Done"
}

config_vscode () {
    prompt "Configuring vscode"

    VSCODE_CFG_DIR=~/.config/Code/User

    rm -rf ~/.vscode ~/.config/Code
    mkdir -p $VSCODE_CFG_DIR

    declare -a configs=("keybindings.json" "settings.json")

    for c in "${configs[@]}"
    do
        ln -s `realpath vscode/$c` $VSCODE_CFG_DIR/
    done

    declare -a vscode_exts=(
        "gerane.theme-sunburst"
        "geeebe.duplicate"
        "justusadam.language-haskell"
        "ms-python.python"
        "ms-vscode.cpptools"
        "13xforever.language-x86-64-assembly"
        "gruntfuggly.todo-tree"
    )

    for ext in "${vscode_exts[@]}"
    do
        code --install-extension $ext
    done

    prompt "Done"
}

config_jetbrains () {
    prompt "Configuring JetBrains"

    declare -a cfg_dirs=(
        $(find ~ -name ".PyCharm")
        $(find ~ -name ".CLion")
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

    rm -rf  ~/.config/terminator
    mkdir -p ~/.config/terminator
    ln -s `realpath terminals/terminator.settings` ~/.config/terminator/config

    prompt "Done"
}

config_i3 () {
    prompt "Configuring i3"

    rm -rf ~/.config/i3 ~/.config/rofi ~/.config/compton
    mkdir -p ~/.config/i3 ~/.config/rofi ~/.config/compton

    declare -a configs=("config" "i3status.conf" "i3blocks.conf")

    for c in "${configs[@]}"
    do
        ln -s `realpath i3/$c` ~/.config/i3/
    done

    ln -s `realpath i3/rofi.conf` ~/.config/rofi/config
    ln -s `realpath i3/compton.conf` ~/.config/compton/config

    declare -a extras=("blurlock" "i3exit")

    for e in "${extras[@]}"
    do
        sudo cp --remove-destination i3/$e /usr/bin/ &&
        sudo chown $USER:$USER /usr/bin/$e &&
        sudo chmod +x /usr/bin/$e
    done

    prompt "Done"
}

config_ipython () {
    prompt "Configuring IPython"

    ln -sf `realpath ipython/ipython_config.py` ~/.ipython/profile_default/

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
