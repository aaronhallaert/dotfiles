#!/bin/bash

FILEPATH=${HOME}/Pictures/screenshots
FILENAME="grim-$(date '+%Y-%m-%d-%H-%M-%S')"

mkdir -p $FILEPATH

REGION=$(slurp -d -b "#302d4180" -c "#96cdfb" -s "#57526840" -w 2)

# abort when nothing was selected
if [ -z "$REGION" ]; then
    exit 1
fi

grim -g "${REGION}" - | tee ${FILEPATH}/${FILENAME}.png | wl-copy


magick ${FILEPATH}/${FILENAME}.png -bordercolor '#96cdfb' -border 15 ${HOME}/tmp/notification-screenshot.png

# Send notification with action
ACTION=$(notify-send -i ${HOME}/tmp/notification-screenshot.png "🖼️ Screenshot" "desktop screenshot saved" --action="Open image")

# Handle the action
if [ "$ACTION" == 0 ]; then
    pinta ${FILEPATH}/${FILENAME}.png &
fi

rm -f $HOME/tmp/notification-screenshot.png
