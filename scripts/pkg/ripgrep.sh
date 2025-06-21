#!/bin/bash

echo "📦 開始安裝 ripgrep..."

if command -v ripgrep &> /dev/null; then
    echo "✅ rg 已安裝，版本: $(rg --version 2>/dev/null || echo "已安裝")"
    echo "跳過安裝步驟"
    exit 0
fi

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
sudo dpkg -i ripgrep_14.1.1-1_amd64.deb
rm ripgrep_14.1.1-1_amd64.deb

echo "✅ ripgrep 安裝完成"