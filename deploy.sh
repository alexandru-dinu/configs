#!/bin/bash

green=`tput setaf 2`
reset=`tput sgr0`

prompt () {
    echo -e "${green}$1${reset}"
}

prompt "Remove unnecessary packages and install needed ones. Continue?" && read b
[[ b == 'y' ]] && ./packages.sh
echo

prompt "Configure the following" && ./configure.sh --list && prompt "Continue?" && read b
[[ b == 'y' ]] && ./configure.sh --all
echo

prompt "Done!"
