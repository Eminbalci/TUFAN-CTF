#!/bin/bash

# Docker içinden grafik arayüzü (GUI) penceresi açılması için izin ver
xhost +local:docker
sudo docker start ardupilot_yeni
# Konteyner içine 'dev' kullanıcısı ile interaktif olarak bağlan
sudo docker exec -it --user dev ardupilot_yeni /bin/bash
