#!/bin/bash

BTSTOP="/usr/sbin/rfkill block bluetooth"
BTSTART="/usr/sbin/rfkill unblock bluetooth"
PAUSE="playerctl -a pause"
LOCK="swaylock -f -i ~/lockscreen_wallpaper.jpg"

KANSHI_RELOAD="kanshi --reload"
RECONNECT_BT_DEVICES="bluetoothctl connect D7:9B:C4:84:02:12"

killall swayidle 
wait

swayidle -d -w \
    timeout 299 "exec $PAUSE" \
    timeout 300 "exec $LOCK" \
    timeout 301 'swaymsg "output * dpms off"' \
         resume 'swaymsg "output * dpms on"' \
    timeout 600 'systemctl suspend' \
         resume 'swaymsg "output * dpms on"' \
    before-sleep "$PAUSE ; $LOCK;" \
    after-resume "$KANSHI_RELOAD" \
    after-resume "$RECONNECT_BT_DEVICES" > ~/tmp/swayidle.log
