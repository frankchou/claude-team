---
name: feature-workflow
description: AI 敏捷團隊的派工劇本。當需要規劃一個任務該找哪些角色 agent、用什麼順序執行、如何整合時使用。總指揮與多數角色都應參考。
---

# 功能開發工作流程（派工劇本）

總指揮接到任務後，依本劇本判斷「找誰、什麼順序、如何整合」。

---

## 一、角色路由表（32 agent）— 任務類型 → 該派的角色

| 任務類型 | 必派角色 | 視情況加派 |
|---------|---------|-----------|
| 小型 bug 修復 | fullstack-engineer、code-reviewer、qa-tester | architect（若涉及設計） |
| 純後端 / 邏輯變更 | product-manager、architect、fullstack-engineer、code-reviewer、qa-tester | security-reviewer、devops |
| UI / UX 變更 | product-manager、ux-designer、ui-designer、fullstack-engineer、code-reviewer、qa-tester | art-designer、copywriter、interaction-designer、motion-designer |
| 大型新功能 | 上列全部 + project-manager | brand-designer、content-strategist、business-analyst、risk-manager |
| 設計系統 / 品牌 | brand-designer、ui-designer、art-designer | motion-designer、interaction-designer、content-strategist |
| 無障礙合規 | accessibility-reviewer | ui-designer、qa-tester |
| 效能優化 | performance-engineer | fullstack-engineer、architect |
| 部署 / 環境 / 排程 | devops | security-reviewer |
| 文件更新 | tech-writer | — |
| 成長 / 行銷 / 上線 | market-analyst、data-analyst、marketing、product-manager | seo-specialist、copywriter、legal |
| 社群 / 內容行銷 | social-media-manager、viral-optimizer、copywriter | seo-specialist、content-strategist |
| 廣告投放 | performance-marketer、data-analyst | marketing |
| 商業模式 / 定價 | business-model-designer、business-analyst | product-manager、risk-manager |
| 夥伴 / BD | business-developer | business-model-designer、legal |
| 合規 / 隱私 / 版權 | legal、risk-manager、security-reviewer | auditor |

---

## 二、標準執行順序

```
（成長 / 行銷任務）
  市場分析 ∥ 數據分析師 → 行銷策略 → 產品經理
  
（開發任務）
  產品經理（需求、驗收標準）
  → 專案經理（拆任務、排程、相依）
  → 架構師 ∥ 設計層（UX/UI/美術/文案/互動/動畫）  ← 並行
  → 全端工程師（實作）
  → code-reviewer ∥ qa-tester                       ← 並行
  → accessibility-reviewer ∥ performance-engineer   ← 視需求加入
  → tech-writer（更新三份系統文件）
  → devops（部署）

治理/控管層（legal/auditor/risk-manager）：
  碰到合規、版權、重大風險時插入任一階段
```

---

## 三、並行 vs 接力原則（並行優先）

**預設並行**：
- 研究、設計、分析任務 → 同批同時開多個 agent（節省時間）
- 不同功能模組的實作 → git worktree 隔離後並行
- code-reviewer + qa-tester 永遠並行執行

**需接力**：
- 改同一批檔案的實作任務 → 依序執行，或用 git worktree 隔離
- 後續 agent 依賴前一 agent 產出（如 ui-designer 需等 ux-designer 完成 ux-flow.md）

**禁止**：兩個 agent 同時寫同一個檔案。

---

## 四、知識讀取步驟（每個 agent 開工前）

適用素材型 agent（ui-designer、ux-designer、art-designer、brand-designer、motion-designer、interaction-designer、content-strategist）：

1. 先讀 `~/.claude/assets/`（同類目錄，如 `assets/typography/`）—— 有則優先用
2. 若無，讀 `~/.claude/references/`（同類目錄）作為起點
3. 讀 `~/.claude/team-knowledge/sessions/`，找同類型專案 / 同角色的過去記錄

---

