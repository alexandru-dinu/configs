#!/bin/bash

# if there are problems with input, run `sudo apt install xserver-xorg-input-all
# https://lenovolinux.blogspot.com/2016/05/bumblebee-on-lenovo-t440p-nvidia-gt.html
# https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07#file-install-nvidia-driver-and-cuda-md

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

green_prompt () {
    echo -e "${green}$1${reset}"
}

red_prompt () {
    echo -e "${red}$1${reset}"
}

init () {
    green_prompt "Adding ppa and installing bumblebee + nvidia-$1"

    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update

    sudo apt-get remove xserver-xorg-video-nouveau
    sudo apt install bumblebee bumblebee-nvidia
    sudo apt install nvidia-modprobe nvidia-$1 libcuda1-$1
}

blacklist () {
    green_prompt "Blacklisting to /etc/modprobe.d/bumblebee.conf"

    x="# <ver>\n"
    x+="blacklist nvidia-<ver>\n"
    x+="blacklist nvidia-<ver>-updates\n"
    x+="blacklist nvidia-experimental-<ver>"

    sudo echo -e $x | sed 's/<ver>/'"$1"'/g' >> /etc/modprobe.d/bumblebee.conf
}

bumblebee () {
    green_prompt "Writing bumblebee conf"

    sed 's/<ver>/'"$1"'/g' bumblebee.conf.skel > /etc/bumblebee/bumblebee.conf
}

alternatives () {
    green_prompt "Updating alternatives"

    # choose mesa
    sudo update-alternatives --config i386-linux-gnu_gl_conf
    # choose mesa
    sudo update-alternatives --config x86_64-linux-gnu_egl_conf
    # choose nvidia-<ver>-prime
    sudo update-alternatives --config x86_64-linux-gnu_gl_conf
}

grub () {
    green_prompt "Writing grub conf"

    sed -i.orig 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="nogpumanager"/g' /etc/default/grub
    sudo update-grub
}

reconf () {
    green_prompt "Reconfiguring bbswitch-dkms and nvidia-$1"

    sudo dpkg-reconfigure bbswitch-dkms
    sudo dpkg-reconfigure nvidia-$1
}

main () {
    was_reboot=$1
    ver=$2

    if [[ "$was_reboot" == "1" ]]; then
        reconf $ver
        sudo rm -f /usr/lib/xorg/Xorg.wrap
    else
        init $ver
        blacklist $ver
        bumblebee $ver
        alternatives

        sudo rm -f /usr/lib/xorg/Xorg.wrap

        red_prompt "need to reboot. afterwards, run  continue [y/n]?"; read b
        [[ "$b" == "y" ]] && reboot || red_prompt "reboot manually later"
    fi
}

main $1 $2
