# AI 敏捷團隊 — 可攜團隊包

一支 **32 角色的 AI 敏捷團隊**（Claude Code subagent）+ 9 個共用 skill + 素材庫 + 跨專案知識共享系統。
打包成可攜形式，安裝一次，所有專案自動套用。

---

## 安裝

```bash
git clone <this-repo> ~/claude-team
cd ~/claude-team
bash install.sh
```

重開 Claude Code，所有專案即可使用這支團隊。

> `install.sh` 會把 agents/、skills/、references/、CLAUDE.md 複製到 `~/.claude/`，
> 並為 `assets/` 和 `team-knowledge/` 建立 symlink 指回本 repo（跨專案知識共享用）。

---

## 包含什麼

```
claude-team/
├── agents/             25 個角色 agent
├── skills/             9 個共用 skill
├── references/         外部引入素材庫（唯讀）
├── assets/             自有打磨素材庫（agent 可寫入）
├── team-knowledge/     跨專案知識記錄
│   ├── index.md
│   └── sessions/
├── scripts/
│   └── update-index.sh
├── CLAUDE.md           全域工作準則
└── install.sh
```

---

## 32 個 Agent 一覽

### 行銷策略層
| Agent | 職責 |
|-------|------|
| `market-analyst` | 市場機會、競品、產業趨勢分析 |
| `marketing` | 成長策略、通路規劃、行銷活動（不含社群執行） |
| `business-model-designer` | BMC、收費模式、定價策略、價值主張、變現路徑 |
| `business-developer` | 夥伴開發、B2B 銷售漏斗、合作提案、Pitch deck |

### 內容 / 社群層
| Agent | 職責 |
|-------|------|
| `social-media-manager` | FB/IG/Threads 每週貼文、發文行事曆、3 版本改寫 |
| `viral-optimizer` | 貼文病毒分數 0–100、殺觸及診斷、改寫優化版本 |
| `copywriter` | UI 文字、Landing Page、Sales Page 轉換型文案 |
| `seo-specialist` | 關鍵字機會圖、競品拆解、SEO 大綱、meta 標題 |

### 數據 / 廣告 / 分析層
| Agent | 職責 |
|-------|------|
| `performance-marketer` | Meta/Google 廣告投放、每日數據決策、受眾分配 |
| `data-analyst` | 產品數據、留存漏斗、A/B 測試（不含廣告數據） |
| `business-analyst` | BRD、業務流程 gap、ROI 試算、利害關係人分析 |

### 產品層
| Agent | 職責 |
|-------|------|
| `product-manager` | 需求釐清、功能規格、驗收標準 |
| `project-manager` | 任務拆解、排程、相依關係追蹤 |

### 設計層
| Agent | 職責 |
|-------|------|
| `ux-designer` | 使用者流程、資訊架構、靜態互動設計 |
| `ui-designer` | 視覺元件、版面配置、元件狀態規格 |
| `art-designer` | 色彩設計、插畫、視覺素材 |
| `brand-designer` | 品牌識別系統、logo、品牌規範書 |
| `motion-designer` | 動畫腳本、micro-interaction、轉場編排 |
| `interaction-designer` | 互動流程、手勢設計、狀態轉換邏輯 |
| `content-strategist` | 資訊架構策略、內容層次、SEO 語意結構 |

### 工程層
| Agent | 職責 |
|-------|------|
| `architect` | 系統設計、技術選型、資料結構 |
| `fullstack-engineer` | React / TypeScript / Firebase 實作 |
| `performance-engineer` | Core Web Vitals、bundle 分析、圖片優化 |
| `accessibility-reviewer` | WCAG 合規、螢幕閱讀器、焦點流程 |
| `devops` | 部署、CI/CD、環境變數、排程 |
| `security-reviewer` | 身分驗證、DB 規則、密鑰、權限 |
| `code-reviewer` | 程式碼品質、bug、慣例審查 |
| `qa-tester` | 測試計畫、驗收、功能行為驗證 |

