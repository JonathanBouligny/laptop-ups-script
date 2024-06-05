#!/bin/bash

while true
do
  # front loaded this because you dont need two sleep commands only 1 always wait 5 seconds before trying again
  sleep 5

  # switched to acpi because stackoverflow says its more consistent testing says yes and the command is shorter
  battery_state=$(acpi)
  # If the state contains the word charging then
  if [[ "$battery_state" = *"Discharging"* ]]; then
    # suspend the machine not allowing any other processes to block the suspension. Suspends immediately
    systemctl suspend -i --no-block
  fi
done
