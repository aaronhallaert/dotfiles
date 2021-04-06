#!/bin/bash
tmux new -s thesis -d

tmux neww -t thesis: -n scriptie -c ~/repos/Thesis/thesis_scriptie_game_of_pirates/boek
tmux send-keys -t thesis:scriptie "nvim -S ~/.config/nvim/sessions/thesis.vim" 'Enter'

tmux neww -t thesis: -n workspace -c ~/repos/Thesis/thesis_game_of_pirates
tmux send-keys -t thesis:workspace "conda activate thesis" 'Enter'
tmux send-keys -t thesis:workspace "clear" 'Enter'

tmux neww -t thesis: -n rife -c ~/repos/Thesis/RIFE-Interpolation-Attack
tmux send-keys -t thesis:rife "conda activate rifeapp" 'Enter'
tmux send-keys -t thesis:rife "clear" 'Enter'

tmux send-keys -t thesis:1 "cd ~/repos/Thesis/thesis_game_of_pirates" 'Enter'
tmux send-keys -t thesis:1 "clear" 'Enter'

tmux a -t thesis:scriptie

#while [ "$#" -gt 0 ]; do
    #curr=$1
    #shift

    #case "$curr" in
        #"-w")
            #echo "-w entered"
            #tmux neww -t thesis: -n workspace -c ~/repos/Thesis/thesis_game_of_pirates
            #tmux send-keys -t thesis:workspace "conda activate thesis" 'Enter'
            #;;
        #"-d")
            #echo "-d entered"
            #tmux neww -t thesis: -n dain -c ~/repos/Thesis/Dain-Interpolation-Attack
            #tmux send-keys -t thesis:dain "conda activate dainapp" 'Enter'
            #;;
        #"-r")
            #echo "-r entered"
            #tmux neww -t thesis: -n rife -c ~/repos/Thesis/RIFE-Interpolation-Attack
            #tmux send-keys -t thesis:rife "conda activate rifeapp" 'Enter'
            #;;
        #*) "Unavailable command ... $curr"
    #esac
#done
