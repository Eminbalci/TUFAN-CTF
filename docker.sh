#!/bin/bash

# 1. Sistemi güncelle ve Gerekli Araçları Kur
echo "Sistem güncelleniyor ve temel paketler kuruluyor..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg software-properties-common

# 2. NVIDIA Sürücülerini Güncelle (YENİ)
echo "Uygun NVIDIA sürücüleri tespit ediliyor ve kuruluyor..."
# Mevcut sürücüleri kontrol eder ve önerilen en güncel sürücüyü otomatik kurar
sudo ubuntu-drivers autoinstall

# Not: Sürücü kurulumundan sonra normalde reboot gerekir. 
# Scriptin devam etmesi için modülleri yüklemeye çalışacağız.
echo "NVIDIA çekirdek modülleri yükleniyor..."
sudo modprobe nvidia

# 3. Docker resmi GPG anahtarını ekle
echo "Docker GPG anahtarları ayarlanıyor..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 4. Docker Reposunu kaynak listesine ekle
echo "Docker deposu ekleniyor..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Docker paketlerini kur
echo "Docker kuruluyor..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 6. NVIDIA Container Toolkit kurulumu
echo "NVIDIA Container Toolkit deposu ekleniyor..."
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

echo "NVIDIA Container Toolkit kuruluyor..."
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

# 7. Docker'ı NVIDIA çalışma zamanı (runtime) ile yapılandır
echo "Docker NVIDIA yapılandırması yapılıyor..."
sudo nvidia-ctk runtime configure --runtime=docker

# 8. Servisleri başlat ve etkinleştir
echo "Servisler yeniden başlatılıyor..."
sudo systemctl restart docker
sudo systemctl enable --now docker

echo "------------------------------------------"
echo "KURULUM TAMAMLANDI!"
echo "------------------------------------------"
nvidia-smi
echo "------------------------------------------"
docker --version
echo "------------------------------------------"
echo "ÖNEMLİ: Sürücü güncellemesinin tam etkinleşmesi için"
echo "sistemi 'sudo reboot' ile yeniden başlatmanız önerilir."
echo "------------------------------------------"
