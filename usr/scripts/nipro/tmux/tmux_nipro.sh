#!/bin/bash
session="nipro"

newly_created=false

tmux has-session -t $session


if [[ $? != 0 ]]; then

    echo "Creating Session"
    tmux new -t $session -d -x- -y-

    ##### API DEV ENV #####
    $HOME/dotfiles/usr/scripts/nipro/tmux/add_api.sh
    #######################

    ##### MANAGER DEV ENV #####
    $HOME/dotfiles/usr/scripts/nipro/tmux/add_manager.sh
    ###############################

    ##### LINK DEV ENV #####
    #./add_link.sh


    newly_created=true
fi

if [ "$newly_created" = true ]; then
    tmux a -t $session:api
else
    tmux a -t $session
fi
