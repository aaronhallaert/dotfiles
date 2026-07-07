#!/bin/bash

PIDS=$(fuser /dev/video0 2>/dev/null | xargs)
if [ -z "$PIDS" ]; then
    echo '{"text": ""}'
    exit 0
fi

ps -o user,pid,cmd --no-header -q "$PIDS" |\
sed -n '1!p' |\
awk '{print $2 " " $3}' |\
awk -F "/" '{print "{\"tooltip\": \"" $1 " " $NF "\"}"}' |\
jq -s 'if length > 0 then {text: "󰄀 ", tooltip: (map(.tooltip) | join("\r"))} else {text: ""} end' |\
jq --unbuffered --compact-output
