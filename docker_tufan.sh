#!/bin/bash

# İmajı yükle
sudo docker load -i talon_ros_yedek.tar

# Ekran izni ver (Grafik arayüzü için)
xhost +local:docker

# Konteyneri çalıştır
sudo docker run -it \
    --name ardupilot_yeni \
    --user dev \
    --network host \
    --gpus all \
    --device /dev/dri:/dev/dri \
    --device /dev/video0:/dev/video0 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/home/dev/.Xauthority \
    --privileged \
    talon_ros:yedek_v1
