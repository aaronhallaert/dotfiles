#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Nephroflow: restore DB
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🌱
# @raycast.argument1 { "type": "text", "placeholder": "master" }

# Documentation:
# @raycast.description Restore API database
# @raycast.author Aaron Hallaert
# @raycast.authorURL https://github.com/aaronhallaert

docker exec -t selfweb pkill -9 ruby
sleep 2
tmux send-keys -t nipro-0:api -t 2 "restore_db.sh $1" 'Enter'
