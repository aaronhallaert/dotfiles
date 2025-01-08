#!/bin/bash

if hyprctl monitors -j | jq -e '.[] | select(.name == "eDP-1" and .disabled == false)' > /dev/null; then
    notify-send "eDP-1 is enabled. Suspending the system..."
    systemctl suspend
else
    notify-send "eDP-1 is disabled. No action taken."
fi


