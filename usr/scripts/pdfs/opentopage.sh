#!/bin/bash

if [[ -z $2 ]]; then
    [[ -z $1 ]] && printf "\n Missing Filename..."
    echo "\n Missing Page Number...\n\n"
    echo "   Syntax: OpenToPage Filename Page_Number\n"
    echo "   Example: OpenToPage Filename.pdf 3\n\n"
    exit 1
else
    echo "Opening Preview $1"
    open -a Preview "$1"
    sleep .5
    osascript -e 'tell application "Preview" to activate' \
              -e 'delay 0.25' \
              -e 'tell application "System Events" to tell process "Preview" to click menu item "Go to Page…" of menu "Go" of menu bar 1' \
              -e 'delay 0.25' \
              -e "tell application \"System Events\" to keystroke \"$2\"" \
              -e 'delay 0.25' \
              -e 'tell application "System Events" to key code 36'
fi
exit 0
