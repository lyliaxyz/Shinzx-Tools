#!/bin/bash

# ======================
# Script Kirim Pesan ke NGL via API
# ======================

# Minta input username NGL
read -p "Masukkan username NGL (tanpa @): " USERNAME

# Minta input pesan
read -p "Masukkan pesan yang ingin dikirim: " MESSAGE

# Device ID random (wajib ada)
DEVICE_ID=$(cat /proc/sys/kernel/random/uuid)

# Kirim request ke API NGL
RESPONSE=$(curl -s -X POST "https://ngl.link/api/submit" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=$USERNAME&question=$MESSAGE&deviceId=$DEVICE_ID")

# Cek hasil response
if [[ $RESPONSE == *"questionId"* ]]; then
  echo "✅ Pesan berhasil dikirim ke @$USERNAME"
else
  echo "❌ Gagal mengirim pesan ke @$USERNAME"
fi

echo "Response: $RESPONSE"
