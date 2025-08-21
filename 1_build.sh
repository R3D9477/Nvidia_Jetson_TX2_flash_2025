#!/bin/bash

WORKDIR="$(realpath $(dirname $0))"
NVIDIA_FOLDER="${WORKDIR}/nvidia"

sudo rm -rf $NVIDIA_FOLDER
mkdir -p $NVIDIA_FOLDER

#docker container prune
#docker system prune -a --volumes

if ! [ -f "${WORKDIR}/sdkmanager.deb" ]; then
    mv "${WORKDIR}/"sdkmanager*.deb "${WORKDIR}/sdkmanager.deb"
fi

docker build -t jetpack-sdk .
