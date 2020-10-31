# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks | sort -k1 | sed 's/\t\t/: /g' | column -t -s':'"

# user
alias gdb="gdb -q"
alias i="ipython"
alias ccat="ccat -G Plaintext=\"reset\" -G Decimal=\"teal\" -G Keyword=\"darkgreen\""
alias estab="ss -ta | grep -i estab | grep -v '127.0.0.1' | sort -k4"
alias ta="tmux attach"
alias td="tmux detach"

c      () { cd "$1" && ls }
bgopen () { xdg-open "$1" &> /dev/null & disown }
tvim   () { terminator -x zsh -c "vim $1" &> /dev/null & disown }
rs     () { (redshift -x && ([ "$1" = "x" ] && return || redshift -O "$1" -g 0.8)) &> /dev/null}

# ssh-add-key
sak () {
    _pids=( ${(s. .)"$(pidof ssh-agent)"} )
    for p in "${_pids[@]}"; do kill -15 $p; done
    eval $(ssh-agent -s) && ssh-add ~/.ssh/"$1"
}

# git
gdm  () { git diff origin/master "$1" }
gdvm () { for f in `git ls-files -m`; do git diff origin/master $f; done }
gdvc () { for f in `git ls-files -m`; do git diff origin/"$(git rev-parse --abbrev-ref HEAD)" $f; done }
