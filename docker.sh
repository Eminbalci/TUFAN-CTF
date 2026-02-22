#!/bin/bash

# 1. Sistemi güncelle
echo "Sistem güncelleniyor..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# 2. Docker resmi GPG anahtarını ekle
echo "GPG anahtarları ayarlanıyor..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# 3. Docker Reposunu kaynak listesine ekle
echo "Docker deposu ekleniyor..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 4. Docker paketlerini kur
echo "Docker kuruluyor..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 5. Docker'ın çalışıp çalışmadığını kontrol et
sudo systemctl enable --now docker

echo "------------------------------------------"
echo "Kurulum tamamlandı! Docker versiyonu:"
docker --version
echo "------------------------------------------"
