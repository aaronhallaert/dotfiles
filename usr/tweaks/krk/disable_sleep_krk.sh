#!/bin/bash
# reset logfile
LOG="$HOME/dotfiles/tweaks/krk/krk.log"
echo "$(date):" > $LOG

sleep 15
echo "$(date): change audio" >> $LOG
jack_control start >> $LOG
echo "$(date): wait for 5 seconds" >> $LOG
sleep 5
echo "$(date): Set default sink" >> $LOG
pacmd set-default-sink "jack_out" >> $LOG

sleep 5
echo "$(date): START autoplay" >> $LOG

while true
do
    echo "$(date): call play tone" >> $LOG
    $HOME/dotfiles/tweaks/krk/play_10hz_tone.sh
    sleep 300
    echo "$(date): 5 minutes" >> $LOG
    sleep 300
    echo "$(date): 10 minutes" >> $LOG
    sleep 300
    echo "$(date): 15 minutes" >> $LOG
    sleep 300
    echo "$(date): 20 minutes" >> $LOG
done


