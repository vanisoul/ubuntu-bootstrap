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
echo "📦 掃描套件模組..."
pkg_count=0

# 收集所有 pkg 模組並按權重排序
declare -a pkg_modules
for pkg_dir in scripts/pkg/*/; do
    if [ -d "$pkg_dir" ] && [ -f "$pkg_dir/justfile" ] && [ -f "$pkg_dir/meta.json" ]; then
        pkg_name=$(basename "$pkg_dir")
        weight=$(jq -r '.weight // 100' "$pkg_dir/meta.json" 2>/dev/null || echo "100")
        pkg_modules+=("$weight:$pkg_name")
        ((pkg_count++))
    fi
done

echo "  └── 共發現 $pkg_count 個套件模組"

# 按權重排序（權重越高越前面，所以使用 -rn 反向排序）
if [ ${#pkg_modules[@]} -gt 0 ]; then
    echo "📦 開始執行套件安裝..."
    IFS=$'\n' sorted_modules=($(sort -rn <<< "${pkg_modules[*]}"))

    for module_entry in "${sorted_modules[@]}"; do
        weight="${module_entry%%:*}"
        pkg_name="${module_entry##*:}"

        echo ""
        echo "🔧 處理套件: $pkg_name (權重: $weight)"

        if [ -f "scripts/pkg/$pkg_name/justfile" ]; then
            # 先執行 install
            echo "  ├── 執行安裝..."
            XDG_RUNTIME_DIR=/tmp ./just -f ./scripts/pkg/$pkg_name/justfile install
            install_result=$?

            # 再執行 check
            echo "  └── 執行檢查..."
            XDG_RUNTIME_DIR=/tmp ./just -f ./scripts/pkg/$pkg_name/justfile check

            if [ $install_result -ne 0 ]; then
                echo "  ❌ $pkg_name 安裝失敗"
            else
                echo "  ✅ $pkg_name 處理完成"
            fi
        fi
    done

    echo ""
    echo "✅ 所有套件處理完成！"
fi

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