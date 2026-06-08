# 字型配對參考（Phase 1）

> 來源：taste-skill / ui-ux-pro-max-skill。唯讀素材，請勿直接修改。
> 打磨後的專案字型配對請寫入 `assets/typography/`。

---

## 推薦字型配對表

| # | Heading（Display） | Body | Mono | 適合情境 |
|---|-------------------|------|------|---------|
| 1 | Geist / Geist Display | Geist | Geist Mono | Dashboard、開發者工具、B2B SaaS |
| 2 | Satoshi | Satoshi | JetBrains Mono | 現代 SaaS、AI 工具、Landing Page |
| 3 | Cabinet Grotesk | Inter Tight | — | 創意機構、設計工作室 |
| 4 | Outfit | Open Sans | — | Startup、科技品牌 |
| 5 | PP Neue Montreal | PP Neue Montreal | IBM Plex Mono | 進階品牌、設計精品 |
| 6 | Playfair Display | Source Sans Pro | — | 專業雜誌、編輯類（謹慎使用） |
| 7 | Merriweather | Lato | — | 長文閱讀、新聞媒體（謹慎使用） |
| 8 | PP Editorial New | — | — | 奢侈品、高端消費品（serif 有明確理由時才用） |

---

## 各產品類型字型選擇指引

| 產品類型 | 推薦配對 | 說明 |
|---------|---------|------|
| Dashboard / 資料密集 | Geist + Geist Mono 或 Satoshi + JetBrains Mono | 數字必須使用等寬字體；全程 Sans-Serif |
| B2B SaaS Landing | Satoshi 或 Cabinet Grotesk + Inter Tight | 清晰、可信、非通用 |
| 創意機構 / 設計工作室 | Cabinet Grotesk 或 Outfit | 強個性但不花俏 |
| 開發者工具 | Geist + Geist Mono | 技術感、terminal 親和性 |
| 消費品 Landing（高端） | Satoshi 或 PP Neue Montreal | 現代感，避免預設 Inter |
| 編輯 / 媒體（有明確理由） | PP Editorial New 或 Tiempos Headline | 僅在品牌明確要求 Serif 時使用 |
| 公共服務 / 無障礙優先 | Inter（此類型的例外場合） | 最廣泛的可及性支援 |

---

## 字重規格

| 用途 | 字重值 | 說明 |
|-----|--------|------|
| Display / H1 | 700–900 | 標題用粗體驅動層次，而非靠字級大小 |
| H2 / H3 | 600–700 | Semibold 到 Bold |
| H4 / H5 | 600 | Semibold |
| 按鈕 / 標籤 | 600 | Semibold |
| Body / 段落 | 400 | Regular；長文不使用 < 400 |
| 連結 | 500 | Medium |
| Caption / 說明 | 400 | Regular |

### 字重配對原則
- 標題：600–700（中小品牌）或 700–900（高對比設計）
- Body：固定 400，禁止在小字級使用 thin weight（< 400）
- 高密度數字（儀表板、計數器、時間戳）：強制使用 Monospace

---

## 行距與字距規格

| 內容類型 | 行距（line-height） | 字距（letter-spacing） |
|---------|--------------------|-----------------------|
| Display / 大標 | 1.0–1.1 | -0.02em（略緊） |
| H1–H2 | 1.2–1.25 | 0（normal） |
| H3–H4 | 1.3–1.35 | 0（normal） |
| Body 正文 | 1.5–1.6 | 0（normal） |
| 長文閱讀 | 1.6–1.75 | 0（normal） |
| 小字 / Caption | 1.4–1.5 | 0（normal） |
| 全大寫標籤 | 1.4 | 0.05em（較寬） |

### 最大行寬
- Body 正文：65–75 字元（使用 `max-w-[65ch]`）
- Code block：80–100 字元

---

## 字型尺度（Type Scale）

基準尺寸：16px（1rem）；比例：1.25（Major Third）

| 元素 | rem | px | 備註 |
|-----|-----|----|------|
| Display | 3.815rem | 61px | 只用於 Hero 超大標 |
| H1 | 3.052rem | 49px | 頁面主標題 |
| H2 | 2.441rem | 39px | 區塊標題 |
| H3 | 1.953rem | 31px | 小節標題 |
| H4 | 1.563rem | 25px | |
| H5 | 1.25rem | 20px | |
| Body Large | 1.125rem | 18px | |
| Body | 1rem | 16px | 最小 body 尺寸 |
| Small | 0.875rem | 14px | 最小 UI 字級 |
| Caption | 0.75rem | 12px | 僅用於次要說明，不用於長文 |

### 響應式調整
```css
/* Mobile (< 768px) */
h1 { font-size: clamp(1.875rem, 6vw, 3rem); }
h2 { font-size: clamp(1.5rem, 4vw, 2.25rem); }
body { font-size: 1rem; }  /* 不得低於 16px，避免 iOS 自動縮放 */
```

---

## 禁用字體清單及原因

| 字體 | 禁用場景 | 原因 |
|-----|---------|------|
| **Inter** | 高端 / 創意情境的預設字體 | 過於通用，是 LLM 預設選項，辨識度低；可及性優先（公共服務）時例外 |
| **Times New Roman** | 所有數位產品 | 系統預設 Serif，無品牌個性 |
| **Georgia** | 所有數位產品 | 同上，老舊感 |
| **Garamond** | 所有數位產品 | 通用 Serif，缺乏現代感 |
| **Palatino** | 所有數位產品 | 同上 |
| **Fraunces** | 預設 Display Serif | LLM 最愛用的兩款 Serif 之一，已成 AI tell |
| **Instrument Serif** | 預設 Display Serif | LLM 最愛用的兩款 Serif 之一，已成 AI tell |
| **任何 Serif** | Dashboard、軟體 UI | Dashboard 全程禁止 Serif；只有在品牌明確要求且能說明理由時才用於行銷頁 |

### 避免的設計模式
- 在 Sans 標題中混入單一 Serif 詞來「增加視覺趣味」（應用同字族的 italic/bold）
- 同一專案在暖灰和冷灰字色間切換
- Italic 字型在大字級且有 descender 字母（y g j p q）時使用 `leading-none`（會裁切 descender，需加 `pb-1`）

---

## 字型載入規範

- Next.js 專案：使用 `next/font`
- 非 Next.js：自托管 `@font-face` + `font-display: swap`
- 禁止在生產環境用 `<link>` 引入 Google Fonts（效能影響）
- 只 preload 關鍵字型，避免對每個 variant 都 preload
