# Ubuntu Bootstrap 優化版 - Just 任務管理
# 使用方法: ./just <task_name>

# 預設任務：顯示所有可用任務
default:
    @echo "🚀 Ubuntu Bootstrap 優化版"
    @echo "=========================="
    @echo ""
    @echo "可用任務："
    @echo "  📦 bootstrap    - Ubuntu 環境初始化主流程（自動發現所有模組）"
    @echo "  🛠️  create       - 快速建立新模組（互動式工具）"
    @echo "  📋 list-modules - 列出所有可用模組"
    @echo "  🧹 clean        - 清理暫存檔案"
    @echo ""
    @echo "使用方法: ./just <task_name>"

# 主要初始化流程
bootstrap:
    @scripts/run-all.sh

# 快速建立新模組
create:
    @scripts/create-module.sh

# 列出所有可用模組
list-modules:
    @echo "📦 套件模組："
    @ls scripts/pkg/*.sh 2>/dev/null | sed 's|scripts/pkg/||g' | sed 's|\.sh||g' | sed 's|^|  ├── |g' || echo "  └── 無套件模組"
    @echo "  └── ......等待您加入更多套件"
    @echo ""
    @echo "🔧 VSCode 模組："
    @ls scripts/vscode/*.sh 2>/dev/null | sed 's|scripts/vscode/||g' | sed 's|\.sh||g' | sed 's|^|  ├── |g' || echo "  └── 無 VSCode 模組"
    @echo "  └── ......等待您加入更多模組"

# 清理暫存檔案
clean:
    @echo "🧹 清理暫存檔案..."
    @find . -name "*.tmp" -delete 2>/dev/null || true
    @find . -name "*.log" -delete 2>/dev/null || true
    @echo "✅ 清理完成"
