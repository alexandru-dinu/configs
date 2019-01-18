#!/bin/bash

# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done
# https://kkovacs.eu/cool-but-obscure-unix-tools

declare -a pkgs=(
    "totem*"
    "rhythmbox*"
    "brasero*"
    "parole*"
    "catfish*"
    "ristretto*"
    "gedit*"
    "pidgin"
    "xfburn"
    "simple-scan"
    "hplip"
    "gnome-orca"
    "evolution"
    "fluid"
    "gnome-mahjongg"
    "gnome-mines"
    "gnome-sudoku"
    "thunderbird*"
    "mousepad*"
    "remmina*"
    "libreoffice-gtk"
    "xreader"
)

# remove
for p in "${pkgs[@]}"
do
    sudo apt remove --purge "$p"
done

# update
sudo apt update
sudo apt upgrade

# install
sudo apt install ssh zsh vim git terminator
sudo apt install ghc build-essential
sudo apt install chromium-browser vlc
sudo apt install geeqie feh tree htop
sudo apt install npm && sudo ln -sf /usr/bin/nodejs /usr/bin/node

# clean
sudo apt autoclean
sudo apt autoremove

# install gizmos
sudo npm install -g imgur-upload-cli

