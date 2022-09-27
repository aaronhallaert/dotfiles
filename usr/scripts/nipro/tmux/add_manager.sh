#!/bin/bash
session="nipro"
dir="$HOME/Developer/nephroflow/nephroflow-manager"

tmux neww -t $session: -n manager -c $dir
tmux split-window -h -t $session:manager -c $dir -p 25

tmux send-keys -t $session:manager -t 0 "git fetch" 'Enter'
tmux send-keys -t $session:manager -t 0 "clear" 'Enter'
tmux send-keys -t $session:manager -t 0 "git status" 'Enter'

tmux send-keys -t $session:manager -t 1 "yarn install" 'Enter'
tmux send-keys -t $session:manager -t 1 "clear" 'Enter'
tmux send-keys -t $session:manager -t 1 "yarn dev"
