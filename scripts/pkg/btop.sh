#!/bin/bash

echo "📦 開始安裝 btop..."

# 檢查是否已安裝
if command -v btop &> /dev/null; then
    echo "✅ btop 已安裝，版本: $(btop --version 2>/dev/null || echo "已安裝")"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 btop
echo "📦 安裝 btop..."
if sudo apt install -y btop; then
    echo "✅ btop 安裝成功"
    btop --version 2>/dev/null || echo "btop 已安裝完成"
else
    echo "❌ btop 安裝失敗"
    exit 1
fi

echo "✅ btop 安裝完成"