#!/bin/bash

echo "🔧 設定 {{MODULE_NAME}} VSCode 開發環境..."

# ===========================================
# TODO: 在此處添加 {{MODULE_NAME}} VSCode 設定邏輯
# ===========================================

# 直接在腳本中定義擴展
# EXTENSIONS=(
#     "ms-python.python"
#     "ms-python.pylint"
#     "ms-python.black-formatter"
# )
#
# for ext in "${EXTENSIONS[@]}"; do
#     echo "  ├── 安裝 $ext"
#     code --install-extension "$ext"
# done

# 設定 VSCode 設定檔
# mkdir -p ~/.config/Code/User
# cat > ~/.config/Code/User/settings.json << 'EOF'
# {
#     "python.defaultInterpreterPath": "/usr/bin/python3",
#     "python.linting.enabled": true
# }
# EOF

echo "✅ {{MODULE_NAME}} VSCode 環境設定完成"