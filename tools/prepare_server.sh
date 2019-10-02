#!/bin/bash

prepare () {
    cp ~/.zshrc ~/.zshrc.orig
    sed -i 's/ zsh-autosuggestions//g' ~/.zshrc
}

restore () {
    mv ~/.zshrc.orig ~/.zshrc
}

"$1"
