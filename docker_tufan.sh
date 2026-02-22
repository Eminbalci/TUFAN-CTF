#!/bin/bash

sudo docker load -i talon_ros_yedek.tar

xhost +local:docker

sudo docker run -it \
    --name ardupilot_yeni \
    --user dev \
    --network host \
    --gpus all \
    --device /dev/dri:/dev/dri \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/home/dev/.Xauthority \
    --privileged \
    talon_ros:yedek_v1
