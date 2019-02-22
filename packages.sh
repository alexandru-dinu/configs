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


declare -a to_remove=(
    "totem*" "rhythmbox*" "brasero*" "parole*" "catfish*"
    "ristretto*" "gedit*" "pidgin" "xfburn" "simple-scan"
    "hplip" "gnome-orca" "evolution" "fluid" "gnome-mahjongg"
    "gnome-mines" "gnome-sudoku" "thunderbird*" "mousepad*" "remmina*"
    "xreader"
)

declare -a essentials=(
    "build-essential"
    "vim" "emacs"
    "ssh" "zsh" "git" "ghc" "geeqie" "feh" "terminator" "npm"
    "chromium-browser" "vlc"
    "i3*"
)

declare -a gizmos=(
    "htop" "glances" "tree" "aria2" "tig" "cloc" "xclip" "mtr" "tmux" "dstat"
    "powertop"
    "silversearcher-ag"
    "xautolock" "rofi" "lxappearance"
)

declare -a npm_packages=(
    "imgur-upload-cli"
)

# remove unneeded packages
for p in "${to_remove[@]}"
do
    red_prompt "$p"
    sudo apt remove --purge "$p"
done


sudo apt update
sudo apt upgrade


# install essential packages
for p in "${essentials[@]}"
do
    green_prompt "$p"
    sudo apt install "$p"
done


# post-configs
sudo ln -sf /usr/bin/nodejs /usr/bin/node


# install npm packages
for p in "${npm_packages[@]}"
do
    green_prompt "$p"
    (npm list -g | grep -q ${p}) || sudo npm install -g ${p}
done

# install gizmos
for p in "${gizmos[@]}"
do
    green_prompt "$p"
    sudo apt install "$p"
done


# clean
sudo apt autoclean
sudo apt autoremove

green_prompt "Done"
