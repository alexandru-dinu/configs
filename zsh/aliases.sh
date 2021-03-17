# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks | sort -k1 | sed 's/\t\t/: /g' | column -t -s':'"

alias gdb="gdb -q"
alias i="ipython"
alias estab="ss -ta | grep -i estab | grep -v '127.0.0.1' | sort -k4"
alias ta="tmux attach"
alias td="tmux detach"

c      () { cd "$1" && ls }
rs     () { (redshift -x && ([ "$1" = "x" ] && return || redshift -O "$1" -g 0.8)) &> /dev/null }
bgopen () { xdg-open "$1" &> /dev/null & disown }

# ssh-add-key
sak () {
    killall ssh-agent
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/"$1"
}

# git
gdm () {
    local branch=$(git branch --show-current)
    git diff origin/$branch "$1"
}
