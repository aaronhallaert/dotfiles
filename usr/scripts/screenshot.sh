#!/bin/sh

FILEPATH=$HOME/Pictures/screenshots
FILENAME="grim-$(date '+%Y-%m-%d-%H-%M-%S')"

mkdir -p ${FILEPATH}

filename="grim-$(date '+%d-%m-%Y-%H-%M-%S')"
grim - | tee ${FILEPATH}/${FILENAME}.png | wl-copy
magick ${FILEPATH}/${FILENAME}.png -bordercolor '#96cdfb' -border 30 ${HOME}/tmp/screenshot-notification.png

# Send notification with action
ACTION=$(notify-send -i ${HOME}/tmp/screenshot-notification.png "🖼️ Screenshot" "desktop screenshot saved" --action="Open image")

# Handle the action
if [ "$ACTION" == 0 ]; then
    pinta ${FILEPATH}/${FILENAME}.png &
fi

rm -f ${HOME}/tmp/screenshot-notification.png
