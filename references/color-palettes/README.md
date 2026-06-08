# 色彩系統參考（Phase 1）

> 來源：taste-skill / ui-ux-pro-max-skill / brand skill。唯讀素材，請勿直接修改。
> 打磨後的專案色彩方案請寫入 `assets/color-palettes/`。

---

## 11 變數色彩系統說明

標準品牌色彩系統使用 11 個語義化 CSS 變數，分為四個層級：

```css
:root {
  /* ── 主色（1–2 個）──────────────────── */
  --color-primary:       #XXXXXX;   /* 主品牌色：CTA、連結、焦點環 */
  --color-primary-light: #XXXXXX;   /* 淡版主色：hover 狀態、背景 tint */
  --color-primary-dark:  #XXXXXX;   /* 深版主色：active 狀態、加重強調 */

  /* ── 次色（1 個強調色）────────────────── */
  --color-accent:        #XXXXXX;   /* 唯一強調色，飽和度 < 80% */

  /* ── 語義色（固定 4 個）────────────────── */
  --color-success:       #22C55E;   /* 成功 / 完成 */
  --color-warning:       #F59E0B;   /* 警告 / 注意 */
  --color-error:         #EF4444;   /* 錯誤 / 危險 */
  --color-info:          #3B82F6;   /* 資訊 / 說明 */

  /* ── 中性色（4–5 個）──────────────────── */
  --color-background:    #FFFFFF;   /* 頁面主背景 */
  --color-surface:       #F9FAFB;   /* 卡片 / 容器背景 */
  --color-text-primary:  #111827;   /* 主要文字（禁用純黑 #000） */
  --color-text-secondary:#6B7280;   /* 次要文字、描述、metadata */
  --color-border:        #E5E7EB;   /* 分隔線、邊框 */
}
```

### 系統架構圖
```
主色 (1–2)
├── 主品牌色 — CTA、Header、關鍵元素
└── 次主色 — 次要強調（可選）

強調色 (1)
└── 互動狀態、特殊高亮（最多 1 個）

語義色 (4)
├── Success #22C55E
├── Warning #F59E0B
├── Error   #EF4444
└── Info    #3B82F6

中性色 (4–5)
├── Background — 頁面底色
├── Surface    — 卡片、模態框背景
├── Text-Primary — 主文字
├── Text-Secondary — 說明文字
└── Border     — 線條 / 分隔
```

---

## 各產品類型色彩方案範例

### Tech / SaaS
```
Primary:    #2563EB（Blue-600）
Accent:     #10B981（Emerald）  ← 唯一強調色
Background: #F9FAFB
Surface:    #FFFFFF
Text:       #111827
```

### Marketing / 創意
```
Primary:    #F97316（Orange）
Accent:     #14B8A6（Teal）
Background: #FFFFFF
Text:       #1F2937
```

### Professional / Corporate
```
Primary:    #1E40AF（Navy）
Secondary:  #475569（Slate）
Accent:     #0EA5E9（Sky）
Background: #F8FAFC
Text:       #0F172A
```

### 開發者工具 / Dark Mode
```
Primary:    #22D3EE（Cyan）
Background: #09090B（Zinc-950）
Surface:    #18181B（Zinc-900）
Text:       #F4F4F5（Zinc-100）
Border:     rgba(63,63,70,0.5)
```

---

## 色彩禁止模式

### 絕對禁止
| 禁止項目 | 原因 |
|---------|------|
| 純黑 `#000000` | 視覺刺激過高；用 Off-Black（`#09090B`, `#18181B`）或 Zinc-950 取代 |
| AI 紫藍霓虹（`#7C3AED` 等大面積紫色 glow） | LLM 預設審美，已是 AI tell；品牌明確要求紫色才可用 |
| 過飽和強調色（Saturation > 80%） | 視覺噪音，降低品牌辨識度 |
| 暖灰 / 冷灰混用 | 同一專案只選一套灰階（Zinc/Slate 或 Stone/Warm），不切換 |
| 超過 1 個強調色 | 多個強調色破壞視覺層次 |

### 高端消費品禁用色（Premium-Consumer Ban）
以下為 LLM 在高端消費品設計中的預設色組，禁止作為第一選擇：

**禁用背景色（暖奶油 / 骨白）：**
- `#f5f1ea` `#f7f5f1` `#fbf8f1` `#efeae0` `#ece6db` `#faf7f1` `#e8dfcb`

**禁用強調色（黃銅 / 陶土 / 深紅）：**
- `#b08947` `#b6553a` `#9a2436` `#9c6e2a` `#bc7c3a` `#7d5621`

**禁用文字色（咖啡暖黑）：**
- `#1a1714` `#1a1814` `#1b1814`

**替代方向（輪換使用）：**
- Cold Luxury：Silver-grey + Chrome + Smoke
- Forest：深綠 + Bone + Amber 強調
- Dark editorial：Charcoal + Cream + 單一飽和強調色
- Powder：薰衣草 + Stone + Copper

---

## WCAG 對比度要求

### 最低標準（依 WCAG 2.1）

| 等級 | 一般文字 | 大文字（18px+ / 14px Bold+） | UI 元件 / 圖示 |
|-----|---------|---------------------------|--------------|
| **AA**（最低要求） | 4.5:1 | 3:1 | 3:1 |
| **AAA**（建議目標） | 7:1 | 4.5:1 | 4.5:1 |

### 常見配對檢查
- `#111827`（Gray-900）on `#FFFFFF`：約 16.7:1 ✓ AAA
- `#6B7280`（Gray-500）on `#FFFFFF`：約 4.6:1 ✓ AA
- `#9CA3AF`（Gray-400）on `#FFFFFF`：約 2.5:1 ✗（禁止用於正文）

### 驗證原則
- 顏色不是唯一的語義傳遞媒介（配合 icon / 文字）
- Light / Dark 兩個模式都要分別驗證
- 互動狀態（hover / active / disabled / focus）也需符合對比度

---

## 色彩比例規則（60-20-10 法則）

| 層級 | 比例 | 用途 |
|-----|------|------|
| 主色 | 60–70% | 背景、主要 Surface |
| 次色 | 20–30% | 文字、次要元素、分隔線 |
| 強調色 | 5–10% | CTA、互動狀態、焦點環 |
| 非品牌色容忍度 | 最大 20% | 語義色（success / error 等） |

### 驗證標準
- Primary color 使用率 < 60% → 主色太少，需加強
- Accent color 使用率 > 10% → 強調色過濫，降低視覺層次
- 同一 Surface 上使用超過 2–3 個顏色 → 警告

---

## 色彩一致性鎖定原則

一旦頁面確定強調色，**整頁鎖定**：
- 暖灰設計不能在第 7 個 section 突然出現藍色 CTA
- 玫瑰強調色的網站不能在 Footer 出現青色 badge
- Dark Mode 用去飽和 / 較亮的色調變體，而非直接反轉顏色

---

## Tailwind 灰階選擇原則

選定一種灰階系列，整個專案統一使用：

| 系列 | 基調 | 適合 |
|-----|------|------|
| `zinc` | 中性偏冷 | 開發者工具、Dark SaaS |
| `slate` | 微藍冷灰 | B2B、資料密集應用 |
| `stone` | 微暖中性 | 品牌、消費品 |
| `gray` | 純中性 | 通用、系統 UI |
| `neutral` | 最純中性 | 無色彩傾向需求 |
