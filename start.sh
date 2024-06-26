#!/bin/bash

set -e

IMAGE_NAME=miniconda3
ENV_NAME=image-converter

docker rm -f dummy
docker create --name dummy ${IMAGE_NAME}
docker cp dummy:/${ENV_NAME}.tar.gz ${PWD}
docker rm -f dummy