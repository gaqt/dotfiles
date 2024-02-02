#!/bin/bash

TYPE=$1
LABEL=$2

function get_memory_percent() {
  printf "$(free -m | grep $TYPE | awk '{print int(100*$3/$2)}')"
}

function get_memory_chars() {
  printf "$1%%"
  # printf "$($HOME/ui/percenttochars.sh -c 7 -t $1)"
}

while true;
do
  echo " $LABEL:  $(get_memory_chars "$(get_memory_percent)")"
  sleep 2
done
