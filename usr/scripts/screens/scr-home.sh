#!/bin/bash
xrandr --fb 6400x2160\
    --output eDP-1 \
    --output DP-1 --scale 0.75x0.75 --mode 3840x2160 --right-of eDP-1
