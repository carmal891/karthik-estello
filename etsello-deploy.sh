#!/bin/bash
# The script stops running containers , deletes earlier image, pull and runs latest image

DOCKER_IMAGE=$1

executor()
{
docker-compose down
docker rmi -f $(docker images | grep $DOCKER_IMAGE | tr -s ' ' | cut -d ' ' -f 3) 
docker-compose pull --quiet
docker-compose up -d --force-recreate
}

executor

