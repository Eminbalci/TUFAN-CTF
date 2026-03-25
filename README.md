
# 🚀 TufanDocker Kurulum ve Kullanım Kılavuzu

Bu depo, Docker üzerinde gerekli simülasyon ortamlarının hızlıca kurulması ve çalıştırılması için gerekli betikleri içerir.

---

## 💻 Bölüm 0: Ubuntu 24.04 LTS Kurulumu (Rufus Ayarları)

Eğer sisteminizde Ubuntu kurulu değilse, aşağıdaki adımları takip ederek temiz bir kurulum yapabilirsiniz.

### 1. Hazırlık
* **ISO Dosyası:** [Ubuntu Desktop 24.04 LTS](https://ubuntu.com/download/desktop) adresinden ISO dosyasını indirin.
* **Rufus:** [rufus.ie](https://rufus.ie/) adresinden Rufus aracını indirin.
* **USB Bellek:** En az 8 GB kapasiteli boş bir USB bellek.

### 2. Rufus ile Yazdırma Ayarları
USB belleği bilgisayarınıza takın ve Rufus'u açın. Ayarları şu şekilde yapın:
* **Aygıt:** USB belleğinizi seçin.
* **Önyükleme seçimi:** İndirdiğiniz Ubuntu 24.04 ISO dosyasını seçin.
* **Disk Bölüm Düzeni:** **GPT** (Modern bilgisayarlar için standarttır).
* **Hedef Sistem:** **UEFI (non CSM)**.
* **Dosya Sistemi:** FAT32 (Varsayılan).
* **Yazdırma İşlemi:** "BAŞLAT" butonuna bastıktan sonra çıkan uyarıda **"ISO Image mode" (ISO Yansıma modu)** seçeneğini seçtiğinizden emin olun.

### 3. Ubuntu Kurulumu
1. Hazırladığınız USB'yi bilgisayara takın ve bilgisayarı USB'den başlatın (Genelde F12, F2 veya Del tuşları ile Boot menüsüne girilir).
2. **"Try or Install Ubuntu"** seçeneğiyle ilerleyin.
3. **Kurulum Tipi:** "Interactive Installation" seçeneğini seçin.
4. **Uygulamalar:** "Default selection" (Gerekli araçları içeren standart kurulum).
5. **Disk Kurulumu:** Eğer diski tamamen Ubuntu'ya ayıracaksanız "Erase disk and install Ubuntu" seçeneğini seçin. Eğer ayırmayacaksanız yaklaşık olarak 200gb boş alanı eksiltin windows üzerinden daha sonra ubuntuyu kurarken orayı seçiceksiniz.
6. Kurulum bittikten sonra USB'yi çıkarıp sistemi yeniden başlatın.

!NOT: Disk ayırma işlemini yanlış yaparsanız windowsunuz silinebilir, kurulum yaparken driverları kurmayın daha sonrasında hataya sebep oluyor, konsol üzerinden driver güncellenicek.

---

## 📋 TufanDocker Kurulum Adımları

1.  **Gerekli Dosyayı İndirin:**
    Öncelikle [Google Drive Üzerinden](https://drive.google.com/file/d/1AghNCSF9WDzpUldWjUAvaP-xDzHFwekR/view?usp=sharing) dosyayı indirin.

2.  **Dosyaları Hazırlayın:**
    İndirdiğiniz dosyayı ayıkladığınız dizine gidin ve `.sh` dosyalarının orada olduğundan emin olun.

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
    Docker gruplarının ve yetkilerinin aktif olması için bilgisayarınıza **restart** atmalısınız.

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

Bütün adımları başardığınızda şöyle bir ekran ile karşılaşacaksınız:
<img width="876" height="619" alt="image" src="https://github.com/user-attachments/assets/38d84f4c-b6bb-4552-b090-5cf5839382a9" />

Bu ekran görüntüsünün alınıp emirhan.aydin@gop.edu.tr mail adresine iletilmesi gerekmektedir.
