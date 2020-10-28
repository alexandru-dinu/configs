#!/bin/bash

echo "Updating mirrors"
sudo pacman-mirrors --continent && sudo pacman -Syyu --ignore=cuda,cudnn

echo "Removing packages"
for p in `cat to_remove.txt`; do sudo pacman -Rcns "$p"; done

echo "Installing packages"
for p in `cat to_install.txt`; do sudo pacman -S --needed "$p"; done

echo "Cleaning"
sudo pacman -Rcns `pacman -Qdtq`
yes | sudo pacman -Scc

sudo updatedb
