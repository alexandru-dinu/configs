#!/bin/sh

# This is a simplified version of the original script
# which also fixes the low-res switcher icon

DESKTOP_PATH="$HOME/.local/share/applications/"
DESKTOP_FILE="$DESKTOP_PATH/mendeleydesktop.desktop"
MENDELEYDESKTOP_BIN="$HOME/.local/share/mendeleydesktop"

if [ ! -d "$DESKTOP_PATH" ]; then
    mkdir -p "$DESKTOP_PATH"
fi

if [ ! -f "$1" ]; then
    echo "Mendeley Desktop binary '$1' does not exist"
    exit 1
fi

# create symlink from fixed location to last-used Mendeley Desktop
# binary
MENDELEYDESKTOP_REAL_BIN="$1"
ln -fs "$MENDELEYDESKTOP_REAL_BIN" "$MENDELEYDESKTOP_BIN"

# install .desktop file and re-build mime cache to enable
# mendeley:// link handler.
# If the contents of the .desktop file are changed, the X-Mendeley-Version
# key needs to be incremented
cat > "$DESKTOP_PATH/mendeleydesktop.desktop" <<EOF
[Desktop Entry]
Name=Mendeley Desktop
GenericName=Research Paper Manager
Comment=Mendeley Desktop is software for managing and sharing research papers
Exec=env LD_LIBRARY_PATH=/opt/mendeleydesktop/lib/mendeleydesktop/plugins/platforms $MENDELEYDESKTOP_BIN %f
Icon=mendeley-desktop
Terminal=false
Type=Application
Categories=Education;Literature;Qt;
X-SuSE-translate=false
MimeType=x-scheme-handler/mendeley;application/pdf;text/x-bibtex;
X-Mendeley-Version=1
StartupWMClass=mendeleydesktop.x86_64
EOF

update-desktop-database "$DESKTOP_PATH"
