#!/bin/bash

echo "📦 開始安裝 wget..."

# 檢查是否已安裝
if command -v wget &> /dev/null; then
    echo "✅ wget 已安裝，版本: $(wget --version | head -n1)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 wget
echo "📦 安裝 wget..."
if sudo apt install -y wget; then
    echo "✅ wget 安裝成功"
    wget --version | head -n1
else
    echo "❌ wget 安裝失敗"
    exit 1
fi

echo "✅ wget 安裝完成"