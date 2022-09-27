#!/bin/bash

$dir="$HOME/Developer/nephroflow/link"

tmux neww -t $session: -n link -c $HOME/Developer/nephroflow/link

tmux split-window -h -t $session:link -c $dir -p 25
tmux send-keys -t $session:link -t 0 "git fetch" 'Enter'
tmux send-keys -t $session:link -t 0 "clear" 'Enter'
tmux send-keys -t $session:link -t 0 "git status" 'Enter'

tmux send-keys -t $session:link -t 1 "clear" 'Enter'
tmux send-keys -t $session:link -t 1 "docker-compose run --rm --service-ports --name channel_host channel_host sh"

tmux split-window -v -t $session:link -c $dir -p 25
tmux send-keys -t $session:link -t 1 "clear" 'Enter'

tmux split-window -v -t $session:link -c $dir -p 25
tmux send-keys -t $session:link -t 2 "clear" 'Enter'
