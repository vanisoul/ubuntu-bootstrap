#!/bin/bash

echo "📦 開始安裝 Docker..."

# 檢查是否已安裝
if command -v docker &> /dev/null; then
    echo "✅ Docker 已安裝，版本: $(docker --version)"
    echo "跳過安裝步驟"
    exit 0
fi

# 移除舊版本
echo "🧹 移除舊版本 Docker..."
sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# 安裝必要套件
echo "📋 安裝必要套件..."
sudo apt update
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# 添加 Docker 官方 GPG 金鑰
echo "🔑 添加 Docker GPG 金鑰..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 設定 Docker 儲存庫
echo "📦 設定 Docker 儲存庫..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 安裝 Docker Engine
echo "🐳 安裝 Docker Engine..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 將當前用戶加入 docker 群組
echo "👤 將用戶加入 docker 群組..."
sudo usermod -aG docker $USER

# 啟動並啟用 Docker 服務
echo "🚀 啟動 Docker 服務..."
sudo systemctl enable docker
sudo systemctl start docker

# 驗證安裝
echo "✅ 驗證 Docker 安裝..."
if command -v docker &> /dev/null; then
    echo "✅ Docker 安裝成功"
    docker --version
    echo ""
    echo "📝 注意事項："
    echo "  - 用戶已加入 docker 群組"
    echo "  - 請重新登入或執行 'newgrp docker' 以使群組變更生效"
    echo "  - 測試指令: docker run hello-world"
else
    echo "❌ Docker 安裝失敗"
    exit 1
fi

echo "✅ Docker 安裝完成"