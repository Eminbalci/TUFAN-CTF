# tufandocker
Kurulum yapmak için 

https://drive.google.com/file/d/1AghNCSF9WDzpUldWjUAvaP-xDzHFwekR/view?usp=sharing

bu dosyayı indirdiğiniz yere sh dosyalarını koyun ve aynı konumdaki terminalden aşağıdaki kodları çalıştırın

chmod +x docker.sh

chmod +x docker_tufan.sh

chmod +x baslat.sh

./docker.sh

./docker_tufan.sh


kurulum yaptıktan sonra başlatmak için baslat.sh dosyasının olduğu yerde

./baslat.sh

yazmanız yeterli


./baslat.sh kodu her terminalde çalıştırılmalı yoksa herkesin kendi bilgisayarında çalışır kodlar

başlatma komutları

gazebo : gz sim -v4 -r vtail_runway.sdf
sitl : sim_vehicle.py -v ArduPlane -f plane --model JSON --add-param-file=$HOME/SITL_Models/Gazebo/config/mini_talon_vtail.param --console --map
gazebo ros2 bağlantısı: ros2 run ros_gz_bridge parameter_bridge /camera_image@sensor_msgs/msg/Image@gz.msgs.Image
python ile kamera çekme: python kamera.py
