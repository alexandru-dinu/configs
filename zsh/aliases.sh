# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# user
alias gdb="gdb -q"
alias i="ipython"
alias scribble="vim $HOME/workspace/tmp/scribble.txt"
alias ccat="ccat -G Plaintext=\"reset\" -G Decimal=\"teal\" -G Keyword=\"darkgreen\""
alias dis="objdump -d -M intel"

c () { cd "$1" && ls }

bgopen () { xdg-open "$1" &> /dev/null & disown }

tvim () { terminator -x zsh -c "vim $1" &> /dev/null & disown }

# ssh-add-key
sak () {
    _pids=( ${(s. .)"$(pidof ssh-agent)"} )
    for p in "${_pids[@]}"; do kill -15 $p; done
    eval $(ssh-agent -s) && ssh-add ~/.ssh/"$1"
}

rs () { (redshift -x && ([ "$1" = "x" ] && return || redshift -O "$1" -g 0.9)) &> /dev/null}

to_pdf () { libreoffice --headless --convert-to pdf "$1" }

# git
gdm  () { git diff origin/master "$1" }
gdvm () { for f in `git ls-files -m`; do git diff origin/master $f; done }
gdvc () { for f in `git ls-files -m`; do git diff origin/"$(git rev-parse --abbrev-ref HEAD)" $f; done }

set_display () {
    mode="$1"
    pos="$2" # left / right

    [ "$mode" = "single" ] && (xrandr --auto) && return
    [ "$mode" = "extend" ] && (xrandr --output eDP1 --primary --output HDMI1 --auto --$pos-of eDP1) && return
}

# directly download gdrive links
gdrive_download () {
    CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies \
              --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" \
              -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')

    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
    rm -rf /tmp/cookies.txt
}
