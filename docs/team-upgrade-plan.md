# AI 敏捷團隊升級計畫 v2

> 基於三個 repo 完整原始碼閱讀後的整合結論。
> 最後更新：2026-06-08

---

## 升級目標

| 項目 | 升級前 | 升級後 |
|------|--------|--------|
| Agent 數量 | 19 個 | 32 個（+13 新增） |
| Skill 數量 | 6 個 | 9 個（+3 新增） |
| 素材庫 | 無 | Phase 1 引入，Phase 2 打磨成自有資產 |
| 跨專案知識共享 | 無 | team-knowledge 系統（symlink 方案） |
| 輸出品質框架 | 無 | 反懶惰框架（+45–115% 品質提升） |
| SKILL.md 格式 | 職責描述 | 決策樹風格（taste-skill 格式） |

---

## 新增 13 個 Agent

### 第一批 — 設計 / 工程專責化（6 個）

| Agent | 專責職責 | 目前缺口 |
|-------|---------|---------|
| `brand-designer` | 品牌識別系統、logo、品牌規範書 | 無人負責品牌層設計 |
| `motion-designer` | 動畫設計、micro-interaction、轉場編排 | 動畫散落各 agent，無專責 |
| `accessibility-reviewer` | WCAG 合規審查、螢幕閱讀器測試、焦點流程 | 無人專責無障礙品質門閘 |
| `performance-engineer` | Core Web Vitals、LCP/CLS/INP、bundle 分析 | 散落在 architect/code-reviewer，無專責 |
| `interaction-designer` | 互動流程設計、手勢設計、動態邏輯（非視覺） | ux-designer 側重靜態流程，動態互動缺口 |
| `content-strategist` | 資訊架構策略、內容層次、SEO 語意結構 | ux-designer 難兼顧內容策略深度 |

### 第二批 — 行銷 / 商業專責化（7 個）

| Agent | 對應 | 專責職責 | 目前缺口 |
|-------|------|---------|---------|
| `social-media-manager` | MAYA | FB/IG/Threads 貼文、每週行事曆、3 版本改寫 | `marketing` 太廣，無平台專業 |
| `seo-specialist` | IRIS | 關鍵字機會圖、競品文章拆解、SEO 大綱、meta 標題 | `content-strategist` 只到語意層，缺技術 SEO |
| `performance-marketer` | JACK | Meta/Google 廣告投放、每日數據決策、受眾分配 | 完全缺口，廣告數據無人負責 |
| `viral-optimizer` | Theo | 貼文病毒分數 0–100、殺觸及診斷、改寫優化版本 | 無任何評分 / 優化機制 |
| `business-analyst` | — | BRD、業務流程 gap 分析、ROI 試算、利害關係人分析 | `product-manager` 只做 PRD，無 BRD |
| `business-model-designer` | — | BMC、收費模式、定價策略、價值主張、變現路徑 | 無人設計商業模式 |
| `business-developer` | — | 夥伴開發、B2B 銷售漏斗、合作提案、Pitch deck | 完全缺口，B2B/通路無人負責 |

---

## 行銷層優化（既有 agent 調整）

| Agent | 調整方向 | 說明 |
|-------|---------|------|
| `marketing` | **精簡職責** | 剝掉社群小編，專注成長策略 + 通路規劃 + 行銷活動 |
| `copywriter` | **強化職責** | 加入 Landing Page、Sales Page 轉換型文案結構 |
| `data-analyst` | **維持原職** | 只看產品數據；廣告數據歸 `performance-marketer` |

**優化後行銷層全貌（11 個 agent）**：
```
策略層
  market-analyst          ← 市場研究、競品、產業趨勢
  marketing               ← 成長策略、通路規劃（精簡後）
  business-model-designer ← 商業模式、定價、變現
  business-developer      ← 夥伴開發、B2B 銷售

內容 / 社群層
  social-media-manager    ← 貼文、行事曆、平台分工
  viral-optimizer         ← 病毒分數、殺觸及、改寫優化
  copywriter              ← 轉換型文案（強化後）
  seo-specialist          ← 關鍵字、SEO 大綱

數據 / 廣告 / 分析層
  performance-marketer    ← 廣告投放、每日數據決策
  data-analyst            ← 產品數據（留存、轉換漏斗）
  business-analyst        ← 業務流程、ROI、BRD
```

