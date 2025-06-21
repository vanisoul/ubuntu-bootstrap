#!/bin/bash

echo "🚀 Ubuntu Bootstrap 快速建立工具"
echo "=================================="
echo ""
echo "請選擇要建立的模組類型："
echo "1) 📦 套件安裝模組 (pkg)"
echo "2) 🔧 VSCode 擴展模組 (vscode)"
echo "3) 🛠️  自訂模組"
echo ""

read -p "請輸入選項 (1-3): " choice
read -p "請輸入模組名稱: " module_name

# 驗證模組名稱
if [[ ! "$module_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "❌ 模組名稱只能包含字母、數字、底線和連字號"
    exit 1
fi

case $choice in
    1)
        echo ""
        echo "📦 建立套件模組: $module_name"
        echo "================================"

        # 建立目錄
        mkdir -p "modules/pkg"
        mkdir -p "scripts/pkg"

        # 複製並自訂模板
        cp "templates/pkg.template.toml" "modules/pkg/$module_name.toml"
        cp "templates/pkg.template.sh" "scripts/pkg/$module_name.sh"

        # 替換模板變數
        sed -i "s/{{MODULE_NAME}}/$module_name/g" "modules/pkg/$module_name.toml"
        sed -i "s/{{MODULE_NAME}}/$module_name/g" "scripts/pkg/$module_name.sh"

        # 設定執行權限
        chmod +x "scripts/pkg/$module_name.sh"

        # 自動更新 justfile
        echo "🔄 更新 justfile..."
        scripts/update-justfile.sh > /dev/null 2>&1

        echo "✅ 套件模組建立完成！"
        echo "📁 已建立檔案："
        echo "  ├── modules/pkg/$module_name.toml"
        echo "  └── scripts/pkg/$module_name.sh"
        echo ""
        echo "📝 下一步："
        echo "  1. 編輯 scripts/pkg/$module_name.sh 加入安裝邏輯"
        echo "  2. 執行 './just bootstrap' 自動發現並執行"
        echo "  3. 或執行 './just pkg-$module_name' 單獨測試此模組"
        ;;

    2)
        echo ""
        echo "🔧 建立 VSCode 模組: $module_name"
        echo "=================================="

        # 建立目錄
        mkdir -p "modules/vscode"
        mkdir -p "scripts/vscode"

        # 複製並自訂模板
        cp "templates/vscode.template.toml" "modules/vscode/$module_name.toml"
        cp "templates/vscode.template.sh" "scripts/vscode/$module_name.sh"

        # 替換模板變數
        sed -i "s/{{MODULE_NAME}}/$module_name/g" "modules/vscode/$module_name.toml"
        sed -i "s/{{MODULE_NAME}}/$module_name/g" "scripts/vscode/$module_name.sh"

        # 設定執行權限
        chmod +x "scripts/vscode/$module_name.sh"

        # 自動更新 justfile
        echo "🔄 更新 justfile..."
        scripts/update-justfile.sh > /dev/null 2>&1

        echo "✅ VSCode 模組建立完成！"
        echo "📁 已建立檔案："
        echo "  ├── modules/vscode/$module_name.toml"
        echo "  └── scripts/vscode/$module_name.sh"
        echo ""
        echo "📝 下一步："
        echo "  1. 編輯 scripts/vscode/$module_name.sh 自訂安裝邏輯"
        echo "  2. 執行 './just bootstrap' 自動發現並執行"
        echo "  3. 或執行 './just vscode-$module_name' 單獨測試此模組"
        ;;

    3)
        echo "🛠️ 自訂模組功能開發中..."
        echo "目前支援 pkg 和 vscode 模組類型"
        ;;

    *)
        echo "❌ 無效選項，請重新執行"
        exit 1
        ;;
esac

echo ""
echo "🎉 模組建立完成！"
echo "💡 提示：系統會自動發現新模組，無需手動修改任何設定檔"