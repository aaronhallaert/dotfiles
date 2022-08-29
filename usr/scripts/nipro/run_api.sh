COMMAND=$1
NAME=selfweb

if [ ! "$(docker ps -q -f name=$NAME)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=$NAME)" ]; then
        # cleanup
        docker rm $NAME
    fi
    # run your container
    docker-compose run --rm --service-ports --name selfweb web $COMMAND
else
    docker exec -it selfweb $COMMAND
fi