## 五、知識寫入步驟（每個 agent 完工後）

載入 `knowledge-capture` skill 的 agent，任務完成後：

1. 寫 `~/.claude/team-knowledge/sessions/YYYY-MM-DD_<project>_<agent>.md`（status: draft）
2. **絕不碰 assets/**（draft 決策可能被推翻）
3. 等使用者說「收割」才由 knowledge-harvest 升級 assets/

---

## 六、團隊規模要依任務縮放

- 小任務只派 3～5 個角色，別 32 個全開（浪費 token 又慢）。
- 治理/控管層平常不出動，只在合規/風險情境登場。
- 行銷執行層（social-media-manager、performance-marketer）只在有實際執行需求時派出。

---

## 七、交付與整合

- 每個角色把產出**寫成檔案**放進 `docs/features/<功能代號>/`，並回報摘要給總指揮。
- 總指揮負責收齊、整合、解決衝突，最後套用 `commit-and-docs` skill 收尾。
- 檔案命名規範：`requirements.md`、`ux-flow.md`、`ui-spec.md`、`marketing-plan.md` 等。

---

## 八、Kickoff 流程（使用者說一句話 → 產出會議記錄）

當使用者只說一句話描述產品 / 功能時，總指揮啟動此流程。
若使用者已說得夠細，跳過 Step 1，直接從 Step 2 開始。

### Step 1 — PM 問題釐清（與使用者互動）

總指揮派 product-manager，針對以下面向逐一確認（不清楚的才問，不要全問）：

| 面向 | 釐清問題範例 |
|------|------------|
| 目標受眾 | 這個功能 / 產品給誰用？有沒有特定場景？ |
| 核心價值 | 解決什麼問題？使用者現在怎麼解決？ |
| 成功指標 | 上線後怎麼判斷成功？有沒有量化目標？ |
| 範疇邊界 | 這次做什麼、不做什麼？有沒有已知排除項？ |
| 技術限制 | 有無指定技術棧、現有系統限制、時程壓力？ |
| 商業脈絡 | 這個功能在整體產品 / 商業模式裡的位置是什麼？ |

PM 問完後，將使用者回答整理成 `docs/features/<功能代號>/requirements.md`。

### Step 2 — 各角色並行提交觀點

總指揮依任務類型，派相關角色各自讀 `requirements.md`，產出自己的觀點文件：

| 角色 | 產出文件 | 內容重點 |
|------|---------|---------|
| architect | `tech-assessment.md` | 技術可行性、架構疑慮、技術債風險 |
| ux-designer | `ux-concerns.md` | 使用者流程疑慮、資訊架構建議 |
| ui-designer | `ui-direction.md` | 視覺方向、元件清單初稿 |
| business-analyst | `business-case.md` | ROI 假設、流程 gap、利害關係人影響 |
| risk-manager | `risk-flags.md` | 技術 / 商業 / 合規風險清單 |

（小型任務只派 architect + ux-designer 即可，不必全開）

### Step 3 — 總指揮整合為會議記錄

讀取所有觀點文件，產出 `docs/features/<功能代號>/kickoff-meeting-notes.md`：

```markdown
# Kickoff 會議記錄 — <功能名稱>
日期：YYYY-MM-DD

## 功能摘要
（一段話說明這個功能是什麼）

## 確認的需求
（來自 requirements.md 的核心規格）

## 各角色觀點摘要
### 架構師
### UX 設計師
### UI 設計師
### 商業分析師（如有）
### 風險管理師（如有）

## 待決議事項
（各角色提出、尚未拍板的問題）

## 下一步行動
（誰、做什麼、產出什麼）
```

### 限制說明

- agent 之間**無法真正即時對話**，「討論」是非同步的——每個 agent 讀前一個的產出文件後回應。
- 若需要跨角色的深度爭論（例如架構師和 PM 對範疇有分歧），由總指揮代為仲裁，或直接問使用者。
