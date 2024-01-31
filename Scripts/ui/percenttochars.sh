#!/bin/bash

CELLS=10
CHAR="|"
EMPTYCHAR="."

i=2
for arg in "$@"
do
    if [ "$arg" == "-c" ]
    then
        CELLS=${!i}
    elif [ "$arg" == "-t" ]
    then
        TOTAL=${!i}
    elif [ "$arg" == "-ch" ]
    then
        CHAR=${!i}
    elif [ "$arg" == -"ech" ]
    then
        EMPTYCHAR=${!i}
    fi
    i=$((i+1))
done

STEP=$((100 / CELLS))
USED=$((TOTAL - (TOTAL % STEP)))
MAX=$((100 - (100 % STEP)))

acc=$STEP
printf "$CHAR"
while [ $acc -lt $MAX ]
do
    if [ $acc -lt $USED ]
    then
        printf "$CHAR"
    else
        printf "$EMPTYCHAR"
    fi
    acc=$((acc + STEP))
done

