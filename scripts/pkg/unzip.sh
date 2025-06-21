#!/bin/bash

echo "📦 開始安裝 unzip..."

# 檢查是否已安裝
if command -v unzip &> /dev/null; then
    echo "✅ unzip 已安裝，版本: $(unzip -v | head -n1)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 unzip
echo "📦 安裝 unzip..."
if sudo apt install -y unzip; then
    echo "✅ unzip 安裝成功"
    unzip -v | head -n1
else
    echo "❌ unzip 安裝失敗"
    exit 1
fi

echo "✅ unzip 安裝完成"