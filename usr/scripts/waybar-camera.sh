#!/bin/bash

ps -eo user,pid,cmd -q "$(fuser /dev/video0 2>/dev/null | xargs)" |\
sed -n '1!p' |\
awk '{print $2 " " $3}' |\
awk -F "/" '{print "{\"tooltip\": \"" $1 " " $NF "\"}"}' |\
jq -s 'if length > 0 then {text: "󰄀 ", tooltip: (map(.tooltip) | join("\r"))} else {text: ""} end' |\
jq --unbuffered --compact-output
