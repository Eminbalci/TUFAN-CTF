# 🚀 TufanDocker Kurulum ve Kullanım Kılavuzu

Bu depo, Docker üzerinde gerekli simülasyon ortamlarının hızlıca kurulması ve çalıştırılması için gerekli betikleri içerir.

---

## 📋 Kurulum Adımları

1.  **Gerekli Dosyayı İndirin:**
    Öncelikle [Google Drive Üzerinden](https://drive.google.com/file/d/1AghNCSF9WDzpUldWjUAvaP-xDzHFwekR/view?usp=sharing) gerekli dosyayı indirin.

2.  **Dosyaları Hazırlayın:**
    İndirdiğiniz dosyanın bulunduğu dizine projedeki `.sh` dosyalarını kopyalayın.

3.  **Yetkilendirme ve Kurulum:**
    Terminali bu dizinde açarak aşağıdaki komutları sırasıyla çalıştırın:

    ```bash
    # Dosyalara çalıştırma izni verin
    chmod +x docker.sh docker_tufan.sh baslat.sh

    # Kurulum betiklerini çalıştırın
    ./docker.sh
    ./docker_tufan.sh
    ```

4.  **Sistemi Yeniden Başlatın:**
    Kurulumun tamamlanması ve değişikliklerin aktif olması için bilgisayarınızı **restart** etmelisiniz.

---

## 🛠 Kullanım Talimatları

### Ortamı Başlatma
Sistemi kullanmaya başlamadan önce, **her yeni terminal sekmesinde** mutlaka başlatma betiğini çalıştırmalısınız. Aksi takdirde komutlar konteyner yerine yerel makinenizde çalışmaya çalışacaktır.

```bash
./baslat.sh
