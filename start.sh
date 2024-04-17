#!/bin/bash

set -e

IMAGE_NAME=miniconda3

docker rm -f dummy
docker create --name dummy ${IMAGE_NAME}
docker cp dummy:/m-ws.tar.gz ${PWD}
docker rm -f dummy