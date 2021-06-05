#!/bin/bash
session="thesis"

newly_created=false

tmux has-session -t $session


if [[ $? != 0 ]]; then

    echo "Creating Session"

    tmux new -t $session -d

    tmux neww -t $session: -n scriptie -c ~/repos/Thesis/thesis_scriptie_game_of_pirates/boek
    tmux send-keys -t $session:scriptie "nvim -S ~/.config/nvim/sessions/thesis.vim" 'Enter'

    tmux neww -t $session: -n workspace -c ~/repos/Thesis/thesis_game_of_pirates
    tmux send-keys -t $session:workspace "conda activate thesis" 'Enter'
    tmux send-keys -t $session:workspace "clear" 'Enter'

    tmux neww -t $session: -n rife -c ~/repos/Thesis/RIFE-Interpolation-Attack
    tmux send-keys -t $session:rife "conda activate rifeapp" 'Enter'
    tmux send-keys -t $session:rife "clear" 'Enter'

    tmux send-keys -t $session:1 "cd ~/repos/Thesis/thesis_game_of_pirates" 'Enter'
    tmux send-keys -t $session:1 "clear" 'Enter'
    newly_created=true

fi

if [ "$newly_created" = true ]; then
    tmux a -t $session:scriptie
else
    tmux a -t $session
fi

