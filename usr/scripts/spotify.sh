#!/bin/sh

tooltip="$(playerctl -p spotify metadata title) - $(playerctl -p spotify metadata artist)"
class="class"
percentage="100"

echo "{\"text\": \" $tooltip\", \"tooltip\": \"$tooltip\", \"percentage\": $percentage }"
