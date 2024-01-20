#!/bin/sh

FILEPATH=$HOME/Pictures/screenshots
FILENAME="grim-$(date '+%Y-%m-%d-%H-%M-%S')"

mkdir -p $FILEPATH

filename="grim-$(date '+%d-%m-%Y-%H-%M-%S')"
grim - | tee $(echo $FILEPATH)/$(echo $FILENAME).png | wl-copy
convert $(echo $FILEPATH)/$(echo $FILENAME).png -bordercolor '#96cdfb' -border 30 $HOME/tmp/screenshot-notification.png
notify-send -i $HOME/tmp/screenshot-notification.png "  grim" "desktop screenshot saved"
rm -f $HOME/tmp/screenshot-notification.png
