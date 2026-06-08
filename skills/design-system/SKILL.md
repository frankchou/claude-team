---
name: design-system
description: 設計系統基底規範。UI 設計師、UX 設計師、美術設計師、全端工程師、文案、行銷載入此 skill 以確保輸出符合設計品質底線。各專案應在自己的 repo 覆寫以加入專屬品牌色、字型、語氣。
---

# 設計系統基底規範

> **這是全域共通包的基底版本，包含與專案無關的設計品質底線。**
>
> **具體 CSS 數值（色碼、字型名稱、clamp() 數值）、Tailwind class（如 pt-24、max-w-6xl）、品牌色值請在專案覆寫版填入，不寫在這份基底版。**
>
> **專案覆寫方式：** 在你的專案 repo 建立 `.claude/skills/design-system/SKILL.md`，
> 填入品牌色、字型選擇、語氣等專案專屬內容。
> Claude Code 會自動以專案版本優先，完全取代此基底版。
>
> **絕對不要修改 `~/.claude/` 內的這個共通包。**

---

## 一、三旋鈕調控（每個設計任務開始前設定）

在開始設計之前，根據任務類型設定三個旋鈕：

| 旋鈕 | 範圍 | 低端（1–3） | 中間（4–7） | 高端（8–10） |
|------|------|------------|------------|-------------|
| **Design Variance** | 1–10 | 對稱、可預測的佈局 | 有個性但平衡 | 非對稱、藝術性、強烈不對稱 |
| **Motion Intensity** | 1–10 | 靜態，只有 hover | 流體 CSS 過渡 | 電影級 GSAP 編排 |
| **Visual Density** | 1–10 | 寬鬆、大量留白 | 平衡的資訊密度 | 儀表板式高密度 |

**預設值（若無明確指示）**：Variance 7 / Motion 5 / Density 4

---

## 二、字體系統

### 全域禁止字體（任何情況下不得使用）
- `Inter`（作為預設，泛濫過度）
- `Roboto`
- `Arial`
- `Open Sans`
- `Helvetica`（無明確品牌需求時）
- 通用 serif：`Times New Roman`、`Georgia`、`Garamond`、`Palatino`
- 任何瀏覽器預設 serif 堆疊

### 推薦替代字體（依產品類型）
| 產品類型 | Display / Heading | Body | Mono |
|---------|------------------|------|------|
| SaaS / 開發工具 | Geist、Satoshi | Geist、Outfit | Geist Mono、JetBrains Mono |
| 高端 / 精品 | Cabinet Grotesk、Playfair Display | Cabinet Grotesk | IBM Plex Mono |
| 編輯 / 文件 | Outfit、Plus Jakarta Sans | Plus Jakarta Sans | JetBrains Mono |
| 若需 Serif | Fraunces、Instrument Serif（限品牌明確指定） | — | — |

### 字體規格原則
- Display：字大、字距緊（負值）、行高短；強調視覺衝擊，適合英雄與大標題場景。具體字級與 clamp() 數值在專案覆寫版填入。
- Heading H1–H3：字重偏重（700–900），行高緊湊（介於 Display 與 Body 之間），適合段落標題。
- Body：字重正常（400），行高寬鬆以利閱讀，單行長度控制在 65–75 字符之間避免過長掃描疲勞。
- Mono：用於數字資料、時間戳、程式碼。視覺密度高的版面（Density > 7）時，所有數字強制使用 Mono 字體以對齊。
- 上述任何具體字級數值（px、rem、clamp()）在專案覆寫版填入，基底版不設定。

---

## 三、色彩系統

### 11-變數模板（各專案填入實際色值）
```css
--color-primary:             /* 品牌主色，CTA、關鍵元素 */
--color-primary-foreground:  /* 主色上的文字（高對比） */
--color-secondary:           /* 輔色，次要強調 */
--color-accent:              /* 行動色，按鈕、連結 */
--color-background:          /* 頁面底色 */
--color-foreground:          /* 主要文字色 */
--color-card:                /* 卡片 / 容器背景 */
--color-muted:               /* 次要文字、說明文字 */
--color-border:              /* 分隔線、框線 */
--color-destructive:         /* 刪除 / 錯誤 */
--color-ring:                /* 焦點環 */
```

### 色彩禁止模式
- 純黑 `#000000`（改用近黑色，具體色碼在專案覆寫版填入）
- 「AI 紫藍霓虹漸層」美學（紫色按鈕輝光、霓虹漸變）
- 飽和度超過 80% 的強調色
- 在同一專案混用暖灰 / 冷灰系統
- 多於 1 個強調色（保持克制）

### 對比度要求（WCAG）
| 等級 | 正常文字 | 大文字（18px+） | UI 元件 |
|------|---------|----------------|--------|
| AA（最低）| 4.5:1 | 3:1 | 3:1 |
| AAA（建議）| 7:1 | 4.5:1 | 4.5:1 |

---

## 四、佈局硬規則（不可違反）

### 英雄區塊
- 標題：**≤ 2 行**（最多 3 行）
- 副文本：**≤ 20 字**
- 頂部填充：適度留白，讓英雄區塊有呼吸空間；具體數值在專案覆寫版填入
- 元素堆疊：最多 4 個文字元素
- CTA：最多 1 個主要 CTA，桌面端不換行
- **禁止**：居中英雄 + 三欄卡片預設佈局（Design Variance > 4 時強制非對稱）

### 導航
- 高度：**≤ 80px**
- 桌面：水平，無漢堡包
- 行動：折疊成乾淨的行動選單

