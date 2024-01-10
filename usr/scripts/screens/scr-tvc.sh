#!/bin/bash
xrandr --auto

sleep 1

xrandr --output eDP-1 \
    --output DP-2 --right-of eDP-1 \
    --output HDMI-1 --right-of DP-2

sleep 1

i3-msg restart
