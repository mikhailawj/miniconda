#!/bin/bash

set -e

IMAGE_NAME=miniconda3

docker build -t ${IMAGE_NAME} .