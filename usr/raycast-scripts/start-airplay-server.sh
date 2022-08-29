#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Start Airplay Server
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📺

# Documentation:
# @raycast.author Aaron Hallaert
# @raycast.authorURL https://github.com/aaronhallaert

pkill uxplay
/Users/aaronhallaert/Developer/programs/UxPlay/uxplay &

