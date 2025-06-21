#!/bin/bash

echo "📦 開始安裝 {{MODULE_NAME}}..."

# ===========================================
# TODO: 在此處添加 {{MODULE_NAME}} 安裝邏輯
# ===========================================

# 範例 1: APT 套件安裝
# sudo apt update
# sudo apt install -y package-name

# 範例 2: 下載並安裝
# curl -fsSL https://example.com/install.sh | bash

# 範例 3: 從 GitHub 下載
# wget https://github.com/user/repo/releases/download/v1.0.0/binary
# sudo mv binary /usr/local/bin/
# sudo chmod +x /usr/local/bin/binary

# 範例 4: Docker 安裝
# curl -fsSL https://get.docker.com | sh
# sudo usermod -aG docker $USER

# 驗證安裝
# if command -v your-command &> /dev/null; then
#     echo "✅ {{MODULE_NAME}} 安裝成功"
# else
#     echo "❌ {{MODULE_NAME}} 安裝失敗"
#     exit 1
# fi

echo "✅ {{MODULE_NAME}} 安裝完成"