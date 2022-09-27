#!/bin/bash
xrandr --fb 6400x2160\
    --output DP-0 --scale 0.75x0.75 --mode 3840x2160\
    --output HDMI-0 --auto --scale 2x2 --pos 3840x0 --panning 2560x2048+3840+0
