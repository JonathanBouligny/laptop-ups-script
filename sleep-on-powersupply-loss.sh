#!/bin/bash

while true; do
    # Check if the laptop is plugged in
    power_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state" | awk '{print $2}')

    if [ "$power_status" = "discharging" ]; then
        # Put the laptop to sleep
        systemctl suspend --no-block

        # Wait for a short duration to allow the suspend process to finish
        sleep 2

        # Exit the loop to prevent multiple sleep triggers
        break
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done