---

## 三個 Repo 核心洞察

### taste-skill — 最高槓桿：research/laziness
- AI 輸出懶是設計使然（RLHF 訓練壓縮輸出）
- 心理框架提示組合使用可提升最高 +115% 輸出品質
- 三旋鈕調控框架（Variance / Motion / Density）直接用於 design-system
- SKILL.md 格式：決策樹風格（非職責描述），搭配 `<職責>`、`<禁止>`、`<工作步驟>`、`<完工前驗證>` XML 分隔

| 技巧 | 效果 |
|------|------|
| 心理框架（「不完整就是失敗」） | +45% 輸出品質 |
| 逐步指令（「一步一步來」） | 邏輯準確率 34% → 80% |
| 風險框架（「這對任務至關重要」） | +10% |
| 組合使用 | 最高 +115% |

### ruflo — 借概念，不借基礎建設
- 並發優先、3-Tier 模型分層 → 整合進 feature-workflow
- 知識共享概念 → 檔案系統 + Hook 輕量實作（無需 local server）
- SPARC 5 階段品質門閘 → 大型任務強制流程
- 防重複：同一批程式碼不讓兩個 agent 同時修改

### ui-ux-pro-max — 最完整的品質標準庫 + 素材庫
- 10 類設計品質標準（字型、色彩、佈局、動畫、無障礙、響應式、互動、內容、性能、品牌）
- 22 種視覺風格方向（供 art-designer 參考）
- 具體素材庫：color palettes、typography pairings、brand templates、banner sizes

---

## 素材庫策略：兩階段做法

### Phase 1 — 引入參考素材（立即執行）
從 taste-skill 和 ui-ux-pro-max 直接引入素材作為 agent 的參考資料：
```
~/.claude/references/
├── typography/        ← 字型配對、字重規格（來自 taste-skill）
├── color-palettes/    ← 色票、對比度表（來自 ui-ux-pro-max）
├── visual-styles/     ← 22 種視覺風格方向（來自 ui-ux-pro-max）
├── brand-templates/   ← 品牌規範模板（來自 ui-ux-pro-max）
├── banner-sizes/      ← 社群/廣告尺寸清單（來自 ui-ux-pro-max）
└── animation/         ← 緩動、時間規格（來自 taste-skill + ui-ux-pro-max）
```

### Phase 2 — 打磨成自有資產（隨專案迭代）
- 每個實際專案使用後，將經過打磨的決策寫入 team-knowledge
- 逐步替換 Phase 1 的引入素材，形成自己的品牌資產庫
- 目標：團隊跑過 3–5 個專案後，references/ 全部替換為自有素材

---

## team-knowledge 架構（跨專案知識共享）

```
共通包 repo（本 repo）：
  team-knowledge/
  ├── index.md               ← Hook 自動更新（目錄）
  └── sessions/              ← 各 agent 完工後寫入
        ├── YYYY-MM-DD_project-foo_ui-designer.md
        └── YYYY-MM-DD_project-bar_architect.md

install.sh 建立 symlink：
  ln -sf "$DIR/team-knowledge" ~/.claude/team-knowledge

效果：
  任何專案的 agent 寫入 ~/.claude/team-knowledge/sessions/
  → 實際寫入本 repo 的 team-knowledge/sessions/
  → git commit/push = 跨機器 / 跨專案共享
```

**Session 檔名格式**：`YYYY-MM-DD_<project-name>_<agent-role>.md`

**PostToolUse Hook（自動觸發）**：
```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Write|Edit",
      "hooks": [{"type": "command", "command": "bash ~/.claude/scripts/update-index.sh"}]
    }]
  }
}
```

---

## design-system Skill 分層

```
~/.claude/skills/design-system/SKILL.md      ← 共通包：原則層（無框架綁定）
<專案>/.claude/skills/design-system/SKILL.md ← 專案覆寫：品牌色、字型、具體 CSS 值
```

**共通包只包含**：三旋鈕、禁用字體清單、色彩禁止模式、佈局原則、動畫原則、無障礙原則、Pre-Flight 清單
**專案覆寫填入**：`--color-primary: #XXXXXX`、實際字型名稱、`clamp()` 具體值、Tailwind class

---

## 完整待辦清單

---

### Task 1 — 修訂 `design-system` skill（去除框架綁定）
**優先級：P0** | 狀態：`[x] 已完成`

