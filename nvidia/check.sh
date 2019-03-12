#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

green_prompt () {
    echo -e "${green}$1${reset}"
}

sep () {
    printf '=%.0s' {1..80} && echo && sleep 0.5
}

check_driver () {
    green_prompt "check driver"

    optirun nvidia-smi
    sep

    cat /proc/acpi/bbswitch
    sep

    lspci | grep -i nvidia
    sep

    glxinfo | head
    sep

    optirun glxinfo | head
    sep
}

check_cuda () {
    # also http://xcat-docs.readthedocs.io/en/stable/advanced/gpu/nvidia/verify_cuda_install.html

    green_prompt "check cuda"

    DIR="$HOME/NVIDIA_CUDA-9.1_Samples/1_Utilities/deviceQuery"

    cat /usr/local/cuda/version.txt

    make --quiet -C $DIR
    optirun $DIR/deviceQuery | tail -n 2
    sep
    
    optirun python -c 'import torch; print("PyTorch CUDA:", torch.cuda.is_available())'
    sep
}

check_cudnn () {
    green_prompt "check cudnn"

    cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
    sep
}

check_driver
check_cuda
check_cudnn
