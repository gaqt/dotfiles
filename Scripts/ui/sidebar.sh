#!/bin/bash


CORECNT=$[1 + $(mpstat -P ALL | tail -1 | awk '{print $2}')]

i=0
while [ $i -lt $CORECNT ]
do
  bash "$HOME/ui/sidebarcell.sh" \
    -p $i \
    -i "$HOME/ui/streamcpuinfo.sh $i" \
    &

  i=$((i+1))
done


$HOME/ui/sidebarcell.sh \
  -p $i \
  -i  "$HOME/ui/streammemoryinfo.sh Mem RAM" \
  &

i=$((i+1))

$HOME/ui/sidebarcell.sh \
  -p $i \
  -i  "$HOME/ui/streammemoryinfo.sh Swap SWP" \
  &

i=$((i+1))

$HOME/ui/sidebarcell.sh \
  -p $i \
  -i "$HOME/ui/streambatteryinfo.sh" \
  &
