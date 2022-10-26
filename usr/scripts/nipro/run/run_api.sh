#!/bin/bash

NAME=selfweb
INTERACTIVE=TRUE
COMMAND=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -ni|--non-interactive)
      INTERACTIVE=FALSE
      shift # past argument
      ;;
    --)
      shift
      ;;
    *)
      COMMAND+=" $1"
      shift # past argument
      ;;
  esac
done

if [ ! "$(docker ps -q -f name=$NAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME)" ]; then
        # cleanup
        docker rm $NAME
    fi

    cd $HOME/Developer/nephroflow/nephroflow-api/
    # run your container
    docker-compose run --rm --service-ports --name $NAME web $COMMAND
else
    if $INTERACTIVE; then
        docker exec -it $NAME $COMMAND
    else
        docker exec $NAME $COMMAND
    fi
fi
