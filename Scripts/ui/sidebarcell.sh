#!/bin/bash

source "$HOME/.themerc"

WIDTH=150
BOTTOM=90
RIGHT=30
HEIGHT=50
GAP=10
POS=0

i=2
for arg in "$@"
do
    if [ "$arg" == "-i" ]
    then
        INPUTCMD=${!i}
    elif [ "$arg" == "-p" ]
    then
        POS=${!i}
    fi
    i=$((i+1))
done

MONITORWIDTH=$(xrandr | grep "*" | awk -F 'x' '{ print $1 }')

LEFT=$((MONITORWIDTH - RIGHT - WIDTH))
BOTTOM=$((BOTTOM + (HEIGHT + GAP) * POS))

bash -c "$INPUTCMD" | lemonbar -b -d -p -g "$WIDTH"x"$HEIGHT"+"$LEFT"+"$BOTTOM" -f "FiraCode Nerd Font Mono Bold:size=13" -f "Kanit:size=9" -B "$LEMONBARBG" -F "$COLOR3"

