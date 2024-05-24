#!/bin/bash

while true; do
    # Check if laptop is plugged in
    power_status=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "state" | awk '{print $2}')

    if [ "$power_status" = "discharging" ]; then
        # Put laptop to sleep, no-block (async) because we're sleeping and we wont have
          time for the operation to return
        systemctl suspend --no-block

        # Wait for suspend, Creates an error on screen without the sleep
        sleep 2

        # Exit the loop to prevent multiple sleep triggers, triggered on wake up
        break
    fi

    # Wait for 5 seconds before checking again
    sleep 5
done
