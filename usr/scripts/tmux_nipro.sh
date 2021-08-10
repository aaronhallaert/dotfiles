#!/bin/bash
session="nipro"

newly_created=false

tmux has-session -t $session


if [[ $? != 0 ]]; then

    echo "Creating Session"
    tmux new -t $session -d

    ##### API DEV ENV #####
    tmux neww -t $session: -n api -c $HOME/Developer/nephroflow/nephroflow-api
    tmux send-keys -t $session:api "git fetch" 'Enter'
    tmux send-keys -t $session:api "clear" 'Enter'
    tmux send-keys -t $session:api "git status" 'Enter'
    #######################

    ##### MANAGER DEV ENV #####
    tmux neww -t $session: -n manager -c $HOME/Developer/nephroflow/nephroflow-manager
    tmux send-keys -t $session:manager "git fetch" 'Enter'
    tmux send-keys -t $session:manager "clear" 'Enter'
    tmux send-keys -t $session:manager "git status" 'Enter'
    ###########################


    ##### INTERACTIVE DEV ENV #####
    tmux neww -t $session: -n interactive -c "$HOME/Developer/nephroflow/nephroflow-api"
    tmux split-window -t $session:interactive -c "$HOME/Developer/nephroflow/nephroflow-manager"

    # DOCKER API
    tmux send-keys -t $session:interactive -t 0 "clear" 'Enter'
    tmux send-keys -t $session:interactive -t 0 "docker-compose run --rm --service-ports --name selfweb web bash"

    # MANAGER
    tmux send-keys -t $session:interactive -t 1 "clear" 'Enter'
    tmux send-keys -t $session:interactive -t 1 "yarn start"
    ###############################


    ##### PGADMIN DOCKER #####
    tmux neww -t $session: -n database -c "$HOME/Developer/nephroflow/nephroflow-api"
    tmux send-keys -t $session:interactive -t 0 "clear" 'Enter'
    tmux send-keys -t $session:database "doker-compose up pgadmin -d"
    newly_created=true
    ##########################
fi

if [ "$newly_created" = true ]; then
    tmux a -t $session:api
else
    tmux a -t $session
fi

