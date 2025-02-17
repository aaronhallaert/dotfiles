#!/bin/sh

# systemd example: https://stackoverflow.com/a/50321912
# cron example:
# 0 * * * * ~/.config/sway/scripts/bing_wallpaper.sh

# exit on error
set -e

# set $SWAYSOCK if it's not set (for systemd or cron)

wlpath=${WALLPAPER_PATH:-"$HOME/wallpaper.jpg"}
lswlpath=${LOCK_SCREEN_WALLPAPER_PATH:-"$HOME/lockscreen_wallpaper.jpg"}
output=${WALLPAPER_OUTPUT:-"*"}
baseurl="https://www.bing.com/"

# first arg is the index of the wallpaper, if not specified, take "random"
if [ -z "$1" ]; then
  index="random"
else
  index=$1
fi

wluri=$(curl https://bing.biturl.top/\?resolution\=3840\&format\=json\&index\=$index\&mkt\=en-US -s | jq '.url' --raw-output | shuf -n 1)
# wluri=$(curl https://bing.biturl.top -s | jq '.url' --raw-output | shuf -n 1)

curl "$wluri" -s > $wlpath

magick $wlpath -filter Gaussian -blur 0x8 -level 10%,90%,0.5 $lswlpath

if command -v hyprctl &> /dev/null
then
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "$wlpath"
    hyprctl hyprpaper wallpaper ",$wlpath"
else
    echo "hyprctl command not found, skipping wallpaper update."
fi

# if swaybg is installed, set the wallpaper with sway
if command -v swaymsg &> /dev/null
then
    swaymsg output "*" bg "$wlpath" fill
else
    echo "swaymsg command not found, skipping wallpaper update."
fi
