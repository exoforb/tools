#!/bin/bash
# ====================================================
# 🚀 ExoForb | Node.js & PM2 Auto Installer Script 🚀
# ====================================================

echo "🔥 ExoForb Installer - Setting up your environment... 🔥"

# Update & Upgrade sistem
echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

# Install curl & unzip jika belum ada
echo "🛠 Installing curl and unzip..."
sudo apt install -y curl unzip

# Tambahkan NodeSource repo untuk Node.js 20
echo "🌍 Adding NodeSource repository..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

# Install Node.js dan npm
echo "🚀 Installing Node.js and npm..."
sudo apt install -y nodejs

# Install PM2
echo "🛠 Installing PM2..."
npm install -g pm2

# Setup PM2 agar otomatis jalan saat reboot
echo "🔄 Setting up PM2 startup..."
pm2 startup
pm2 save

# Cek versi Node.js, npm, dan PM2 setelah semua instalasi selesai
echo "✅ All installations completed!"
echo "🚀 ExoForb Installation Summary 🚀"
echo "-----------------------------------"
echo "🔍 Node.js version: $(node -v)"
echo "🔍 npm version: $(npm -v)"
echo "🔍 PM2 version: $(pm2 -v)"
echo "-----------------------------------"
echo "🎉 Installation completed! Enjoy your setup! - ExoForb 🎉"
