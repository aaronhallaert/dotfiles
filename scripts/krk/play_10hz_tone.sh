echo "$(date): Wake up monitor" >> ~/dotfiles/scripts/krk/krk.log
aplay -d 19 ~/dotfiles/scripts/krk/10hz_tone.wav >> ~/dotfiles/scripts/krk/krk.log

