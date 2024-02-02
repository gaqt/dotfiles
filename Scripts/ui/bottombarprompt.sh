#!/bin/bash


clock() {
  DATETIME=$(date "+%a %d %b %Y - %T")
  printf "$DATETIME"
}

context() {
  printf "$USER @ $(hostnamectl hostname)"
}


# Somewhat precise clock
# PID but without the I and the D lmao

LASTRENDERT=$(date "+%s%3N")
LASTRENDERT=$((LASTRENDERT - 1000))
while true; do
  echo -e "  $(clock) | $(context)"
  SLEEPTIME=1000
  MILLIS=$(date "+%3N")
  MILLIS=$(echo $MILLIS | sed -E -e 's/^0+//')
  if [ $MILLIS -gt 500 ]
  then
    TOSLEEPTIME=$((1300 - MILLIS))
    sleep ".$TOSLEEPTIME"
    SLEEPTIME=$((SLEEPTIME + TOSLEEPTIME))
  elif [ $MILLIS -lt 100 ]
  then
    TOSLEEPTIME=$((200 + MILLIS))
    sleep ".$TOSLEEPTIME"
    SLEEPTIME=$((SLEEPTIME + TOSLEEPTIME))
  fi
  FINALT=$(date "+%s%3N")
  DIFF=$(((FINALT - LASTRENDERT - SLEEPTIME) % 1000))
  LASTRENDERT=$((FINALT - DIFF))
  if [ $DIFF -gt 0 ]
  then
    sleep ".$((1000 - DIFF))"
  else
    sleep "1.$((-DIFF))"
  fi
done

