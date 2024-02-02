#!/bin/bash

get_battery_percent() {
  local BATPERC=$(acpi --battery | cut -d, -f2)
  echo "$BATPERC"
}

while true;
do
  echo " BATT:$(get_battery_percent)"
  sleep 5
done
