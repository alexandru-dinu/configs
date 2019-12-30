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
    "parole"           "catfish"          "ristretto"
    "gedit"            "pidgin"           "xfburn"
    "simple-scan"      "hplip"            "gnome-orca"
    "evolution"        "fluid"            "gnome-mahjongg"
    "gnome-mines"      "gnome-sudoku"     "thunderbird"
    "mousepad"         "remmina"          "xreader"
    "tomboy"           "timeshift"        "screenfetch"
    "gnome-terminal"   "xfce4-terminal"   "xterm"
    "parcellite"       "xplayer"          "hexchat"
)

declare -a to_install=(
    "build-essential" "cmake" "ssh" "zsh"
    "yay" "htop" "glances" "tree" "aria2" "tig" "cloc" "xclip" "mtr" "tmux" "dstat"
    "powertop" "silversearcher-ag" "mlocate"
    "geeqie" "feh" "bless" "meld"
    "ghc" "hoogle" "neofetch" "vlc" "solaar"
)

green_prompt "Removing packages"
for p in "${to_remove[@]}"; do red_prompt "$p"; sudo pacman -Rcns "$p"; done

green_prompt "Installing packages"
for p in "${to_install[@]}"; do green_prompt "$p"; sudo pacman -S --needed $p; done

green_prompt "Cleaning"
sudo pacman -Syu
sudo pacman -R `pacman -Qdtq`
yes | sudo pacman -Scc

green_prompt "Updatedb..."
sudo updatedb
