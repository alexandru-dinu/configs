echo "CONFIGURING VIM..."
rm -rf $HOME/.vim*
ln -s `realpath vim/.vimrc` $HOME/.vimrc
git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "DONE..."
echo

echo "CONFIGURING GHCI..."
rm -f $HOME/.ghci
ln -s `realpath ghci/.ghci` $HOME/.ghci
chmod go-w $HOME/.ghci
echo "DONE..."
echo 

echo "CONFIGURING VSCODE..."
VSCODE_CFG_DIR=$HOME/.config/Code/User

rm -rf $HOME/.vscode
rm -rf $HOME/.config/Code
mkdir -p $VSCODE_CFG_DIR
ln -s $(realpath vscode/keybindings.json) $VSCODE_CFG_DIR/keybindings.json
ln -s $(realpath vscode/settings.json) $VSCODE_CFG_DIR/settings.json

code --install-extension geeebe.duplicate
code --install-extension gerane.theme-sunburst
code --install-extension justusadam.language-haskell
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptoolscat 
echo "DONE"
echo

echo "CONFIGURING TERMINATOR..."
rm -rf  $HOME/.config/terminator
mkdir -p $HOME/.config/terminator
ln -s $(realpath terminals/terminator.settings) $HOME/.config/terminator/config
echo "DONE"
echo
