#!/bin/bash
# reset logfile
echo "" > ~/dotfiles/scripts/krk/krk.log

sleep 15
echo "change audio" >> ~/dotfiles/scripts/krk/krk.log
jack_control start >> ~/dotfiles/scripts/krk/krk.log
echo "wait for 5 seconds" >> ~/dotfiles/scripts/krk/krk.log
sleep 5
echo "Set default sink" >> ~/dotfiles/scripts/krk/krk.log
pacmd set-default-sink "jack_out" >> ~/dotfiles/scripts/krk/krk.log

watch -n 1500 ~/dotfiles/scripts/krk/play_10hz_tone.sh
