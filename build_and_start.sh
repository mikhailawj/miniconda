#!/bin/bash

set -e

IMAGE_NAME=miniconda3
ENV_NAME=ocr-server-cpu

docker build -t ${IMAGE_NAME} --build-arg env_name=${ENV_NAME} .

docker rm -f dummy
docker create --name dummy ${IMAGE_NAME}
docker cp dummy:/${ENV_NAME}.tar.gz ${PWD}
docker rm -f dummy