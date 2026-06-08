# Brand Identity Template

來源：ui-ux-pro-max（外部引入，Phase 1）

## 使用方式

在各專案建立品牌規範時，以此模板為基礎填入。
複製本檔至 `docs/features/<功能代號>/brand-spec.md`，逐項填寫後交 art-designer 執行。

---

## 品牌基礎

- **品牌名稱**：
- **品牌定位（一句話）**：
- **目標族群**：
- **品牌個性關鍵詞（3-5 個）**：（例：自信、透明、技術精準、親切、前衛）
- **品牌禁用語氣**：（例：不用被動語態、不用行銷術語「賦能/生態系」、不用 em-dash）

---

## 色彩系統

填入 CSS token 名稱與對應 hex 值：

```css
:root {
  --color-primary:                  ;  /* 品牌主色 */
  --color-primary-foreground:       ;  /* 主色上的文字 */
  --color-secondary:                ;  /* 輔色 */
  --color-secondary-foreground:     ;
  --color-accent:                   ;  /* 行動色（CTA） */
  --color-accent-foreground:        ;
  --color-background:               ;  /* 頁面底色 */
  --color-foreground:               ;  /* 主要文字 */
  --color-card:                     ;  /* 卡片背景 */
  --color-card-foreground:          ;
  --color-muted:                    ;  /* 次要區塊底色 */
  --color-muted-foreground:         ;  /* 次要文字（需通過 WCAG AA 4.5:1） */
  --color-border:                   ;  /* 分隔線 */
  --color-input:                    ;  /* 輸入框邊框 */
  --color-ring:                     ;  /* 焦點環（:focus-visible） */
  --color-destructive:              ;  /* 刪除 / 錯誤 */
  --color-destructive-foreground:   ;
}
```

色彩選用禁則（參見 references/color-palettes/wcag-reference.md）：
- 強調色最多 1 個，飽和度 < 80%
- 不用純黑 #000000（改用 Zinc-950 #09090b）
- 不混用暖灰 / 冷灰
- 不用 AI 紫藍霓虹漸層作為預設

---

## 字型系統

參考 references/typography/pairings.md 選擇合適配對，填入後不得中途更換。

- **Display / Heading**：（字族名 + 建議字重，例：Geist 700）
- **Body**：（字族名 + 建議字重，例：Geist 400）
- **Mono**：（字族名，例：JetBrains Mono）

載入方式：
- [ ] Next.js 使用 `next/font`（禁用 `<link>` Google Fonts CDN）
- [ ] 其他框架使用 `@font-face + font-display: swap`

---

## Logo 原則

品牌標誌設計需符合以下標準：

- **符號性**：在 16px favicon 尺寸下仍可辨識（不能只靠文字）
- **可擴展性**：從 16px favicon 到 400px banner 皆可使用
- **單色版本**：必須提供單色（黑 / 白）版本，用於單色印刷或特殊背景
- **安全間距**：Logo 四周留白最小為 Logo 高度的 25%

Logo 設計禁止：
- 通用閃電符號（科技 cliché）
- 隨機動物 logo（除非品牌確實與動物相關）
- 抽象大圓形或不明飛行物
- 超過 2 種色彩的複雜漸層（縮小後消失）

---

## 語氣 Tone of Voice

- **品牌聲音描述**：（例：像一位熟悉技術的朋友，直接講重點，不賣弄）
- **關鍵語氣形容詞**：（例：精確、平易近人、有主見）

範例句型（正確）：
> （填入 2-3 個符合品牌語氣的句子範例）

範例句型（錯誤）：
> （填入 2-3 個不符合品牌語氣的句子，說明為何不對）

文案禁則：
- 禁止 em-dash（— 或 –）作為停頓（改用逗號或重組句子）
- 禁止 AI 常見誇張詞：「賦能」「生態系」「顛覆」「無縫」「智能」（除非確實需要）
- 禁止自我標榜語氣（「我們是業界最好的...」）
- 禁止模糊承諾（「讓您的業務更上一層樓」）
- 數字須有來源，或明確標注為示意（`<!-- mock -->`）

---

## 元件設計規則

### 圓角尺度（選一套，全站鎖定）
- [ ] 全方正：`border-radius: 0`（Brutalist / 企業嚴肅）
- [ ] 適中：`border-radius: 6-8px`（SaaS / 一般）
- [ ] 柔和：`border-radius: 12-16px`（Neumorphism / 健康類）
- [ ] 全圓：`border-radius: 9999px`（CTA 按鈕全圓風格）
- [ ] 混合（需寫明規則）：

### 陰影策略
- 陰影色相應帶入背景色（不用純黑 `rgba(0,0,0,0.x)`，用帶色版本）
- 最多 2 層陰影（`box-shadow: offset1, offset2`）
- `VISUAL_DENSITY > 7` 時無卡片陰影，改用 1px 邊框或 `divide-y`

### 焦點環（:focus-visible）
- 最小 2-3px outline
- 顏色使用 `--color-ring`，確保 3:1 以上對比

---

## 填表完成確認清單

- [ ] 品牌基礎全部填寫
- [ ] 色彩系統 hex 值全部填入
- [ ] 字型已選定並確認授權
- [ ] Logo 規格確認（提供 SVG + PNG 版本）
- [ ] Tone of Voice 範例句子已填寫
- [ ] 元件圓角策略已選定
- [ ] 將本檔案連結至 `docs/features/<功能代號>/ui-spec.md`
