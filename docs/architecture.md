# 共通包架構說明

> 說明共通包的設計原則、目錄結構、各專案如何使用、以及安全邊界。

---

## 一、設計原則

**共通包是基礎設施，各專案只能引用，不能修改。**

唯一例外：`team-knowledge/sessions/` — 各專案可以新增知識記錄，但不能覆寫或刪除任何現有內容。

---

## 二、目錄結構

```
~/.claude/                              ← 共通包安裝位置
├── CLAUDE.md                           ← 全域工作準則（AI 敏捷團隊規則）
├── agents/                             ← 25 個 agent 定義
│   ├── architect.md
│   ├── fullstack-engineer.md
│   ├── ui-designer.md
│   ├── brand-designer.md              ← 新增
│   ├── motion-designer.md             ← 新增
│   ├── accessibility-reviewer.md      ← 新增
│   ├── performance-engineer.md        ← 新增
│   ├── interaction-designer.md        ← 新增
│   ├── content-strategist.md          ← 新增
│   └── ... （共 25 個）
├── skills/                             ← 9 個 skill 定義
│   ├── design-system/SKILL.md         ← 原則層，無框架綁定
│   ├── output-quality/SKILL.md        ← 新增：反懶惰 + 完整交付
│   ├── knowledge-capture/SKILL.md     ← 新增：寫入 team-knowledge 的格式規範
│   ├── feature-workflow/SKILL.md
│   ├── coding-conventions/SKILL.md
│   ├── commit-and-docs/SKILL.md
│   ├── test-standards/SKILL.md
│   ├── security-baseline/SKILL.md
│   └── release-checklist/SKILL.md
├── references/                         ← Phase 1 素材庫（唯讀）
│   ├── typography/                     ← 字型配對表、推薦字重
│   ├── color-palettes/                 ← 色票、WCAG 對比度表
│   ├── visual-styles/                  ← 22 種視覺風格方向
│   ├── brand-templates/                ← 品牌規範模板
│   ├── banner-sizes/                   ← 社群/廣告尺寸清單
│   └── animation/                      ← 緩動曲線、時間規格
├── scripts/
│   └── update-index.sh                 ← PostToolUse Hook 觸發，更新知識庫索引
└── team-knowledge/                     ← symlink → 共通包 repo 的 team-knowledge/
      ├── index.md                      ← 知識庫目錄（自動維護）
      └── sessions/                     ← 各專案知識記錄（只增不改）
            ├── 2026-06-08_project-foo_architect.md
            └── 2026-06-10_project-bar_ui-designer.md
```

---

## 三、各專案如何使用共通包

### 讀取（允許）
各專案的 agent 直接讀取 `~/.claude/` 內的所有內容：agents、skills、references。

### 覆寫 design-system（允許，隔離在專案內）
各專案在自己的 repo 建立覆寫版：
```
<專案>/.claude/skills/design-system/SKILL.md
```
Claude Code 自動以專案版本優先，完全取代基底版。
共通包的 `design-system/SKILL.md` 不受影響。

### 新增 team-knowledge（允許，僅限新增）
Agent 完成任務後，在以下路徑新增一個新檔案：
```
~/.claude/team-knowledge/sessions/YYYY-MM-DD_<project>_<agent>.md
```
因為是 symlink，實際寫入的是共通包 repo，git commit/push 後跨機器共享。

### 不允許的操作
- 修改 `~/.claude/agents/` 內的任何 agent
- 修改 `~/.claude/skills/` 內的任何 skill（design-system 只能在專案內覆寫）
- 修改 `~/.claude/references/` 內的任何素材
- 覆寫或刪除 `team-knowledge/sessions/` 內的現有記錄

---

## 四、安全邊界分析

| 目錄 | 各專案可以做什麼 | 風險 |
|------|----------------|------|
| `agents/` | 唯讀 | 無 |
| `skills/` | 唯讀（design-system 可在專案內獨立覆寫） | 無 |
| `references/` | 唯讀 | 無 |
| `team-knowledge/sessions/` | 只能新增新檔案 | 極低（壞掉的 session 不影響核心功能） |
| `team-knowledge/index.md` | 只有 Hook 腳本自動更新（追加目錄） | 極低（索引損壞不影響 sessions） |

**核心保護**：agents、skills、references 在任何情況下都不會被專案操作修改。`team-knowledge` 採用「只增不改」模式，即使有壞掉的 session 寫入，也不影響任何現有內容或共通包功能。

---

## 五、team-knowledge 跨專案共享機制

```
機器 A（project-foo）
  agent 完工
    → 寫入 ~/.claude/team-knowledge/sessions/2026-06-08_foo_architect.md
    → symlink → 共通包 repo/team-knowledge/sessions/
    → git commit + push

機器 B（project-bar）
  git pull 共通包
    → 取得 project-foo 的 architect 記錄
    → agent 開工時讀取，吸收跨專案經驗
```

---

## 六、install.sh 做了什麼

```bash
# 複製 agents 和 skills 到 ~/.claude/
cp "$DIR"/agents/*.md "$DEST/agents/"
cp -r "$DIR"/skills/* "$DEST/skills/"

# 複製 references 素材庫
cp -r "$DIR"/references "$DEST/references"

# 複製自動化腳本
cp -r "$DIR"/scripts "$DEST/scripts"

# 建立 team-knowledge symlink（核心）
ln -sf "$DIR/team-knowledge" "$DEST/team-knowledge"

# 合併 PostToolUse Hook 到 settings.json
# （讓 Agent 完工後自動觸發 update-index.sh）
```