**問題**：現有版本含 Tailwind 專屬語法（`pt-24`、`max-w-6xl`、`clamp()` 具體值），不適合共通包。

**修訂方向**：
- 保留：三旋鈕、禁用字體清單、色彩禁止模式、佈局原則、動畫原則、Pre-Flight 清單
- 移除：所有 Tailwind class、具體 px/rem 數值、`clamp()` 具體值
- 新增：說明「具體 CSS 實作請在專案覆寫版填入」
- 格式：改為決策樹風格（taste-skill 格式）

---

### Task 2 — 建立 `output-quality` skill
**優先級：P0** | 狀態：`[x] 已完成`

**來源**：taste-skill output-skill + ruflo 紀律 + research/laziness 研究

**內容**：
- 禁止省略：`// ...`、骨架代碼、佔位符描述、「讓我知道是否需要繼續」
- 完整交付原則：列舉預期交付件 → 全部生成 → 驗證數量
- Token 限制處理：`[PAUSED — X of Y complete. Send "continue" to resume]`
- AI 陳詞禁止清單（seamless / unleash / game-changer / 99.99% 等）
- 心理框架提示（研究實測：+45% 品質）
- 反懶惰強制語言範本

---

### Task 3 — 建立 team-knowledge 知識共享系統
**優先級：P0** | 狀態：`[x] 已完成`

**需建立 / 修改的檔案**：

| 檔案 | 動作 | 說明 |
|------|------|------|
| `team-knowledge/index.md` | 新增 | 知識庫目錄，Hook 自動更新 |
| `team-knowledge/sessions/` | 新增 | 空目錄（含 .gitkeep） |
| `skills/knowledge-capture/SKILL.md` | 新增 | Agent 完工後寫入的格式規範（含四關卡判斷邏輯） |
| `scripts/update-index.sh` | 新增 | Hook 觸發後更新 team-knowledge/index.md |
| `install.sh` | 修改 | 新增：symlink team-knowledge 和 assets/、複製 scripts/、合併 Hook 到 settings.json |

**knowledge-capture skill 核心內容**：

1. **觸發時機**：凡是有載入此 skill 的 agent，完工流程最後一步必須執行知識沉澱
2. **四關卡自評**（對自己的輸出逐一回答）：
   - 關卡 1：這個素材在本專案被真實採用（非備選）？
   - 關卡 2：使用者確認或 QA 驗證通過？
   - 關卡 3：去掉品牌後，其他同類專案也能直接用？
   - 關卡 4：是具體可用的規格值（非原則描述）？
3. **分流結果**：
   - 四關全過 → 寫入 `~/.claude/assets/<類別>/`（結構化規格 + frontmatter）
   - 部分通過 → 寫入 `~/.claude/team-knowledge/sessions/`（文字記錄 + 決策原因）
   - 都沒過 → 不寫（在 session summary 簡短記錄「為什麼不值得留」）
4. **project_type 標準分類**（frontmatter 必須用以下之一）：
   `saas-tool` / `ecommerce` / `content-site` / `brand-site` / `dashboard` / `mobile-app` / `marketing-site`

**需載入 knowledge-capture 的 agent**（產出素材類）：
- ui-designer、ux-designer、art-designer
- brand-designer、motion-designer、interaction-designer、content-strategist
- fullstack-engineer（限視覺/性能相關決策）

**不需載入的 agent**（產出非素材類）：
- architect、qa-tester、code-reviewer、devops、security-reviewer 等

---

### Task 3b — 建立 `knowledge-harvest` skill + 更新 CLAUDE.md 指令表
**優先級：P0** | 狀態：`[x] 已完成`

**建立 `skills/knowledge-harvest/SKILL.md`**，定義收割執行流程：
1. 掃描 `~/.claude/team-knowledge/sessions/` 中本專案所有 `status: draft` 記錄
2. 逐筆跑四關卡評估
3. 通過：寫入 `~/.claude/assets/<類別>/`，session 標記 `status: final`
4. 未通過：session 標記 `status: archived`
5. 完成後回報：升級了幾筆、封存了幾筆、哪些進了 assets/

**更新 CLAUDE.md 加入特殊指令表**：

