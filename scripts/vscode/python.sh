#!/bin/bash

echo "🔧 設定 Python VSCode 開發環境..."

# 檢查 VSCode 是否已安裝
if ! command -v code &> /dev/null; then
    echo "⚠️  VSCode 未安裝，請先安裝 VSCode"
    echo "💡 提示：可以執行 'sudo snap install code --classic' 安裝"
    exit 1
fi

# 從檔案讀取擴展清單
if [ -f "config/extensions/python-extensions.txt" ]; then
    echo "📋 從清單安裝 Python 擴展..."
    mapfile -t extensions < "config/extensions/python-extensions.txt"
    installed_count=0
    failed_count=0

    for ext in "${extensions[@]}"; do
        # 跳過空行和註解
        if [[ -n "$ext" && ! "$ext" =~ ^[[:space:]]*# ]]; then
            echo "  ├── 安裝 $ext"
            if code --install-extension "$ext" --force; then
                ((installed_count++))
            else
                echo "  ❌ 安裝 $ext 失敗"
                ((failed_count++))
            fi
        fi
    done

    echo "📊 擴展安裝摘要："
    echo "  ├── 成功安裝: $installed_count 個"
    echo "  └── 安裝失敗: $failed_count 個"
else
    echo "⚠️  找不到 config/extensions/python-extensions.txt"
fi

# 設定 Python VSCode 設定檔
echo "⚙️  設定 Python 開發環境..."
mkdir -p ~/.config/Code/User

# 建立 Python 專用設定
cat > ~/.config/Code/User/python-settings.json << 'EOF'
{
    "python.defaultInterpreterPath": "/usr/bin/python3",
    "python.linting.enabled": true,
    "python.linting.pylintEnabled": true,
    "python.linting.flake8Enabled": true,
    "python.formatting.provider": "black",
    "python.formatting.blackArgs": ["--line-length=88"],
    "python.sortImports.args": ["--profile", "black"],
    "python.analysis.autoImportCompletions": true,
    "python.analysis.typeCheckingMode": "basic",
    "jupyter.askForKernelRestart": false,
    "jupyter.interactiveWindow.creationMode": "perFile",
    "[python]": {
        "editor.formatOnSave": true,
        "editor.codeActionsOnSave": {
            "source.organizeImports": true
        },
        "editor.tabSize": 4,
        "editor.insertSpaces": true
    }
}
EOF

echo "📁 Python 設定檔已建立: ~/.config/Code/User/python-settings.json"

# 檢查 Python 環境
echo "🐍 檢查 Python 環境..."
if command -v python3 &> /dev/null; then
    echo "  ✅ Python3: $(python3 --version)"
else
    echo "  ❌ Python3 未安裝"
fi

if command -v pip3 &> /dev/null; then
    echo "  ✅ pip3: $(pip3 --version)"
else
    echo "  ❌ pip3 未安裝"
fi

echo ""
echo "✅ Python VSCode 環境設定完成"
echo "💡 建議安裝的 Python 套件："
echo "  pip3 install black flake8 pylint mypy jupyter"