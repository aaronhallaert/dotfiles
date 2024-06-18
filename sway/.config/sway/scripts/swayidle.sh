#!/bin/bash

PAUSE="playerctl -a pause"
LOCK="swaylock -f -i ~/lockscreen_wallpaper.jpg"

killall swayidle 
wait

swayidle -d -w \
    timeout 299 "exec $PAUSE" \
    timeout 300 "exec $LOCK" \
    timeout 301 'swaymsg "output * dpms off"' \
         resume 'swaymsg "output * dpms on"' \
    timeout 600 'systemctl suspend' \
         resume 'swaymsg "output * dpms on"' \
    before-sleep "$PAUSE ; $LOCK" > ~/tmp/swayidle.log
