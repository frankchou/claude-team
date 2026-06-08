# Color Reference

來源：ui-ux-pro-max（外部引入，Phase 1）

## WCAG 對比度要求

| 等級 | 正常文字 | 大文字（18px+ 或粗體 14px+） | UI 元件 / 圖形 |
|------|---------|----------------------------|--------------|
| AA（最低） | 4.5:1 | 3:1 | 3:1 |
| AAA（建議） | 7:1 | 4.5:1 | 4.5:1 |

> 實務建議：Body text 目標 AAA（7:1），Hero 大標題至少 AA（4.5:1），按鈕/圖示至少 AA（3:1）。

---

## 色彩禁止模式

以下模式在任何專案中均須避免（除非 Brief 明確要求且有充分理由）：

- **純黑 #000000**：改用 #111111 或 Zinc-950（#09090b），保留空間感。
- **AI 紫藍霓虹漸層**：紫色按鈕輝光（glow）、霓虹漸變背景、random neon gradient——這是 LLM 預設輸出的標誌。
- **飽和度超過 80% 的強調色**：單一強調色飽和度應控制在 < 80%，避免視覺疲勞。
- **在同一專案混用暖灰 / 冷灰系統**：選定後鎖定，不可在同一頁面跨系統混用。
- **多於 1 個強調色**：強調色最多 1 個；第二個行動色需與主色明確區分用途。
- **Premium-consumer 的 #F5F1EA 奶油米 + 銅黃漸層組合**：這是 AI 最常見的「精品」預設，實際上讓所有精品品牌看起來一模一樣。

---

## 推薦中性色階（Dark Mode 友善）

### Zinc 系（冷灰，最常用）

| 用途 | Token | Hex |
|------|-------|-----|
| 最深文字 / 暗黑背景 | Zinc-950 | #09090b |
| 深色背景 | Zinc-900 | #18181b |
| 卡片背景（Dark） | Zinc-800 | #27272a |
| 邊框（Dark） | Zinc-700 | #3f3f46 |
| Muted 文字 | Zinc-400 | #a1a1aa |
| 淺色背景 | Zinc-50 | #fafafa |

### Slate 系（帶藍冷灰，適合 SaaS / 技術工具）

| 用途 | Token | Hex |
|------|-------|-----|
| 最深文字 | Slate-950 | #020617 |
| 深色背景 | Slate-900 | #0f172a |
| 邊框（Dark） | Slate-700 | #334155 |
| Muted 文字 | Slate-400 | #94a3b8 |

### Stone 系（帶暖灰，適合 editorial / lifestyle）

| 用途 | Token | Hex |
|------|-------|-----|
| 最深文字 | Stone-950 | #0c0a09 |
| 深色背景 | Stone-900 | #1c1917 |
| Muted 文字 | Stone-400 | #a8a29e |

---

## 各產品類型推薦色盤（節錄自 ui-ux-pro-max colors.csv）

| 產品類型 | Primary | Accent | Background | 說明 |
|---------|---------|--------|-----------|------|
| SaaS（一般） | #2563EB | #EA580C | #F8FAFC | 信任藍 + 橙色 CTA |
| Micro SaaS | #6366F1 | #059669 | #F5F3FF | 靛紫 + 翠綠 CTA |
| E-commerce | #059669 | #EA580C | #ECFDF5 | 成功綠 + 橙色緊迫感 |
| E-commerce 精品 | #1C1917 | #A16207 | #FAFAF9 | 深黑 + 金色 |
| B2B 服務 | #0F172A | #0369A1 | #F8FAFC | 專業深藍 |
| 金融儀表板 | #0F172A | #22C55E | #020617 | 深色背景 + 綠色正向指標 |
| 醫療健康 | #0891B2 | #059669 | #ECFEFF | 沉靜青 + 健康綠 |
| 創意代理商 | #EC4899 | #0891B2 | #FDF2F8 | 粉紅 + 青色 |
| 個人作品集 | #18181B | #2563EB | #FAFAFA | 單色 + 藍色強調 |
| 遊戲 | #7C3AED | #F43F5E | #0F0F23 | 霓虹紫 + 玫瑰行動色 |
| Fintech / Crypto | #F59E0B | #8B5CF6 | #0F172A | 金色信任 + 紫色科技 |
| 開發工具 | #1E293B | #22C55E | #0F172A | 程式碼深色 + 執行綠 |

> 完整 161 種產品類型色盤請參考來源：`/tmp/ui-ux-pro-max-skill/src/ui-ux-pro-max/data/colors.csv`

---

## CSS Token 建議結構

```css
:root {
  /* 品牌色 */
  --color-primary:          ;  /* 品牌主色 */
  --color-primary-foreground: ;  /* 主色上的文字 */
  --color-secondary:        ;  /* 輔色 */
  --color-accent:           ;  /* 行動色 */

  /* 版面底色 */
  --color-background:       ;
  --color-foreground:       ;  /* 主要文字 */

  /* 元件 */
  --color-card:             ;  /* 卡片背景 */
  --color-card-foreground:  ;
  --color-muted:            ;  /* 次要文字底色 */
  --color-muted-foreground: ;
  --color-border:           ;  /* 分隔線 */
  --color-input:            ;  /* 輸入框邊框 */

  /* 狀態 */
  --color-destructive:      ;  /* 刪除 / 錯誤 */
  --color-destructive-foreground: ;
  --color-ring:             ;  /* 焦點環 */
}
```

---

## 實作檢查清單

- [ ] 所有 Body 文字對比度通過 WCAG AAA（7:1）驗證
- [ ] 所有 UI 元件（按鈕、圖示）對比度通過 WCAG AA（3:1）
- [ ] 同一頁面只用一套中性灰系統（暖或冷，不混用）
- [ ] 強調色最多 1 個，飽和度 < 80%
- [ ] 無純黑 #000000 或純白 #FFFFFF 作為背景或文字主色
- [ ] Dark Mode 下對比度重新驗證
- [ ] 無 AI 紫藍霓虹漸層
