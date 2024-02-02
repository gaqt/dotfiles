#!/bin/bash

ID=$1

function get_cpu_percent() {
  printf "$[100 - $(mpstat -P $ID --dec=0 1 1 | tail -1 | awk '{print $12}')]"
}

function get_cpu_chars() {
  printf "$1%%"
  # printf "$($HOME/ui/percenttochars.sh -c 7 -t $1)"
}

while true;
do
  echo " CPU$ID: $(get_cpu_chars "$(get_cpu_percent)")"
  sleep 1
done
