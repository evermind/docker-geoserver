#!/bin/bash

set -e

source ./env.sh

TAG=$1

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker build --build-arg "VERSION=${TAG}" -t "${DOCKER_HUB_REPO}:${TAG}" docker/
docker push "${DOCKER_HUB_REPO}:${TAG}"
