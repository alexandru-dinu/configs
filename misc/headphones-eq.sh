#!/bin/bash

# disables eq when headphones are inserted

r=`amixer -c 0 contents | \
awk -F"," '
$1 == "numid=19" {
    c=1
} c && /: values/ {
   split($0, a, "=")
   print a[2];
   exit
}'`

[[ "$r" == "on" ]] && pulseaudio-equalizer disable || pulseaudio-equalizer enable