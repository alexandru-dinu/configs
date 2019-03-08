#!/bin/bash

# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done
# https://kkovacs.eu/cool-but-obscure-unix-tools


red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

red_prompt () {
    echo -e "${red}$1${reset}"
}

green_prompt () {
    echo -e "${green}$1${reset}"
}


declare -a ppas=(
    "ppa:atareao/atareao"
    "ppa:dawidd0811/neofetch"
)

declare -a to_remove=(
    "totem*"            "rhythmbox*"        "brasero*"
    "parole*"           "catfish*"          "ristretto*"
    "gedit*"            "pidgin"            "xfburn"
    "simple-scan"       "hplip"             "gnome-orca"
    "evolution"         "fluid"             "gnome-mahjongg"
    "gnome-mines"       "gnome-sudoku"      "thunderbird*"
    "mousepad*"         "remmina*"          "xreader"
    "tomboy"            "timeshift"         "screenfetch"
    "gnome-terminal*"   "xfce4-terminal*"   "terminator"
)

declare -a to_install=(
    "build-essential"
    "ssh" "zsh" "git" "ghc" "vim" "emacs" "geeqie" "feh" "npm" "bless"
    "i3*" "compton" "lxappearance" "gnome-control-center" "xfce4-screenshooter" "nemo"
    "htop" "glances" "tree" "aria2" "tig" "cloc" "xclip" "mtr" "tmux" "dstat"
    "xkb-switch" "xautolock" "rofi" "powertop" "silversearcher-ag"
    "konsole" "rxvt*"
    "neofetch"
    "chromium-browser" "vlc"
)

declare -a npm_packages=(
    "imgur-upload-cli"
)

# remove packages
for p in "${to_remove[@]}"; do red_prompt "$p"; sudo apt remove --purge "$p"; done

# add ppas
for p in "${ppas[@]}"; do green_prompt "$p"; sudo add-apt-repository "$p"; done

sudo apt update && sudo apt upgrade

# install packages
for p in "${to_install[@]}"; do green_prompt "$p"; sudo apt install "$p"; done

# post-configs
sudo ln -sf /usr/bin/nodejs /usr/bin/node

# install npm packages
for p in "${npm_packages[@]}"; do green_prompt "$p"; (npm list -g | grep -q ${p}) || sudo npm install -g ${p}; done

# clean
sudo apt autoclean && sudo apt autoremove

green_prompt "Done"
