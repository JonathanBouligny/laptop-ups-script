#!/bin/bash

while true; do
    # Check if laptop is plugged in
    power_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state" | awk '{print $2}')

    if [ "$power_status" = "discharging" ]; then
        # Put laptop to sleep, no block because we dont want to wait for a return status
        systemctl suspend --no-block

        # Wait for suspend to finish
        sleep 2

        # Exit loop to prevent multiple sleep triggers
        break
    fi

    # Wait 5 seconds before checking again
    sleep 5
done
