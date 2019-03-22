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
    "ppa:gnome-terminator/nightly-gtk3"
    "ppa:atareao/atareao"
    "ppa:dawidd0811/neofetch"
    "ppa:danielrichter2007/grub-customizer"
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
    "gnome-terminal*"   "xfce4-terminal*"   "xterm"
    "google-chrome*"
)

declare -a to_install=(
    "build-essential"
    "ssh" "zsh" "vim" "emacs" "geeqie" "feh" "bless"
    "ghc" "hoogle"
    "i3*" "compton" "lxappearance" "gnome-control-center" "xfce4-screenshooter" "nemo"
    "htop" "glances" "tree" "aria2" "tig" "cloc" "xclip" "mtr" "tmux" "dstat" "grub-customizer"
    "xbacklight" "xkb-switch" "xautolock" "rofi" "powertop" "silversearcher-ag"
    "neofetch"
    "chromium-browser" "vlc"
)

declare -a pip3_packages=(
    "kaggle" "gpustat"
)

# remove packages
for p in "${to_remove[@]}"; do red_prompt "$p"; sudo apt-get purge -qq "$p"; done

# add ppas
for p in "${ppas[@]}"; do green_prompt "$p"; sudo add-apt-repository "$p"; done

sudo apt update && sudo apt upgrade

# install packages
for p in "${to_install[@]}"; do green_prompt "$p"; sudo apt-get install -qq "$p"; done

# terminator needs special treatment
echo "---" && sudo apt-cache policy terminator && echo "---"
echo "Select nightly version" && read ver
sudo aptitude install terminator=$ver

# install python3 packages
[[ -e ~/anaconda3/bin/python ]] && for p in "${pip3_packages[@]}"; do green_prompt "$p"; pip install "$p"; done || red_prompt "Check anaconda3 installation"

# clean
sudo apt autoclean && sudo apt autoremove -y

green_prompt "Done"
