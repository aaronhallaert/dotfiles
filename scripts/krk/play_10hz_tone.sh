echo "$(date): Wake up monitor" >> ~/dotfiles/scripts/krk/krk.log
aplay -d 1 ~/dotfiles/scripts/krk/10hz_tone.wav
