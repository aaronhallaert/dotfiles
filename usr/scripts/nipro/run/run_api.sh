#!/bin/bash

NAME=web
INTERACTIVE=TRUE
COMMAND=""

while [[ $# -gt 0 ]]; do
  case $1 in
    -ni|--non-interactive)
      echo "Not interactive mode"
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

echo "Scanning for existing container ..."
if [ ! "$(docker ps -q -f name=$NAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME)" ]; then
        # cleanup
        echo "Removing existing container"
        docker rm $NAME
    fi

    echo "Create and run API container"
    # run your container
    if $INTERACTIVE; then
      docker-compose run --rm --service-ports --name $NAME web $COMMAND
    else
      docker-compose run -T --rm --service-ports --name $NAME web $COMMAND
    fi
else
    if $INTERACTIVE; then
        echo "Attach and run interactively"
        if [ -t 1 ] ; then docker exec -it $NAME $COMMAND; else docker exec -i $NAME $COMMAND; fi
    else
        echo "Attach and run non-interactively"
        docker exec $NAME $COMMAND
    fi
fi
