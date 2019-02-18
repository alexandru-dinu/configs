#!/bin/bash

# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done
# https://kkovacs.eu/cool-but-obscure-unix-tools


red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`


declare -a to_remove=(
    "totem*" "rhythmbox*" "brasero*" "parole*" "catfish*"
    "ristretto*" "gedit*" "pidgin" "xfburn" "simple-scan"
    "hplip" "gnome-orca" "evolution" "fluid" "gnome-mahjongg"
    "gnome-mines" "gnome-sudoku" "thunderbird*" "mousepad*" "remmina*"
    "libreoffice-gtk" "xreader"
)

declare -a essentials=(
    "build-essential"
    "ssh" "zsh" "vim" "git" "ghc" "geeqie" "feh" "terminator" "npm"
    "chromium-browser" "vlc"
)

declare -a gizmos=(
    "htop" "glances" "tree" "aria2" "tig" "cloc" "xclip" "mtr" "tmux" "dstat"
    "powertop"
    "silversearcher-ag"
    "xautolock" "rofi" "lxappearance"
)

declare -a npm_pkgs=(
    "imgur-upload-cli"
)

# remove unneeded pkgs
for p in "${to_remove[@]}"
do
    echo "${red}${p}${reset}"
    sudo apt remove --purge "$p"
done


sudo apt update
sudo apt upgrade


# install essential pkgs
for p in "${essentials[@]}"
do
    echo "${green}${p}${reset}"
    sudo apt install "$p"
done


# post-configs
sudo ln -sf /usr/bin/nodejs /usr/bin/node


# install npm pkgs
for p in "${npm_pkgs[@]}"
do
    echo "${green}${p}${reset}"
    (npm list -g | grep -q ${p}) || sudo npm install -g ${p}
done

# install gizmos
for p in "${gizmos[@]}"
do
    echo "${green}${p}${reset}"
    sudo apt install "$p"
done


# clean
sudo apt autoclean
sudo apt autoremove

echo -e "\n${green}Done!${reset}"
