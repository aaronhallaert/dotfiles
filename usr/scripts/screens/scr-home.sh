#!/bin/bash

echo "Searching display..."
CONNECTED_DISPLAY="$(xrandr | grep "\sconnected" | grep -v primary | awk '{print $1}')"

echo "Found $CONNECTED_DISPLAY"

echo "Applying display settings"
xrandr --fb 6400x2160\
    --output eDP-1 \
    --output $CONNECTED_DISPLAY --scale 0.75x0.75 --mode 3840x2160 --right-of eDP-1
