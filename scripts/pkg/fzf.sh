#!/bin/bash

echo "📦 開始安裝 fzf..."

if command -v fzf &> /dev/null; then
    echo "✅ fzf 已安裝，版本: $(fzf --version 2>/dev/null || echo "已安裝")"
    echo "跳過安裝步驟"
    exit 0
fi

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --completion --update-rc

echo "✅ fzf 安裝完成"