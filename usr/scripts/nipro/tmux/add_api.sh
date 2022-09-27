#!/bin/bash
session="nipro"
dir="$HOME/Developer/nephroflow/nephroflow-api"

tmux neww -t $session: -n api -c $HOME/Developer/nephroflow/nephroflow-api

tmux split-window -h -t $session:api -c $dir -p 25
tmux split-window -v -t $session:api -c $dir -p 50
tmux send-keys -t $session:api -t 0 "git fetch" 'Enter'
tmux send-keys -t $session:api -t 0 "clear" 'Enter'
tmux send-keys -t $session:api -t 0 "git status" 'Enter'
