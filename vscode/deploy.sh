CFG_DIR=$HOME/.config/Code/User

mkdir -p $CFG_DIR
ln -s $(realpath keybindings.json) $CFG_DIR/keybindings.json
ln -s $(realpath settings.json) $CFG_DIR/settings.json
