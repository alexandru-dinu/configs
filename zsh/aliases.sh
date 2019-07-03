### aliases

# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# user
alias gdb="gdb -q"
alias i="ipython"
alias cb="xclip -selection clipboard"
alias notes="vim $HOME/workspace/notes.txt"
alias control_center="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias ccat="ccat -G Plaintext=\"reset\" -G Decimal=\"teal\" -G Keyword=\"darkgreen\""

### functions

bgopen () {
    xdg-open "$1" &> /dev/null &
}

dis () {
    objdump -d -M intel "$1"
}

c () {
    cd "$1" && ls
}

sak () {
    _pids=( ${(s. .)"$(pidof ssh-agent)"} )
    for p in "${_pids[@]}"; do kill -15 $p; done
    eval $(ssh-agent -s) && ssh-add ~/.ssh/"$1"
}

rs () {
    [ "$1" = "x" ] && redshift -x || redshift -O "$1" -g 0.9
}

to_pdf () {
    libreoffice --headless --convert-to pdf "$1"
}

# git

gdm () {
    git diff origin/master "$1"
}

gdvm () {
    for f in `git ls-files -m`
    do
        git diff origin/master $f
    done
}

gdvc () {
    for f in `git ls-files -m`
    do
        git diff origin/"$(git rev-parse --abbrev-ref HEAD)" $f
    done
}

# display

set_display () {
    mode="$1"
    pos="$2" # left / right

    [ "$mode" = "single" ] && (xrandr --auto) && return
    [ "$mode" = "extend" ] && (xrandr --output eDP1 --primary --output HDMI1 --auto --$pos-of eDP1) && return
}

# directly download gdrive links
gdrive_download () {
  CONFIRM=$(
  	wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies \
  	--no-check-certificate "https://docs.google.com/uc?export=download&id=$1" \
    -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p' \
  )
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}
