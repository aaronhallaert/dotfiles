#!/bin/bash
session="nipro"

newly_created=false

tmux has-session -t $session


if [[ $? != 0 ]]; then

    echo "Creating Session"
    tmux new -t $session -d -x- -y-

    ##### API DEV ENV #####
    tmux neww -t $session: -n api -c $HOME/Developer/nephroflow/nephroflow-api

    tmux split-window -h -t $session:api -c "$HOME/Developer/nephroflow/nephroflow-api" -p 25
    tmux send-keys -t $session:api -t 0 "git fetch" 'Enter'
    tmux send-keys -t $session:api -t 0 "clear" 'Enter'
    tmux send-keys -t $session:api -t 0 "git status" 'Enter'

    #tmux send-keys -t $session:api -t 1 "clear" 'Enter'
    #tmux send-keys -t $session:api -t 1 "docker exec -it selfweb bash"

    #tmux split-window -h -t $session:api -c "$HOME/Developer/nephroflow/nephroflow-api" -l 50%
    tmux send-keys -t $session:api -t 1 "clear" 'Enter'
    tmux send-keys -t $session:api -t 1 "docker-compose run --rm --service-ports --name selfweb web bash"
    #######################

    ##### MANAGER DEV ENV #####
    tmux neww -t $session: -n manager -c $HOME/Developer/nephroflow/nephroflow-manager
    tmux split-window -h -t $session:manager -c "$HOME/Developer/nephroflow/nephroflow-manager" -p 25

    tmux send-keys -t $session:manager -t 0 "git fetch" 'Enter'
    tmux send-keys -t $session:manager -t 0 "clear" 'Enter'
    tmux send-keys -t $session:manager -t 0 "git status" 'Enter'

    tmux send-keys -t $session:manager -t 1 "yarn install" 'Enter'
    tmux send-keys -t $session:manager -t 1 "clear" 'Enter'
    tmux send-keys -t $session:manager -t 1 "yarn start"
    ###############################


    ##### ASSISTANT #####
    #tmux neww -t $session: -n assistant -c "$HOME/Developer/nephroflow/nephroflow-assistant"
    #tmux send-keys -t $session:assistant "git fetch" 'Enter'
    #tmux send-keys -t $session:assistant "clear" 'Enter'
    #tmux send-keys -t $session:assistant "git status" 'Enter'
    ##########################


    ##### PGADMIN DOCKER #####
    tmux neww -t $session: -n database -c "$HOME/Developer/nephroflow/nephroflow-api"
    tmux send-keys -t $session:database -t 0 "clear" 'Enter'
    tmux send-keys -t $session:database "docker-compose up pgadmin"
    ##########################


    ##### LINK DEV ENV #####
    tmux neww -t $session: -n link -c $HOME/Developer/nephroflow/link

    tmux split-window -h -t $session:link -c "$HOME/Developer/nephroflow/link" -p 25
    tmux send-keys -t $session:link -t 0 "git fetch" 'Enter'
    tmux send-keys -t $session:link -t 0 "clear" 'Enter'
    tmux send-keys -t $session:link -t 0 "git status" 'Enter'

    tmux send-keys -t $session:link -t 1 "clear" 'Enter'
    tmux send-keys -t $session:link -t 1 "docker-compose run --rm --service-ports --name channel_host channel_host sh"

    tmux split-window -v -t $session:link -c "$HOME/Developer/nephroflow/link" -p 50
    #tmux send-keys -t $session:link -t 1 "clear" 'Enter'
    #tmux send-keys -t $session:link -t 1 "docker-compose up -d"

    newly_created=true
fi

if [ "$newly_created" = true ]; then
    tmux a -t $session:api
else
    tmux a -t $session
fi
