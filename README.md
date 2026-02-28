# 🚀 TufanDocker Kurulum ve Kullanım Kılavuzu

Bu depo, Docker üzerinde gerekli simülasyon ortamlarının hızlıca kurulması ve çalıştırılması için gerekli betikleri içerir.

---

## 📋 Kurulum Adımları

1.  **Gerekli Dosyayı İndirin:**
    Öncelikle [Google Drive Üzerinden](https://drive.google.com/file/d/1AghNCSF9WDzpUldWjUAvaP-xDzHFwekR/view?usp=sharing) dosyayı indirin.

2.  **Dosyaları Hazırlayın:**
    İndirdiğiniz dosyayı ayıkladığınız yere `.sh` dosyalarını koyun.

3.  **Yetkilendirme ve Kurulum:**
    Terminali bu dizinde açarak aşağıdaki komutları sırasıyla çalıştırın:

    ```bash
    # Dosyalara çalıştırma izni verin
    chmod +x docker.sh
    chmod +x docker_tufan.sh
    chmod +x baslat.sh

    # Kurulum betiklerini çalıştırın
    ./docker.sh
    ./docker_tufan.sh
    ```

4.  **Sistemi Yeniden Başlatın:**
    Kurulumun tamamlanması için bilgisayarınıza **restart** atmalısınız.

---

## 🛠 Kullanım ve Başlatma Komutları

### ⚠️ Önemli Başlatma Notu
Sistemi kullanmaya başlamadan önce, **her yeni terminal sekmesinde** mutlaka `./baslat.sh` betiğini çalıştırmalısınız. Aksi takdirde komutlar Docker konteyneri yerine kendi bilgisayarınızda çalışmaya çalışacaktır.

### Çalıştırma Komut Listesi
Herhangi bir komutu yazmadan önce `./baslat.sh` yapmayı unutmayın:

* **Ortamı Hazırla:** `./baslat.sh`
* **Gazebo Simülasyonu:** `gz sim -v4 -r vtail_runway.sdf`
* **SITL (ArduPlane):** `sim_vehicle.py -v ArduPlane -f plane --model JSON --add-param-file=$HOME/SITL_Models/Gazebo/config/mini_talon_vtail.param --console --map`
* **Gazebo ROS2 Bağlantısı:** `ros2 run ros_gz_bridge parameter_bridge /camera_image@sensor_msgs/msg/Image@gz.msgs.Image`
* **Python ile Kamera Çekme:** `python kamera.py`

---

## 💡 Örnek Kullanım Senaryosu
Gazebo'yu çalıştırmak istiyorsanız terminale şu sırayla yazmalısınız:
1. `./baslat.sh`
2. `gz sim -v4 -r vtail_runway.sdf`
