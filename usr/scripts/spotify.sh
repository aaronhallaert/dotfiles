#!/bin/sh

tooltip="$(playerctl -p playerctld metadata title) - $(playerctl -p playerctld metadata artist)"
percentage="100"

echo "{\"text\": \" $tooltip\", \"tooltip\": \"$tooltip\", \"percentage\": $percentage }"
