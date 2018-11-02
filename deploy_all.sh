green=`tput setaf 2`
reset=`tput sgr0`


read -p "${green}CONFIGURE ZSH? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    rm -rf $HOME/.zshrc
    cp `realpath zsh/.zshrc` $HOME/.zshrc
    echo
fi


read -p "${green}CONFIGURE VIM? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    rm -rf $HOME/.vim*
    ln -s `realpath vim/.vimrc` $HOME/.vimrc
    git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    echo
fi


read -p "${green}CONFIGURE GHCI? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    rm -f $HOME/.ghci
    ln -s `realpath ghci/.ghci` $HOME/.ghci
    chmod go-w $HOME/.ghci
    echo
fi


read -p "${green}CONFIGURE GDB? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    rm -rf $HOME/peda
    rm -rf $HOME/.gdbinit
    git clone https://github.com/longld/peda.git $HOME/peda
    ln -s `realpath gdb/.gdbinit` $HOME/.gdbinit
    echo
fi


read -p "${green}CONFIGURE VSCODE? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    VSCODE_CFG_DIR=$HOME/.config/Code/User

    rm -rf $HOME/.vscode
    rm -rf $HOME/.config/Code
    mkdir -p $VSCODE_CFG_DIR
    ln -s `realpath vscode/keybindings.json` $VSCODE_CFG_DIR/keybindings.json
    ln -s `realpath vscode/settings.json` $VSCODE_CFG_DIR/settings.json

    code --install-extension geeebe.duplicate
    code --install-extension justusadam.language-haskell
    code --install-extension ms-python.python
    code --install-extension ms-vscode.cpptools
    code --install-extension 13xforever.language-x86-64-assembly
    echo
fi


read -p "${green}CONFIGURE TERMINATOR? [y/n] ${reset}" b
if [ "$b" = 'y' ]; then
    rm -rf  $HOME/.config/terminator
    mkdir -p $HOME/.config/terminator
    ln -s `realpath terminals/terminator.settings` $HOME/.config/terminator/config
    echo
fi