| 使用者說 | 總指揮動作 |
|---------|-----------|
| `收割` / `知識收割` | 派 knowledge-harvest agent，執行 sessions/ → assets/ 升級 |
| `結案` / `專案完成` | 知識收割 → 更新三份系統文件 → commit |
| `sprint 完成` | 相關 agent 寫 draft sessions/，不碰 assets/ |
| `做無障礙審查` | 派 accessibility-reviewer |
| `效能審查` | 派 performance-engineer |
| `資安審查` | 派 security-reviewer |
| `法務審查` | 派 legal + risk-manager |

---

### Task 4 — 建立素材庫雙軌結構
**優先級：P0** | 狀態：`[x] 已完成`

**來源**：taste-skill + ui-ux-pro-max 的 references/ 目錄

**建立 Phase 1 外部引入素材（唯讀）**：
```
references/
├── typography/        ← 字型配對表、推薦字重
├── color-palettes/    ← 色票、WCAG 對比度表
├── visual-styles/     ← 22 種視覺風格方向
├── brand-templates/   ← 品牌規範模板
├── banner-sizes/      ← 社群/廣告尺寸清單
└── animation/         ← 緩動曲線、時間規格
```

**建立自有資產目錄（可寫，symlink → 本 repo）**：
```
assets/
├── typography/        ← 實戰驗證的字型配對
├── color-palettes/
├── visual-styles/
├── brand-templates/
├── banner-sizes/
└── animation/
```

**agent 寫入 assets/ 的四關卡判斷標準**：
1. 實際被採用（不是備選方案）
2. 經過驗證（使用者確認或 QA 通過）
3. 夠通用（去掉品牌後其他同類專案也能用）
4. 夠具體（直接可用的規格值，非原則描述）

四關卡全部「是」才寫入，否則寫 team-knowledge/sessions/ 留記錄即可。

**install.sh 需新增**：symlink `assets/` 到 `~/.claude/assets/`

---

### Task 5 — 對所有 32 個 agent 套用反懶惰框架 + 決策樹格式
**優先級：P0** | 狀態：`[x] 已完成`

**來源**：taste-skill research/laziness

**每個 agent 文件需改為**：
```xml
<職責>明確說明這個角色做什麼決策、不做什麼</職責>
<禁止>明確禁止清單</禁止>
<工作步驟>「一步一步來」的步驟序列</工作步驟>
<完工前驗證>自我檢查清單，不完整 = 任務失敗</完工前驗證>
```

**開頭加強制性語言**：
> 不完整的輸出等於任務失敗。這對整個團隊的交付品質至關重要。在完成每個步驟之前，請逐步確認所有驗收條件均已達成。

**適用範圍**：32 個 agent（19 原有 + 13 新增）

---

### Task 6 — 建立 13 個新 Agent + 優化 3 個既有 Agent
**優先級：P0** | 狀態：`[x] 已完成`

**新增 13 個**：

| Agent 名稱 | 核心職責摘要 |
|-----------|------------|
| `brand-designer` | 品牌識別系統、logo 設計、品牌規範書（color / typography / voice） |
| `motion-designer` | 動畫腳本、micro-interaction 規格、轉場編排（搭配 references/animation/） |
| `accessibility-reviewer` | WCAG AA/AAA 審查、螢幕閱讀器測試、焦點流程、色盲測試 |
| `performance-engineer` | Core Web Vitals 分析、LCP/CLS/INP 優化、bundle 分析、圖片優化 |
| `interaction-designer` | 互動流程設計（非視覺）、手勢設計、狀態轉換邏輯、觸發條件 |
| `content-strategist` | 資訊架構策略、內容層次規劃、SEO 語意結構、CTA 層級設計 |
| `social-media-manager` | FB/IG/Threads 每週貼文、發文行事曆、平台語氣差異、3 版本改寫 |
| `seo-specialist` | 關鍵字機會圖、競品文章拆解、SEO 友善大綱、meta 標題 |
| `performance-marketer` | Meta/Google 廣告投放、每日數據決策、受眾分配、素材 hook 文案 |
| `viral-optimizer` | 貼文病毒分數 0–100、殺觸及句子診斷、改寫優化版本 |
| `business-analyst` | BRD、業務流程 gap 分析、ROI / 成本效益試算、利害關係人分析 |
| `business-model-designer` | BMC、收費模式設計、定價策略、價值主張、變現路徑規劃 |
| `business-developer` | 夥伴開發、B2B 銷售漏斗、合作提案撰寫、Pitch deck、通路評估 |

