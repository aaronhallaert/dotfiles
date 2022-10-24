#!/bin/bash

session="nipro"

dir="$HOME/Developer/nephroflow/link"

tmux neww -t $session: -n link -c $HOME/Developer/nephroflow/link
wait

tmux split-window -h -t $session:link -c $dir -p 25
tmux send-keys -t $session:link.0 "git fetch" 'Enter'
tmux send-keys -t $session:link.0 "clear" 'Enter'
tmux send-keys -t $session:link.0 "git status" 'Enter'

tmux send-keys -t $session:link.1 "clear" 'Enter'
tmux send-keys -t $session:link.1 "docker-compose run --rm --service-ports --name channel_host channel_host sh"

tmux split-window -v -t $session:link -c $dir -p 25
tmux send-keys -t $session:link.2 "clear" 'Enter'
tmux send-keys -t $session:link.2 "docker-compose run --rm --service-ports --name processor_host processor_host sh"

tmux split-window -v -t $session:link -c $dir -p 25
tmux send-keys -t $session:link.3 "clear" 'Enter'
