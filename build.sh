#!/bin/bash
#Takes two parms:
#CLI_VERSION
#TRAVIS_TAG
set -e
export CONTROLLER_BASE_URL := https://github.com/appsody/controller/releases/download/$CONTROLLER_VERSION
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker build -t $DOCKER_ORG/appsody-k8s:$2 -t $DOCKER_ORG/appsody-k8s:latest --build-arg CLI_VERSION=$1 --build-arg CONTROLLER_BASE_URL=${CONTROLLER_BASE_URL}.
docker push $DOCKER_ORG/appsody-k8s
docker push $DOCKER_ORG/appsody-k8s:$2