---

## 七、素材庫雙軌策略

### 目錄設計

```
~/.claude/
├── references/          ← 唯讀，外部引入（taste-skill、ui-ux-pro-max）
│   ├── typography/
│   ├── color-palettes/
│   ├── visual-styles/
│   ├── brand-templates/
│   ├── banner-sizes/
│   └── animation/
└── assets/              ← 可寫，打磨後的自有資產（symlink → 本 repo）
    ├── typography/
    ├── color-palettes/
    ├── visual-styles/
    ├── brand-templates/
    ├── banner-sizes/
    └── animation/
```

**兩者差異**：
- `references/` — 外部最佳實踐，作為起點，agent 唯讀
- `assets/` — 跑過真實專案後打磨出的自有素材，agent 可更新，透過 symlink 跨專案共享
- `sessions/` — 文字記錄、脈絡、決策原因（人類讀）
- `assets/` — 結構化素材本身，直接可被下一個 agent 引用（色值、字型配對、動畫規格）

---

### 知識沉澱的兩個時機

#### 時機 1 — 任務 / Sprint 完工（任何時候）
載入 `knowledge-capture` skill 的 agent，完工後強制寫 sessions/：

```
agent 完成任務
  → knowledge-capture skill 規定：完工必須寫 sessions/
  → 寫入 team-knowledge/sessions/YYYY-MM-DD_<project>_<agent>.md
  → status 固定為 draft
  → 絕不碰 assets/（sprint 中的決策可能被後續推翻）
```

sessions/ 包含所有決策，包括後來被推翻的，都是寶貴的過程記錄。

#### 時機 2 — 你說「收割」或「結案」（只有你能觸發）

```
你：「收割」
  → 總指揮派出 knowledge-harvest agent
  → 掃描本專案所有 status: draft 的 sessions/
  → 逐筆跑四關卡：
      四關全過 → 寫入 assets/，標記 status: final
      未通過   → 標記 status: archived（留記錄，不升級）
  → 完成後回報升級了哪些、封存了哪些
```

**四關卡（knowledge-harvest 執行時逐筆評估）**：

| 關卡 | 問題 | 未通過結果 |
|------|------|-----------|
| 1 — 實際被採用 | 本專案被真實使用（非備選）？ | archived |
| 2 — 經過驗證 | 使用者確認或 QA 視覺通過？ | archived |
| 3 — 夠通用 | 去掉品牌後同類專案也能用？ | archived |
| 4 — 夠具體 | 是具體規格值，非原則描述？ | archived |

**判斷範例**：

| 內容 | 關卡 3 | 關卡 4 | 結論 |
|------|--------|--------|------|
| `#E8845A 主色，客戶喜歡橘色` | ✗ 品牌專屬 | — | archived |
| `Use warm colors for friendly brands` | ✓ | ✗ 太模糊 | archived |
| `Cabinet Grotesk 700 + Outfit 400，dark mode SaaS 辨識度優` | ✓ | ✓ | assets/ |
| `entrance 200ms ease-out，3 個專案驗證` | ✓ | ✓ | assets/ |

**assets/ 寫入格式**（`assets/typography/saas-heading-body.md`）：
```markdown
---
validated_in: project-foo
validated_date: 2026-06-08
project_type: saas-tool
status: final
confidence: high
---
Heading: Cabinet Grotesk 700
Body: Outfit 400
Mono: JetBrains Mono
Line-height body: 1.6
Max line-length: 70ch
備註：Cabinet Grotesk 在深色背景辨識度比 Geist 高，適合 dark mode 優先產品。
```

**project_type 標準分類**（frontmatter 必須用以下之一）：
`saas-tool` / `ecommerce` / `content-site` / `brand-site` / `dashboard` / `mobile-app` / `marketing-site`

**需載入 knowledge-capture 的 agent**（產出素材類）：
ui-designer、ux-designer、art-designer、brand-designer、motion-designer、interaction-designer、content-strategist、fullstack-engineer（限視覺/性能決策）

**不需載入的 agent**（產出非素材類）：
architect、qa-tester、code-reviewer、devops、security-reviewer、legal 等

---

### Phase 1 → Phase 2 路徑

**Phase 1（當前）**：agent 讀 `references/`，完工後符合四關卡則寫入 `assets/`
**Phase 2（3–5 個專案後）**：`assets/` 積累足夠內容，agent 優先讀 `assets/`，`references/` 降為備用
**最終態**：`references/` 靜態存檔，`assets/` 成為主要素材來源

---

## 八、design-system Skill 分層說明

```
共通包（~/.claude/skills/design-system/SKILL.md）
  ↓ 包含：
  • 三旋鈕調控系統
  • 禁用字體清單
  • 色彩禁止模式
  • 佈局原則
  • 動畫原則
  • 無障礙原則
  • Pre-Flight 檢查清單
  ↓ 不包含（刻意移除）：
  • Tailwind class（pt-24、max-w-6xl）
  • 具體 px/rem 數值
  • clamp() 具體值
  • 品牌色實際色碼

專案覆寫（<專案>/.claude/skills/design-system/SKILL.md）
  ↓ 填入：
  • --color-primary: #XXXXXX（11 個 CSS 變數）
  • 實際字型名稱（Geist、Cabinet Grotesk 等）
  • clamp(2.25rem, 5vw, 3.75rem) 等具體值
  • 專案語氣關鍵詞
  • 任何超出基底版的額外規則
```
