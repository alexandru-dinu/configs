CFG_DIR=$HOME/.config/Code/User

mkdir -p $CFG_DIR
cp $(realpath keybindings.json) $CFG_DIR/keybindings.json
cp $(realpath settings.json) $CFG_DIR/settings.json
