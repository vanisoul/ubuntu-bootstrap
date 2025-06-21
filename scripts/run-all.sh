#!/bin/bash

echo "🚀 Ubuntu Bootstrap 優化版"
echo "🔍 自動發現並執行所有模組..."

# 發現並執行 SSH 模組
echo "📡 執行 SSH 初始化..."
if [ -f "scripts/ssh/init.sh" ]; then
    scripts/ssh/init.sh
fi

# 發現並執行 Shell 模組
echo "🐚 執行 Shell 初始化..."
if [ -f "scripts/shell/init.sh" ]; then
    scripts/shell/init.sh
fi

# 🎯 自動發現所有 pkg 模組
echo "📦 自動發現套件模組..."
pkg_count=0
for pkg_file in scripts/pkg/*.sh; do
    if [ -f "$pkg_file" ]; then
        pkg_name=$(basename "$pkg_file" .sh)
        echo "  ├── 安裝 $pkg_name"
        if [ -f "scripts/pkg/$pkg_name.sh" ]; then
            scripts/pkg/$pkg_name.sh
        fi
        ((pkg_count++))
    fi
done
echo "  └── 共發現 $pkg_count 個套件模組"

# 🎯 自動發現所有 vscode 模組
echo "🔧 自動發現 VSCode 模組..."
vscode_count=0
for vscode_file in scripts/vscode/*.sh; do
    if [ -f "$vscode_file" ]; then
        vscode_name=$(basename "$vscode_file" .sh)
        echo "  ├── 設定 $vscode_name 開發環境"
        if [ -f "scripts/vscode/$vscode_name.sh" ]; then
            scripts/vscode/$vscode_name.sh
        fi
        ((vscode_count++))
    fi
done
echo "  └── 共發現 $vscode_count 個 VSCode 模組"

echo ""
echo "✅ 所有模組執行完成！"
echo "📊 執行摘要："
echo "  ├── 套件模組: $pkg_count 個"
echo "  └── VSCode 模組: $vscode_count 個"