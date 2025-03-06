#!/bin/bash

# Warna buat biar keren
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Preparasi Basic Settings${NC}"

# Update & upgrade
sudo apt update && sudo apt upgrade -y

# Install paket yang dibutuhkan
sudo apt install git curl bash -y

# Ubah konfigurasi SSH agar root login diizinkan
sudo sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

# Restart SSH biar perubahan langsung aktif
sudo systemctl restart ssh

# Info sukses
echo -e "${GREEN}Preparasi Basic Done${NC}"
