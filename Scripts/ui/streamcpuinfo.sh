#!/bin/bash

ID=$1

function get_cpu_percent() {
    printf "$[100 - $(mpstat -P $ID --dec=0 1 1 | tail -1 | awk '{print $12}')]"
}

function get_cpu_chars() {
    printf "$(bash $HOME/ui/percenttochars.sh -c 16 -t $1)"
}

while true;
do
    echo "%{T1} CPU$ID: [%{T2}$(get_cpu_chars $(get_cpu_percent))%{T1}]"
    sleep 1
done
