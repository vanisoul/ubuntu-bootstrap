#!/bin/bash

echo "📦 開始安裝 batcat..."

# 檢查是否已安裝
if command -v batcat &> /dev/null; then
    echo "✅ batcat 已安裝，版本: $(batcat --version)"
    echo "跳過安裝步驟"
    exit 0
fi

# 更新套件清單
echo "🔄 更新套件清單..."
sudo apt update

# 安裝 batcat
echo "📦 安裝 batcat..."
if sudo apt install -y batcat; then
    echo "✅ batcat 安裝成功"
    batcat --version
else
    echo "❌ batcat 安裝失敗"
    exit 1
fi

echo "✅ batcat 安裝完成"

# 寫入 alias 到 ~/.zshrc
echo "" >> ~/.zshrc
echo "# batcat" >> ~/.zshrc
echo "alias bcat='batcat --color=always'" >> ~/.zshrc
echo "export FZF_DEFAULT_OPTS='--preview \"batcat --color=always {}\"'" >> ~/.zshrc