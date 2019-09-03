#!/bin/bash
# The script stops running containers , deletes earlier image, pull and runs latest image

DOCKER_IMAGE=$1
BUILD_DIR=$2

executor()
{
cd $BUILD_DIR
echo "Current Dir : $PWD"
docker-compose down
docker rmi -f $(docker images | grep $DOCKER_IMAGE | tr -s ' ' | cut -d ' ' -f 3)
docker images
docker-compose pull --quiet
docker-compose up -d --force-recreate
}

executor

