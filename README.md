# Ubuntu Bootstrap 優化版

🚀 一個基於 justfile 的自動化 Ubuntu 環境設定系統，支援模組化管理和自動發現機制。

## ✨ 特色功能

- 🔍 **自動發現** - 系統會自動發現並執行所有模組，無需手動維護依賴關係
- 🛠️ **快速建立** - 提供互動式工具，一鍵建立新模組
- 📦 **模組化設計** - 每個功能都是獨立模組，易於維護和擴展
- 🎯 **約定優於設定** - 遵循命名規則即可，無需複雜配置
- ⚡ **Just 任務管理** - 使用 justfile 進行高效的任務管理

## 🚀 快速開始

### 1. 查看可用任務

```bash
./just
```

### 2. 執行所有初始化

```bash
# 自動發現並執行所有模組
./just bootstrap
```

### 3. 查看所有模組

```bash
./just list-modules
```

## 📦 新增模組

### 新增套件模組

```bash
# 1. 使用快速建立工具
./just create
# 選擇 1 (pkg)，輸入模組名稱

# 2. 編輯生成的安裝腳本
vim scripts/pkg/your-module.sh

# 3. 執行
./just bootstrap
```

### 新增 VSCode 擴展模組

```bash
# 1. 使用快速建立工具
./just create
# 選擇 2 (vscode)，輸入模組名稱

# 2. 編輯生成的安裝腳本
vim scripts/vscode/your-module.sh

# 3. 執行
./just bootstrap
```

## 📁 專案結構

```
ubuntu-bootstrap/
├── justfile                      # Just 任務定義檔
├── just                          # Just CLI 工具
├── templates/                    # 模組模板
│   ├── pkg.template.sh
│   └── vscode.template.sh
├── scripts/                      # 實作腳本
│   ├── run-all.sh                # 自動發現執行器
│   ├── create-module.sh          # 快速建立工具
│   ├── pkg/                      # 套件安裝腳本
│   └── vscode/                   # VSCode 設定腳本
└── README.md
```

## 🎯 使用範例

### 管理任務

```bash
# 查看所有可用任務
./just

# 列出所有模組
./just list-modules

# 清理暫存檔案
./just clean
```

## 🛠️ 進階功能

### 條件執行

模組可以包含條件邏輯，避免重複安裝：

```bash
if ! command -v docker &> /dev/null; then
    echo "📦 Docker 未安裝，開始安裝..."
    # 安裝邏輯
else
    echo "✅ Docker 已安裝，跳過"
fi
```

### 依賴管理

模組可以檢查前置條件：

```bash
if ! command -v curl &> /dev/null; then
    echo "❌ 需要先安裝 curl"
    exit 1
fi
```

### 錯誤處理

統一的錯誤處理機制：

```bash
set -euo pipefail  # 嚴格模式
trap 'echo "❌ 安裝過程中發生錯誤"' ERR
```

## 🚀 Just 任務管理優勢

- **簡潔語法** - justfile 語法簡單易懂
- **快速執行** - 直接執行，無需額外工具
- **動態生成** - 自動生成模組對應的任務
- **跨平台** - 支援多種作業系統
- **高效能** - 比傳統 Makefile 更快

## 📄 授權條款

此專案採用 MIT 授權條款 - 詳見 [LICENSE](LICENSE) 檔案

## 🎉 總結

現在新增功能就像這樣簡單：

1. `./just create`
2. 選擇類型，輸入名稱
3. 編輯生成的腳本
4. `./just bootstrap` 自動執行