#!/bin/bash

jack_control start
pacmd set-default-sink "jack_out"

echo "" > ~/dotfiles/scripts/krk/krk.log
watch -n 1500 ~/dotfiles/scripts/krk/play_10hz_tone.sh
