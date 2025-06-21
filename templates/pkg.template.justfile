# {{MODULE_NAME}} 套件管理
# 使用方法: just <task_name>

# 預設任務：顯示可用任務
default:
    @echo "📦 {{MODULE_NAME}} 套件管理"
    @echo "=========================="
    @echo ""
    @echo "可用任務："
    @echo "  🔍 check    - 檢查是否已安裝"
    @echo "  📦 install  - 執行安裝"
    @echo ""
    @echo "使用方法: just <task_name>"

# 檢查是否已安裝
check:
    #!/usr/bin/env bash
    echo "🔍 檢查 {{MODULE_NAME}} 安裝狀態..."
    if command -v {{MODULE_NAME}} &> /dev/null; then \
        echo "✅ {{MODULE_NAME}} 已安裝，版本: $({{MODULE_NAME}} --version 2>/dev/null || echo "已安裝")"; \
    else \
        echo "❌ {{MODULE_NAME}} 尚未安裝"; \
    fi

# 執行安裝
install:
    #!/usr/bin/env bash
    echo "🚀 執行 {{MODULE_NAME}} 安裝..."
    just _do_install
    echo "✅ {{MODULE_NAME}} 安裝完成"


# 內部安裝邏輯
_do_install:
    #!/usr/bin/env bash
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

    # 可選：添加到 .zshrc
    # echo "" >> ~/.zshrc
    # echo "# {{MODULE_NAME}}" >> ~/.zshrc