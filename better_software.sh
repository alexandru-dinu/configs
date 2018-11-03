#!/bin/bash

# for app in /usr/share/applications/*.desktop; do echo "${app:24:-8}"; done
# https://kkovacs.eu/cool-but-obscure-unix-tools


# remove
sudo apt remove --purge "totem*"
sudo apt remove --purge "rhythmbox*"
sudo apt remove --purge "brasero*"
sudo apt remove --purge "parole*"
sudo apt remove --purge "catfish*"
sudo apt remove --purge "ristretto*"
sudo apt remove --purge "gedit*"
sudo apt remove --purge pidgin
sudo apt remove --purge xfburn
sudo apt remove --purge simple-scan
sudo apt remove --purge hplip
sudo apt remove --purge gnome-orca
sudo apt remove --purge evolution
sudo apt remove --purge fluid
sudo apt remove --purge gnome-mahjongg
sudo apt remove --purge gnome-mines
sudo apt remove --purge gnome-sudoku
sudo apt remove --purge "thunderbird*"
sudo apt remove --purge "mousepad*"
sudo apt remove --purge "remmina*"
sudo apt remove --purge libreoffice-gtk
sudo apt remove --purge xreader

# update
sudo apt update
sudo apt upgrade

# install
sudo apt install ssh zsh vim git terminator
sudo apt install ghc build-essential
sudo apt install qpdfview chromium-browser vlc
sudo apt install geeqie feh tree htop

# clean
sudo apt autoclean
sudo apt autoremove
