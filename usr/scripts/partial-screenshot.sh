#!/bin/bash

FILEPATH=$HOME/Pictures/screenshots
FILENAME="grim-$(date '+%Y-%m-%d-%H-%M-%S')"

mkdir -p $FILEPATH

grim -g "$(slurp -d -b "#302d4180" -c "#96cdfb" -s "#57526840" -w 2)" - | tee $(echo $FILEPATH)/$(echo $FILENAME).png | wl-copy
magick $(echo $FILEPATH)/$(echo $FILENAME).png -bordercolor '#96cdfb' -border 15 $HOME/tmp/notification-screenshot.png
notify-send -i $HOME/tmp/notification-screenshot.png "  grim" "screenshot of selected area saved"
rm -f $HOME/tmp/notification-screenshot.png
