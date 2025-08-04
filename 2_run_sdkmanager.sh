#!/bin/bash

NVIDIA_FOLDER="$(realpath $(dirname $0)/nvidia)"

xhost +local:$USER

docker container prune

docker run -it \
    --privileged -v /dev/bus/usb:/dev/bus/usb/ -v /dev:/dev --network host \
    --volume="$NVIDIA_FOLDER:/home/nvidia" \
    --user "nvidia:nvidia" \
    --env="DISPLAY=$DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    jetpack-sdk /opt/nvidia/sdkmanager/sdkmanager-gui
