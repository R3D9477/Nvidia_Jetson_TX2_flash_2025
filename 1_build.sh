#!/bin/bash

NVIDIA_FOLDER="$(realpath $(dirname $0)/nvidia)"

sudo rm -rf $NVIDIA_FOLDER
mkdir -p $NVIDIA_FOLDER

#docker container prune
#docker system prune -a --volumes

docker build -t jetpack-sdk .