**優化 3 個既有 agent**：

| Agent | 調整內容 |
|-------|---------|
| `marketing` | 剝掉社群小編職責，專注成長策略 + 通路規劃 + 行銷活動 |
| `copywriter` | 加入 Landing Page、Sales Page 轉換型文案結構 |
| `data-analyst` | 明確邊界：只看產品數據，廣告數據交 `performance-marketer` |

---

### Task 7 — 強化 `feature-workflow` skill
**優先級：P1** | 狀態：`[x] 已完成`

**新增內容**：
- 並發優先：「1 次派工 = 所有相關 agent 同時啟動，不序列等待」
- 模型分層：
  - Haiku：摘要、格式轉換、低複雜度查詢
  - Sonnet：標準開發、文件、程式碼審查
  - Opus：架構決策、跨系統設計、高風險判斷
- SPARC 5 階段品質門閘（Specification → Pseudocode → Architecture → Refinement → Completion）
- 開工讀 team-knowledge、完工寫 team-knowledge
- 角色路由表更新（加入全部 13 個新 agent）
- 行銷任務路由更新（social-media-manager / seo-specialist / performance-marketer / viral-optimizer 分工）

---

### Task 8 — 強化設計層 Agent（4 個）
**優先級：P1** | 狀態：`[x] 已完成（含於 Task 5+6）`

#### 8a — `ui-designer`
- 全元件狀態強制：default / hover / active / disabled / loading / empty / error
- 禁止字體清單、佈局原則、動畫原則（來自 design-system + ui-ux-pro-max）
- 連結 references/typography/ 和 references/color-palettes/

#### 8b — `ux-designer`
- Touch 目標：44×44px min，間距 8px
- 必須設計空狀態、載入狀態、錯誤狀態
- 響應式測試：375 / 768 / 1024 / 1440px
- 連結 references/visual-styles/

#### 8c — `art-designer`
- 22 種視覺風格方向（來自 references/visual-styles/）
- 色彩紀律：主色 60–70%、次色 20–30%、強調色 5–10%
- 連結 references/color-palettes/ 和 references/brand-templates/

#### 8d — `fullstack-engineer`
- 圖片：WebP/AVIF、srcset、lazy loading
- `min-height: 100dvh` 取代 `height: 100vh`
- 動畫：只用 transform/opacity，絕不動 width/height
- 50+ 項目清單需虛擬化

---

### Task 9 — 強化 `coding-conventions` skill
**優先級：P2** | 狀態：`[x] 已完成`

**新增段落 `## UI 反爛清單`**：
- 禁止字體、AI 陳詞
- 動畫只用 transform / opacity
- 永不 `#000000`，永不 `height: 100vh`
- Grid 優先於 Flex 做響應式
- z-index 只用於 navbar / modal / overlay

---

## 執行順序

```
P0（依序）：
  Task 1（修訂 design-system）
  → Task 2（output-quality skill）
  → Task 3 + 3b（team-knowledge 系統 + knowledge-harvest skill）
  → Task 4（素材庫雙軌結構）
  → Task 5（32 個 agent 反懶惰框架 + 決策樹格式）
  → Task 6（建立 13 個新 agent + 優化 3 個既有 agent）

P1（Task 6 完成後並行）：
  Task 7（feature-workflow）
  ∥ Task 8a（ui-designer）
  ∥ Task 8b（ux-designer）
  ∥ Task 8c（art-designer）
  ∥ Task 8d（fullstack-engineer）

P2（最後）：
  Task 9（coding-conventions）
```

---

## 最終規模

| 類別 | 數量 |
|------|------|
| Agent | 32 個（19 原有 + 13 新增） |
| 既有 agent 調整 | 3 個（marketing 精簡、copywriter 強化、data-analyst 邊界明確） |
| Skill | 9 個（6 原有 + 3 新增：output-quality、knowledge-capture、knowledge-harvest） |
| References 素材庫 | 6 個分類目錄（Phase 1 引入，唯讀） |
| Assets 素材庫 | 6 個分類目錄（自有打磨，可寫） |
| 知識共享系統 | team-knowledge（symlink 方案） |
| 新增腳本 | scripts/update-index.sh |
| install.sh 更新 | symlink + scripts + Hook 合併 |
