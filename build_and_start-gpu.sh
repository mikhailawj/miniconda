#!/bin/bash

set -e

if [ -z "${1}" ]; then
    echo "no ENV_NAME specified. please specify one. Exiting..."
    exit 1
else
    ENV_NAME=${1}
fi

IMAGE_NAME=miniconda3

docker build -t ${IMAGE_NAME} --build-arg env_name=${ENV_NAME} -f cudaconda.Dockerfile .

docker rm -f dummy
docker create --name dummy ${IMAGE_NAME}
docker cp dummy:/${ENV_NAME}.tar.gz ${PWD}
docker rm -f dummy