### 治理層
| Agent | 職責 |
|-------|------|
| `tech-writer` | 系統架構 / 機制 / 版本紀錄三份文件 |
| `legal` | 服務條款、隱私政策、版權合規 |
| `risk-manager` | 技術 / 營運 / 商業風險評估 |
| `auditor` | 流程遵循、角色邊界稽核 |

---

## 你可以說的指令

總指揮（主線 Claude）看到以下關鍵字，會自動派對應的 agent 執行：

### 開發流程

| 你說 | 總指揮做什麼 | 派出的 agent |
|------|------------|-------------|
| `我要做功能 X`（或任何產品 / 功能描述）| 無論說得多細，PM 都必須與使用者確認 → 各角色並行提交觀點 → 總指揮產出 kickoff-meeting-notes.md | product-manager + 相關 agent |
| `sprint 完成` | 各 agent 寫本次任務報告到 sessions/（draft）| 相關 agent |
| `做個技術審查` | 啟動程式碼審查 + 資安審查 | code-reviewer、security-reviewer |
| `部署` | 執行部署前檢查清單 + 部署 | devops |
| `更新文件` | 同步更新三份系統文件 | tech-writer |

### 知識管理

| 你說 | 總指揮做什麼 | 說明 |
|------|------------|------|
| `收割` / `知識收割` | 掃描本專案所有 draft sessions → 四關卡評估 → 通過的升級進 assets/ | 只在你主動觸發時執行 |
| `結案` | 知識收割 → 更新三份系統文件 → commit | 專案最終交付後用 |
| `專案完成` | 同 `結案` | — |

### 品質 / 合規

| 你說 | 總指揮做什麼 | 派出的 agent |
|------|------------|-------------|
| `做無障礙審查` | WCAG 合規全面審查 | accessibility-reviewer |
| `效能審查` | Core Web Vitals 分析 + 優化建議 | performance-engineer |
| `資安審查` | 權限、密鑰、端點安全審查 | security-reviewer |
| `法務審查` | 服務條款、隱私政策、版權確認 | legal、risk-manager |

---

## 知識如何在專案間流動

```
專案 A（sprint 進行中）
  → agent 完工 → 寫 sessions/YYYY-MM-DD_projectA_ui-designer.md（status: draft）

專案 A（交付後，你說「收割」）
  → 掃描所有 draft sessions → 四關卡評估
  → 通過 → 寫入 assets/（status: final）
  → 未通過 → 標記 archived，留記錄

git commit + push 本 repo
  ↓
專案 B git pull 取得本 repo
  → agent 開工前讀取 assets/ 和 sessions/
  → 吸收專案 A 的實戰經驗
```

**sessions/ 只增不改**：包含被推翻的決策，也是寶貴記錄。
**assets/ 只有「收割」時才寫入**：確保只有最終交付版本的知識進入。

---

## 各專案如何客製化

各專案不能修改共通包，只能在自己的 repo 內覆寫：

```
<你的專案>/.claude/
└── skills/
    └── design-system/SKILL.md    ← 填入品牌色、字型、具體 CSS 值
```

共通包的 `design-system` skill 只含原則（禁用字體、色彩禁止模式、動畫規則等），
具體的 `#XXXXXX` 色值、`clamp()` 數值、Tailwind class 都在專案覆寫版填入。

詳細架構說明見 [docs/architecture.md](docs/architecture.md)。

---

## 素材庫說明

| 目錄 | 性質 | 說明 |
|------|------|------|
| `references/` | 唯讀 | 從 taste-skill、ui-ux-pro-max 引入的外部最佳實踐 |
| `assets/` | 可寫 | 跑過真實專案後打磨出的自有素材，agent 驗證後寫入 |

`assets/` 會隨專案累積越來越強。目標：跑過 3–5 個專案後，以自有素材取代外部引入素材。
