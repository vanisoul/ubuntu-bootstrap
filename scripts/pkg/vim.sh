#!/bin/bash

echo "📦 開始安裝 vim..."

# 檢查是否已安裝
if command -v vim &> /dev/null; then
    echo "✅ vim 已安裝，版本: $(vim --version | head -n1)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 vim
echo "📦 安裝 vim..."
if sudo apt install -y vim; then
    echo "✅ vim 安裝成功"
    vim --version | head -n1
else
    echo "❌ vim 安裝失敗"
    exit 1
fi

echo "✅ vim 安裝完成"