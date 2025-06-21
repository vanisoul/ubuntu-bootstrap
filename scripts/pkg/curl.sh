#!/bin/bash

echo "📦 開始安裝 curl..."

# 檢查是否已安裝
if command -v curl &> /dev/null; then
    echo "✅ curl 已安裝，版本: $(curl --version | head -n1)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 curl
echo "📦 安裝 curl..."
if sudo apt install -y curl; then
    echo "✅ curl 安裝成功"
    curl --version | head -n1
else
    echo "❌ curl 安裝失敗"
    exit 1
fi

echo "✅ curl 安裝完成"