#!/bin/bash

echo "📦 開始安裝 bat..."

# 檢查是否已安裝
if command -v bat &> /dev/null; then
    echo "✅ bat 已安裝，版本: $(bat --version)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 bat
echo "📦 安裝 bat..."
if sudo apt install -y bat; then
    echo "✅ bat 安裝成功"
    bat --version
else
    echo "❌ bat 安裝失敗"
    exit 1
fi

echo "✅ bat 安裝完成"

# 寫入 alias 到 ~/.zshrc
echo "" >> ~/.zshrc
echo "# batcat" >> ~/.zshrc
echo "alias bcat='batcat'" >> ~/.zshrc