### Section 多樣性
- 8 個 section 中至少 4 種不同佈局
- 禁止連續超過 2 個 Z 字形佈局
- 禁止「3 個相等欄卡片」重複超過一次

### CSS 硬規則
- 用 `min-height: 100dvh`，**不得** 用 `height: 100vh`（iOS Safari 問題）
- 容器設定最大寬度限制並水平居中對齊；具體寬度值（如 max-w-6xl 對應的像素值）在專案覆寫版填入
- Grid 優先於 Flex 做響應式佈局
- 禁止百分比加減法駭客（如 `calc(33% - 1rem)`）
- `z-index` 只用於：導航列、Modal、Overlay 背景

---

## 五、動畫標準

### 時間規則
| 互動類型 | 時長 |
|---------|------|
| 微互動（hover / tap） | 150–200ms |
| 過渡（Modal 開關） | 200–300ms |
| 複雜轉場 | ≤ 400ms |
| **禁止** | > 500ms 無加載指示 |

### 只用這兩個 CSS 屬性做動畫
```css
/* 可以 */
transform: translateX() scale() rotate();
opacity: 0 → 1;

/* 絕對禁止 */
width / height / top / left / margin / padding
```

### 緩動規則
- 進場：`ease-out`
- 退場：`ease-in`（退場比進場快 30–40%）
- **禁止**：UI 過渡用 `linear`
- 推薦：Spring 物理（stiffness 偏低、damping 偏高，具體參數在專案覆寫版填入）

### 必須尊重
```css
@media (prefers-reduced-motion: reduce) {
  /* 禁用或最小化所有動畫 */
}
```

---

## 六、必須設計的元件狀態

每個互動元件都必須定義以下全部狀態，不可只設計 happy path：

- `default` — 預設狀態
- `hover` — 滑鼠懸停
- `active` / `pressed` — 按下中
- `disabled` — 不可用（視覺降低不透明度 + cursor 改變）
- `loading` — 非同步操作中（骨架屏優於轉圈圈）
- `empty` — 無資料（有指引文字 + 行動按鈕）
- `error` — 錯誤（錯誤訊息在欄位旁邊，不只在頂部）

---

## 七、響應式與 Touch 標準

### 測試斷點
- 375px（iPhone SE）
- 390px（iPhone 14）
- 768px（iPad）
- 1024px（小筆電）
- 1440px（桌面）

### Touch 目標
- 最小尺寸：**44×44px**（iOS）/ 48×48dp（Android）
- 目標間距：最小 **8px**
- 行動裝置 body 文字：最小 **16px**（防 iOS 自動縮放）

### 行動裝置強制規則
- 所有多欄佈局折疊成單欄，無例外
- 無水平滾動（關鍵失敗項）
- 按鈕在行動端全寬

---

## 八、反爛設計禁止清單（AI 告訴）

### 文案禁止詞
任何輸出中不得出現以下詞彙：
- `seamless`、`unleash`、`game-changer`、`next-generation`
- `elevate`、`revolutionary`、`world-class`
- `99.99%`、`50%`（假精確數字，改用有機數據如 `47.2%`）
- 通用人名：`John Doe`、`Sarah Chan`、`Acme`、`Nexus`

### em-dash 零容忍
- 任何地方禁止使用 `—` 或 `–`（AI 標記符號）

### UI 禁止模式
- 移除焦點環（a11y 關鍵違規）
- Hover-only 互動（行動裝置無法觸發）
- Placeholder 當 Label 用
- Icon-only 按鈕沒有 label
- 只用顏色傳達資訊（色盲友善）
- 圓形轉圈加載（改用骨架屏）
- 「向下滾動以探索」等填充文字
- 英雄上的任意浮動徽章 / 郵票圖標
- 3 列相等卡片功能佈局
- 過度飽和的漸層背景

---

## 九、Pre-Flight 檢查清單（交付前必過）

在回報完成之前，逐項確認：

- [ ] 三旋鈕值已設定，有理由
- [ ] 零 em-dash
- [ ] 禁止字體無出現
- [ ] 純黑 #000000 無出現
- [ ] 英雄標題 ≤ 2 行
- [ ] 按鈕 / 表單對比達 WCAG AA
- [ ] 所有必要元件狀態已設計
- [ ] 無「3 欄等寬卡片」重複佈局
- [ ] `height: 100vh` 已改為 `min-height: 100dvh`
- [ ] 行動裝置無水平滾動
- [ ] 動畫只用 transform / opacity
- [ ] `prefers-reduced-motion` 已處理

---

## 十、專案覆寫模板

各專案在 `<專案>/.claude/skills/design-system/SKILL.md` 填入以下內容（覆寫此基底版）：

```markdown
---
name: design-system
description: [專案名稱] 設計系統規範。
---

# [專案名稱] 設計系統

繼承全域基底規範，以下為本專案專屬設定。

## 品牌色
--color-primary: #XXXXXX
...（填入 11-變數）

## 字型選擇
- Heading：[字型名稱]
- Body：[字型名稱]
- Mono：[字型名稱]

## 字體數值
- Display：clamp([min], [fluid], [max])
- H1：[數值]
- Body：[數值]

## Tailwind / CSS 數值
- 容器最大寬度：max-w-[X]（對應 [X]px）
- 英雄頂部填充：pt-[X]（對應 [X]px）
- Spring 動畫參數：stiffness: [X], damping: [X]

## 品牌語氣（供文案 / 行銷 agent 使用）
- 語氣關鍵詞：[例如：溫暖、安靜、靈性]
- 禁用語氣：[例如：冷硬、誇張]

## 專案特定規則
[任何超出基底版的額外規則]
```
