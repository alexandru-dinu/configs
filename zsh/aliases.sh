### aliases

# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# user
alias gdb="gdb -q"
alias do="xdg-open"
alias i="ipython"



### functions

dis () {
    objdump -d -M intel "$1"
}

c () {
    cd "$1" && ls
}

sak () {
    eval $(ssh-agent -s) && ssh-add ~/.ssh/"$1"
}

rs () {
    [ "$1" = "x" ] && redshift -x || redshift -O "$1" -g 0.9
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
