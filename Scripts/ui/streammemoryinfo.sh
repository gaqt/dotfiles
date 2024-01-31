#!/bin/bash

TYPE=$1
LABEL=$2

function get_memory_percent() {
    printf "$(free -m | grep $TYPE | awk '{print int(100*$3/$2)}')"
}

function get_memory_chars() {
    printf "$(bash $HOME/ui/percenttochars.sh -c 16 -t $1)"
}

while true;
do
    echo "%{T1} $LABEL:  [%{T2}$(get_memory_chars $(get_memory_percent))%{T1}]"
    sleep 2
done
