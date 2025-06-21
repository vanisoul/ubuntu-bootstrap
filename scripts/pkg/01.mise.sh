#!/bin/bash

echo "📦 開始安裝 mise..."

if command -v mise &> /dev/null; then
    echo "✅ mise 已安裝，版本: $(mise --version 2>/dev/null || echo "已安裝")"
    echo "跳過安裝步驟"
    exit 0
fi

curl https://mise.run | sh

echo "" >> ~/.zshrc
echo "# mise" >> ~/.zshrc
echo 'eval "$(~/.local/bin/mise activate zsh)"' >> ~/.zshrc

echo "✅ mise 安裝完成"
