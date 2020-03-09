#!/bin/bash

# vars

green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`

# utils

prompt () {
    echo -e "${green}> $1${reset}"
}

red_prompt () {
    echo -e "${red}> $1${reset}"
}

realpath() {
    if [[ $(uname -s) = 'Darwin' ]]; then
        [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
    else
        /usr/bin/realpath "$1"
    fi
}

# configs

config_zsh () {
    prompt "Configuring Oh-My-Zsh"

    rm -rf ~/.zshrc ~/.zshenv ~/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    cp zsh/.zshrc ~/.zshrc
    cp zsh/.zshenv ~/.zshenv

    prompt "zshmarks"
    git clone --depth=1 https://github.com/jocelynmallon/zshmarks.git ~/.oh-my-zsh/custom/plugins/zshmarks

    prompt "zsh-autosuggestions"
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    prompt "custom theme"
    cp zsh/own.zsh-theme ~/.oh-my-zsh/themes/

    prompt "custom git show"
    mv ~/.oh-my-zsh/lib/git.zsh ~/.oh-my-zsh/lib/git.zsh.orig
    (cat zsh/git.zsh ; echo ""; cat ~/.oh-my-zsh/lib/git.zsh.orig) > ~/.oh-my-zsh/lib/git.zsh
    rm ~/.oh-my-zsh/lib/git.zsh.orig

    prompt "custom conda show"
    cp zsh/conda.zsh ~/.oh-my-zsh/lib/

    prompt "commit custom changes"
    cd ~/.oh-my-zsh && git add . && git commit -m "Custom." && cd -

    prompt "environment variables"
    python ~/gizmos.git/setup_zshenv.py

    prompt "Done"
}

config_bash () {
    # need bash for root shell
    prompt "Configuring bash"

    cp bash/.bashrc ~/.bashrc
    sudo cp bash/.bashrc.root /root/.bashrc

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

config_ruby () {
    prompt "Configuring ruby"

    gem install irbtools

    rm -f ~/.irbrc
    ln -s `realpath ruby/.irbrc` ~/.irbrc
    chmod go-w ~/.irbrc

    prompt "Done"
}

config_gdb () {
    prompt "Configuring gdb"

    rm -rf ~/peda ~/.gdbinit
    git clone --depth=1 https://github.com/longld/peda.git ~/peda
    ln -s `realpath gdb/.gdbinit` ~/.gdbinit

    prompt "Done"
}

config_tmux () {
    prompt "Configuring tmux"

    rm -f ~/.tmux.conf
    ln -s `realpath tmux/.tmux.conf` ~/.tmux.conf

    prompt "Done"
}

config_vscode () {
    prompt "Configuring vscode"

    cfg_dir=~/.config/Code/User
    ext_dir=~/.vscode/extensions
    server_cfg_dir=~/.local/share/code-server/User

    rm -rf ~/.vscode ~/.config/Code ~/.local/share/code-server/User
    mkdir -p $cfg_dir
    mkdir -p $server_cfg_dir

    declare -a configs=("keybindings.json" "settings.json")

    for c in "${configs[@]}"
    do
        ln -s `realpath vscode/$c` $cfg_dir/
        ln -s `realpath vscode/$c` $server_cfg_dir/
    done

    declare -a vscode_exts=(
        "geeebe.duplicate"
        "justusadam.language-haskell"
        "ms-python.python"
        "ms-vscode.cpptools"
        "13xforever.language-x86-64-assembly"
        "shd101wyy.markdown-preview-enhanced"
        "torn4dom4n.latex-support"
    )

    for ext in "${vscode_exts[@]}"
    do
        code --install-extension $ext
    done

    ln -s `realpath vscode/darcula-minimal` $ext_dir

    prompt "Done"
}

config_pycharm() {
    prompt "Configuring PyCharm"

    cfg_dir=$(find ~ -name ".PyCharm*" 2>/dev/null | head -n 1)

    echo "Found $cfg_dir"

    for d in `ls jetbrains/pycharm | grep -v options`
    do
        rm -rf $cfg_dir/config/$d
        ln -s `realpath jetbrains/pycharm/$d` $cfg_dir/config/$d
    done

    for o in `ls jetbrains/pycharm/options`
    do
        rm -rf $cfg_dir/config/options/$o
        ln -s `realpath jetbrains/pycharm/options/$o` $cfg_dir/config/options/$o
    done

    prompt "Done"
}

config_idea() {
    prompt "Configuring IDEA"

    cfg_dir=$(find ~ -name ".Idea*" 2>/dev/null | head -n 1)

    echo "Found $cfg_dir"

    for d in `ls jetbrains/idea | grep -v options`
    do
        rm -rf $cfg_dir/config/$d
        ln -s `realpath jetbrains/pycharm/$d` $cfg_dir/config/$d
    done

    for o in `ls jetbrains/pycharm/options`
    do
        rm -rf $cfg_dir/config/options/$o
        ln -s `realpath jetbrains/pycharm/options/$o` $cfg_dir/config/options/$o
    done

    prompt "Done"
}

config_conda () {
    prompt "Configuring conda"

    ln -sf `realpath conda/.condarc` ~/.condarc

    prompt "Done"
}

config_jupyter () {
    prompt "Configuring jupyter"

    cfg_dir=~/.jupyter/custom

    mkdir -p $cfg_dir

    cfgs=("custom.css" "custom.js")

    for f in "${cfgs[@]}"
    do
        rm -rf $cfg_dir/$f
        ln -s `realpath jupyter/$f` $cfg_dir/$f
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

config_guake () {
    prompt "Configuring guake"

    dconf load /apps/guake/ < ./terminals/guake.dconf

    prompt "Done"
}

config_i3 () {
    prompt "Configuring i3"

    rm -rf ~/.config/i3 ~/.config/compton
    mkdir -p ~/.config/i3 ~/.config/compton

    declare -a configs=("config" "i3status.conf" "i3blocks.conf")

    for c in "${configs[@]}"
    do
        ln -s `realpath i3/$c` ~/.config/i3/
    done

    ln -s `realpath i3/compton.conf` ~/.config/compton/config

    for b in $(ls i3/bin)
    do
        sudo cp --remove-destination i3/bin/$b /usr/bin/ &&
        sudo chown $USER:$USER /usr/bin/$b &&
        sudo chmod +x /usr/bin/$b
    done

    # remove default i3blocks dir
    sudo rm -rf /usr/share/i3blocks

    prompt "Done"
}

config_rofi () {
    prompt "Configuring rofi"

    cfg_dir=~/.config/rofi

    rm -rf ${cfg_dir} && mkdir -p ${cfg_dir}
    ln -s `realpath rofi/rofi.conf` ${cfg_dir}/config

    prompt "Done"
}

config_mxmaster () {
    prompt "Configuring MX Master"

    sudo ln -sf `realpath mx-master/logid.cfg` /etc/

    prompt "Done"
}

config_ipython () {
    prompt "Configuring IPython"

    cfg_dir=~/.ipython/profile_default
    mkdir -p $cfg_dir
    ln -sf `realpath ipython/ipython_config.py` $cfg_dir

    prompt "Done"
}

config_git () {
    prompt "Configuring git"

    set -x

    git config --global push.default matching
    git config --global pull.rebase true
    git config --global core.fileMode false
    git config --global core.editor vim
    git config --global core.eol = lf

    set +x

    prompt "Done"
}

config_firefox () {
    prompt "Configuring firefox"

    for p in `ls firefox/*-patch`; do python firefox/patch.py $p; done

    prompt "Done"
}

config_fonts () {
    prompt "Installing fonts"

    fonts_dir="$HOME/.local/share/fonts"

    rm -rf $fonts_dir && mkdir -p $fonts_dir

    echo $(ls fonts | sort)

    for f in `ls fonts`; do cp fonts/$f/* $fonts_dir; done

    prompt "Done"
}

config_cinnamon () {
    prompt "Configuring cinnamon"

    js_dir="/usr/share/cinnamon/js/ui"

    dconf load /org/cinnamon/ < ./cinnamon/cinnamon.dconf

    sudo vim ${js_dir}/workspacesView.js
    sudo vim ${js_dir}/windowManager.js
}

config_misc () {
    prompt "Configuring .xbindkeysrc"

    ln -sf `realpath misc/.xbindkeysrc` ~/.xbindkeysrc
    xbindkeys --poll-rc

    prompt "Configuring headphones-eq"
    mkdir -p ~/.local/bin
    ln -sf `realpath misc/headphones-eq.sh` ~/.local/bin/hpeq

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
        for item in "$@"
        do
            echo $(get_configs) | grep -qw $item
            if [ $? -eq 0 ]; then config_$item; else red_prompt "No config for $item"; fi
        done
        ;;
esac
