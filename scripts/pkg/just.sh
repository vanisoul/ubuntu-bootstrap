#!/bin/bash

echo "📦 開始安裝 just..."

if command -v just &> /dev/null; then
    echo "✅ just 已安裝，版本: $(just --version 2>/dev/null || echo "已安裝")"
    echo "跳過安裝步驟"
    exit 0
fi

mise use -g just

echo "✅ just 安裝完成"