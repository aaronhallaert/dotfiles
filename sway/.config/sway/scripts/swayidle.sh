#!/bin/bash

BTSTOP="/usr/sbin/rfkill block bluetooth"
BTSTART="/usr/sbin/rfkill unblock bluetooth"
PAUSE="playerctl -a pause"
LOCK="swaylock -f -i ~/lockscreen_wallpaper.jpg"

KANSHI_RELOAD="kanshi reload"
RECONNECT_BT_DEVICES="bluetoothctl connect D7:9B:C4:84:02:12"

SLEEP="systemctl suspend"
SCREEN_OFF="swaymsg 'output * dpms off'"
SCREEN_ON="swaymsg 'output * dpms on'"

killall swayidle 
wait

swayidle -d \
    timeout 250 "${SCREEN_OFF}" \
        resume "${SCREEN_ON}" \
    timeout 300 "${SLEEP}" \
    before-sleep "${PAUSE}" \
    before-sleep "${LOCK}" \
    after-resume "${KANSHI_RELOAD}"
