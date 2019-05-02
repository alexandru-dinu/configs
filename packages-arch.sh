#!/bin/bash

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
    "totem"            "rhythmbox"        "brasero"
    "parole"           "catfish*"         "ristretto"
    "gedit"            "pidgin"           "xfburn"
    "simple-scan"      "hplip"            "gnome-orca"
    "evolution"        "fluid"            "gnome-mahjongg"
    "gnome-mines"      "gnome-sudoku"     "thunderbird"
    "mousepad"         "remmina"          "xreader"
    "tomboy"           "timeshift"        "screenfetch"
    "gnome-terminal"   "xfce4-terminal"   "xterm"
)

# remove packages
for p in "${to_remove[@]}"; do red_prompt "$p"; sudo pacman -Rcns "$p"; done

sudo pacman -Syu
sudo pacman -R `pacman -Qdtq`
sudo pacman -Scc
