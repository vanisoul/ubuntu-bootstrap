#!/bin/bash

echo "📦 開始安裝 git..."

# 檢查是否已安裝
if command -v git &> /dev/null; then
    echo "✅ git 已安裝，版本: $(git --version)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 git
echo "📦 安裝 git..."
if sudo apt install -y git; then
    echo "✅ git 安裝成功"
    git --version
else
    echo "❌ git 安裝失敗"
    exit 1
fi

echo "✅ git 安裝完成"