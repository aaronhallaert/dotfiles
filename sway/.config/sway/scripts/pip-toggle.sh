#!/bin/bash

# File to store the PiP window state
STATE_FILE="/tmp/pip_hidden_state"

# Get the PiP window ID
PIP_WINDOW=$(swaymsg -t get_tree | jq -r '.. | select(.name? == "Picture-in-Picture") | .id')

if [ -z "$PIP_WINDOW" ]; then
    exit 0  # No PiP window found
fi

# Check if state file exists to determine current state
if [ -f "$STATE_FILE" ]; then
    # Window is hidden, bring it back
    swaymsg "[con_id=$PIP_WINDOW] move position 75 ppt 73 ppt"
    rm "$STATE_FILE"
else
    # Window is visible, hide it off-screen
    swaymsg "[con_id=$PIP_WINDOW] move position 99 ppt 99 ppt"
    touch "$STATE_FILE"
fi
