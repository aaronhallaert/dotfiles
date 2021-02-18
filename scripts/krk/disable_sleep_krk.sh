#!/bin/bash
# reset logfile
echo "$(date):" > ~/dotfiles/scripts/krk/krk.log

sleep 15
echo "$(date): change audio" >> ~/dotfiles/scripts/krk/krk.log
jack_control start >> ~/dotfiles/scripts/krk/krk.log
echo "$(date): wait for 5 seconds" >> ~/dotfiles/scripts/krk/krk.log
sleep 5
echo "$(date): Set default sink" >> ~/dotfiles/scripts/krk/krk.log
pacmd set-default-sink "jack_out" >> ~/dotfiles/scripts/krk/krk.log

sleep 5
echo "$(date): START autoplay" >> ~/dotfiles/scripts/krk/krk.log

while true
do
    echo "$(date): call play tone" >> ~/dotfiles/scripts/krk/krk.log
    ~/dotfiles/scripts/krk/play_10hz_tone.sh
    sleep 300
    echo "$(date): 5 minutes" >> ~/dotfiles/scripts/krk/krk.log
    sleep 300
    echo "$(date): 10 minutes" >> ~/dotfiles/scripts/krk/krk.log
    sleep 300
    echo "$(date): 15 minutes" >> ~/dotfiles/scripts/krk/krk.log
    sleep 300
    echo "$(date): 20 minutes" >> ~/dotfiles/scripts/krk/krk.log
done


