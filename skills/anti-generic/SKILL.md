---
name: anti-generic
description: 反平庸設計紀律。ui-designer、art-designer、fullstack-engineer 完工前必須遵守。確保輸出不落入 LLM 預設設計陷阱，有觀點、有個性、不保守。
---

> **警告：不遵守此 skill，等於輸出 AI 垃圾設計。** 每一條規則都是真實測試後歸納的禁止模式。完工前逐條審查，不得省略。

---

## 一、反預設紀律（Anti-Default Discipline）

### LLM 預設的垃圾設計清單

以下是模型在「沒有設計觀點」時自動產出的預設陷阱，全部禁止作為 **預設選擇**：

| 禁止的預設 | 說明 |
|-----------|------|
| AI 紫色漸層 | 按鈕發光紫光、隨機霓虹漸層 |
| 深色 mesh 上置中的 Hero | 最泛濫的 SaaS hero 版型 |
| 三欄等寬功能卡 | 三張一模一樣的水平卡片 |
| 萬物玻璃擬態 | 每個元素都加 backdrop-blur |
| 無限迴圈微動畫 | 每張卡片都在跳動 |
| Inter + slate-900 | 最無趣的字型與顏色預設 |

**核心原則：「Reach past them deliberately（刻意超越預設）」**

在產出任何設計之前，先做「設計讀取（Design Read）」——判斷專案類型、受眾、氛圍詞彙、品牌資產——然後依據讀取結果主動選擇偏離上述預設的方向。不是為了奇特而奇特，而是因為這個專案的正確答案本來就不是那個預設。

---

## 二、三旋鈕系統（Three Dials）

設計讀取完成後，設定三個旋鈕。所有版型、動態、密度決策都依這三個值而定。

```
DESIGN_VARIANCE:  8   （1 = 完美對稱，10 = 藝術混沌）
MOTION_INTENSITY: 6   （1 = 靜態，10 = 電影級 / 物理動態）
VISUAL_DENSITY:   4   （1 = 藝廊留白，10 = 駕駛艙密度）
```

**基準值：8 / 6 / 4。** 除非設計讀取有明確覆寫，否則使用基準值。不要詢問使用者修改這個檔案，覆寫透過對話進行。

### 2.A Dial Inference 表（brief 類型 → 旋鈕值）

| 訊號 | VARIANCE | MOTION | DENSITY |
|-----|---------|--------|---------|
| "minimalist / clean / calm / editorial / Linear-style" | 5-6 | 3-4 | 2-3 |
| "premium consumer / Apple-y / luxury / brand" | 7-8 | 5-7 | 3-4 |
| "playful / wild / Dribbble / Awwwards / experimental / agency" | 9-10 | 8-10 | 3-4 |
| "landing page / portfolio / marketing site（預設）" | 7-9 | 6-8 | 3-5 |
| "trust-first / public-sector / regulated / accessibility-critical" | 3-4 | 2-3 | 4-5 |
| "redesign - preserve（保留品牌）" | 匹配現有 | +1 | 匹配現有 |
| "redesign - overhaul（全面翻新）" | +2 | +2 | 匹配現有 |

### 2.B Use-Case Presets（場景預設值）

| 使用場景 | VARIANCE | MOTION | DENSITY |
|---------|---------|--------|---------|
| Landing（SaaS，主流） | 7 | 6 | 4 |
| Landing（Agency / 創意） | 9 | 8 | 3 |
| Landing（Premium consumer） | 7 | 6 | 3 |
| Portfolio（設計師 / 工作室） | 8 | 7 | 3 |
| Portfolio（開發者） | 6 | 5 | 4 |
| Editorial / Blog | 6 | 4 | 3 |
| 公部門服務 | 3 | 2 | 5 |
| Redesign - preserve | match | match+1 | match |
| Redesign - overhaul | +2 | +2 | match |

### 2.C 旋鈕如何驅動輸出

**DESIGN_VARIANCE**
- 1-3（可預測）：對稱 Grid、等距 padding、置中對齊
- 4-7（偏移）：`margin-top: -2rem` 疊加、混合比例圖片（4:3 旁邊放 16:9）、左對齊標題搭配置中資料
- 8-10（不對稱）：Masonry、`grid-template-columns: 2fr 1fr 1fr`、大面積留白（`padding-left: 20vw`）
- **行動裝置覆寫**：4-10 的不對稱版型在 `< 768px` 必須收合為嚴格單欄（`w-full px-4 py-8`）

**MOTION_INTENSITY**
- 1-3（靜態）：僅 CSS `:hover` / `:active`，`prefers-reduced-motion` 即預設模式
- 4-7（流暢 CSS）：`transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1)`，load-in 用 `animation-delay` 瀑布展開，聚焦 `transform` 與 `opacity`
- 8-10（進階編排）：Scroll-triggered reveals、parallax、GSAP ScrollTrigger。**嚴禁 `window.addEventListener('scroll')`**

**VISUAL_DENSITY**
- 1-3（藝廊）：大量留白，`py-32` 到 `py-48`
- 4-7（日常 App）：標準 web 間距，`py-16` 到 `py-24`
- 8-10（駕駛艙）：緊密 padding，無卡片框，1px 線分隔資料，數字必用 `font-mono`

---

## 三、設計工程指令

### 3.1 Typography（字型）

**字體偏見修正**

- **Display / Headlines 預設：** `text-4xl md:text-6xl tracking-tighter leading-none`
- **Body / Paragraphs 預設：** `text-base text-gray-600 leading-relaxed max-w-[65ch]`
- **無襯線字型選擇：**
  - **禁止作為預設：** `Inter`
  - 優先選擇：`Geist`、`Outfit`、`Cabinet Grotesk`、`Satoshi` 或品牌適合的選項
  - **覆寫允許：** 使用者明確要求 neutral / Linear-style，或公部門 / 無障礙優先網站
- **推薦配對：** `Geist` + `Geist Mono`、`Satoshi` + `JetBrains Mono`、`Cabinet Grotesk` + `Inter Tight`

**Serif 紀律（VERY DISCOURAGED AS DEFAULT）**

「這個 brief 有創意感所以要用 Serif」——這是測試中最常見的 AI Tell，**嚴禁**。

Serif **只有在以下條件之一明確成立時才可使用**：
1. 品牌 brief 直接指名某個 serif 字型，或
2. 美學家族確實是 editorial / luxury / publication / manuscript / heritage / vintage，且能說明為什麼這個特定 serif 適合這個特定品牌

其餘所有情境（創意代理商、設計工作室、現代品牌、premium consumer、portfolio、lifestyle）一律使用 **sans-serif display**：Geist Display、ABC Diatype、Söhne Breit、Cabinet Grotesk Display、Migra Sans、GT Walsheim、Inter Display、PP Neue Montreal。

**嚴格禁止作為預設的 Serif：**
- `Fraunces` — LLM 最愛的 display serif，禁用
- `Instrument_Serif` — 同上，禁用

**如果 serif 確實有正當理由**（極少數情況），從以下池輪換，不可跨專案重複使用同一個：
PP Editorial New、GT Sectra Display、Cardinal Grotesque、Reckless Neue、Tiempos Headline、Recoleta、Cormorant Garamond、Playfair Display、EB Garamond、IvyPresto、Migra、Editorial Old、Saol Display、Söhne Breit Kursiv、Domaine Display、Canela、Schnyder、Tobias、NB Architekt、ITC Galliard

**強調規則：** 在標題中強調某個字詞，使用**同一字型家族的 italic 或 bold**。不要在 sans 標題中插入 serif 單字（或反之）。混合字型家族的強調是業餘做法。

**Italic 降筆間距（mandatory）：** italic 用於 display 文字，且字詞含降筆字母（`y g j p q`）時，`leading-[1]` 或 `leading-none` 會裁切降筆。最低使用 `leading-[1.1]`，並在包覆元素加 `pb-1` 或 `mb-1`。出貨前審查所有 display italic 文字。

---

### 3.2 Color（色彩）

**The Lila Rule（禁止 AI 紫色）**

AI 紫 / 藍發光效果禁止作為預設。不要自動加紫色按鈕發光、隨機霓虹漸層。使用中性底色（Zinc / Slate / Stone）搭配高對比單一強調色（Emerald、Electric Blue、Deep Rose、Burnt Orange 等）。

覆寫允許：如果品牌或 brief 明確要求紫 / 紫羅蘭，接受並執行——但要有意圖：一致的配色板、協調的中性色、節制的漸層。不是泛型 AI 漸層垃圾。

**色彩一致性鎖定（mandatory）**

一旦為頁面選定強調色，整頁使用同一個強調色。暖灰色系的頁面不會在第 7 節突然出現藍色 CTA。玫瑰強調色的頁面不會在 footer 出現青色狀態徽章。選定一個強調色，鎖定，出貨前審查每個元件。

**Premium-consumer 禁色盤（mandatory，第二常見 AI Tell）**

Premium consumer briefs（廚具、wellness、工匠品牌、奢侈品、DTC 家居等）的 LLM 預設是**暖米色/奶油 + 黃銅/陶土/深紅/赭色 + 濃縮咖啡深色文字**。以下 hex 家族禁止作為預設背景和強調色：

- **禁止背景：** `#f5f1ea`、`#f7f5f1`、`#fbf8f1`、`#efeae0`、`#ece6db`、`#faf7f1`、`#e8dfcb`（所有「暖紙 / 奶油 / 白堊 / 骨白」）
- **禁止強調色：** `#b08947`、`#b6553a`、`#9a2436`、`#9c6e2a`、`#bc7c3a`、`#7d5621`（所有「黃銅 / 陶土 / 深紅 / 赭色」）
- **禁止文字色：** `#1a1714`、`#1a1814`、`#1b1814`（所有「濃縮咖啡 / 暖近黑」）

**替代方案（輪換，不要重複使用）：**
- **Cold Luxury：** 銀灰 + 鉻 + 煙霧（Tesla、Apple Watch 風格）
- **Forest：** 深綠 + 骨白 + 琥珀強調（Filson、Patagonia premium 風格）
- **Black and Tan：** 真正的近黑 + 暖棕褐，高對比，無米色
- **Cobalt + Cream：** 飽和藍對比單一中性色，無黃銅
- **Terracotta + Slate：** 暖橘紅對比冷灰，無黃銅
- **Olive + Brick + Paper：** 啞光橄欖綠加磚紅強調色
- **Pure monochrome + 單一飽和跳色：** 近白 + 近黑 + 一個鮮豔強調色（electric blue、emerald、hot pink 等）

覆寫允許：brand brief 明確指名這些顏色，或品牌確實是 vintage / 工匠 / 暖色手工風格且能說明原因。

**一個專案一個配色板。** 不在同一專案中混用暖灰和冷灰。

---

### 3.3 Layout（版型）

**Anti-center bias（反置中偏見）**

當 `DESIGN_VARIANCE > 4`，避免置中 Hero / H1 版型。強制使用：
- Split Screen（50/50 分割）
- 左對齊內容 / 右對齊視覺資產
- 不對稱留白
- Scroll-pinned 結構

覆寫允許：editorial / manifesto / launch-announcement briefs，訊息本身就是設計時。

**卡片用法規範**

- 只在 elevation 能傳達真實層次結構時才用卡片。否則用 `border-t`、`divide-y` 或負空間分組。
- 使用陰影時，用背景色調色。不要在淺色背景上放純黑陰影。
- `VISUAL_DENSITY > 7`：禁止泛型卡片容器。資料指標在純版型中呼吸。

**形狀一致性鎖定（mandatory）**

為頁面選定一個圓角尺度並貫穿全頁。選項：全銳角（radius 0）、全圓角（12-16px）、全膠囊（interactive 元素 full radius）。混合系統只有在有明文規則時才允許（例如「按鈕全膠囊、卡片 16px、輸入框 8px」）且必須全頁遵守。方形版型中出現圓形按鈕，或膠囊按鈕頁面中出現方形卡片，是破損設計。

---

### 3.4 Interactive States（互動狀態）

LLM 預設只實作「靜態成功狀態」。必須實作完整週期：

- **Loading：** Skeletal loaders，形狀匹配最終版型。避免泛型圓形轉圈。
- **Empty States：** 精心構成；說明如何填充資料。
- **Error States：** 清晰，表單用 inline，toast 只用於暫時性通知。
- **Tactile Feedback：** `:active` 時用 `-translate-y-[1px]` 或 `scale-[0.98]` 模擬實體按壓。

**按鈕對比度檢查（mandatory，a11y）**

出貨前驗證所有按鈕文字對按鈕背景可讀。禁止：白色按鈕 + 白色文字、`bg-white` CTA 搭配 `text-white`、無邊框透明按鈕貼在頁面背景上。每個 CTA 審查對比度：WCAG AA 最低（內文 4.5:1，大文字 18px+ 為 3:1）。Ghost button 置於攝影背景上也需加 backdrop、scrim 或描邊。

**CTA 按鈕換行禁止（mandatory）**

按鈕文字在桌機版必須單行。如果 "VIEW SELECTED WORK" 換到 2-3 行，按鈕是破損的。修法：縮短標籤（主要 CTA 最多 3 個字，理想 1-2 個字）或加寬按鈕。桌機版換行的 CTA 是 Pre-Flight Fail。

**No Duplicate CTA Intent（mandatory）**

同一頁有相同意圖的兩個 CTA 是 Pre-Flight Fail。例：
- "Get in touch" + "Contact us" + "Let's talk" + "Start a project" = 全是「聯絡」意圖 → 全頁只選一個標籤
- "Try free" + "Get started" + "Sign up free" = 全是「註冊」意圖 → 選一個
- "View work" + "See selected work" + "Browse projects" = 全是「作品集」意圖 → 選一個

---

## 四、AI Tells 禁止模式清單

> 以下所有模式，除非 brief 明確要求，否則全部禁止。這是真實測試後歸納的 LLM 預設簽名。

### 9.A Visual & CSS

- **禁止霓虹 / 外發光**：預設。用內邊框或微妙調色陰影代替。
- **禁止純黑 `#000000`**：用 off-black、zinc-950 或 charcoal。
- **禁止過飽和強調色**：降低飽和度以融合中性色。
- **禁止大標題過度漸層文字**：`background-clip: text` 漸層效果用於大 H1，禁止作為預設。
- **禁止自訂滑鼠游標**：已過時、無障礙不友善、效能不友善。

### 9.B Typography

- **避免 Inter 作為預設**：見第三節。覆寫路徑存在。
- **禁止只靠超大 H1 喊叫**：用字重 + 顏色控制層次，而非純粹放大字級。
- **Serif 約束**：Serif 限用於 editorial / luxury / publication。禁用於 dashboard。

### 9.C Layout & Spacing

- **數學上完美**的 padding 和 margin。不要讓元素在尷尬的間隙中漂浮。
- **禁止三欄等寬功能卡**：三張水平等寬卡片是 LLM 預設版型。用 2-column zig-zag、不對稱 grid、scroll-pinned 或水平捲動替代。

### 9.D Content & Data（Jane Doe Effect）

- **禁止泛型名稱**："John Doe"、"Sarah Chan"、"Jack Su" → 使用有創意、符合地區文化的真實感名稱。
- **禁止泛型頭像**：不要 SVG 蛋形圖或 Lucide user icon → 使用可信賴的相片佔位符或特定風格化。
- **禁止假完美數字**：避免 `99.99%`、`50%`、`1234567`。使用有機、不規則的數據（`47.2%`、`+1 (312) 847-1928`）。
- **禁止 startup slop 品牌名**："Acme"、"Nexus"、"SmartFlow"、"Cloudly" → 發明有語境感、像真實品牌的名稱。
- **禁止填充動詞**："Elevate"、"Seamless"、"Unleash"、"Next-Gen"、"Revolutionize" → 只用具體動詞。

### 9.E External Resources & Components

- **禁止手刻 SVG icon**：使用 Phosphor / HugeIcons / Radix / Tabler。Lucide 只在明確要求時使用。
- **手刻裝飾性 SVG 強烈不建議**作為預設。
- **禁止 div 拼接假截圖**：永遠不要用 `<div>` 矩形建構假 product UI 截圖。使用真實圖片、生成圖片，或跳過 preview。
- **禁止使用會失效的 Unsplash 連結**：使用 `https://picsum.photos/seed/{descriptive-string}/{w}/{h}` 或生成圖片佔位符或真實資產。
- **shadcn/ui 客製化允許，但禁止使用預設狀態**：客製 radii、顏色、陰影、字型以符合專案美學。

### 9.F Production-Test Tells（具體禁止項目）

**Hero 和頁面頂部**
- **禁止在 Hero 中使用版本標籤**：`V0.6`、`v2.0`、`BETA`、`INVITE-ONLY PREVIEW`、`EARLY ACCESS`、`ALPHA`。只有 brief 明確是關於產品上線 / 預覽狀態時才允許。
- **禁止 "Brand · No. 01" 副眉標籤**："Marrow · No. 01 · The 6-quart" 這類 micro-meta 行。刪掉。

**區塊編號與微型標籤**
- **禁止區塊編號眉標**：`00 / INDEX`、`001 · Capabilities`、`002 · Featured commission`、`06 · how it works`、`05 · The honest table`。眉標應用白話說明主題，不要枚舉編號。
- **禁止 `01 / 4` 式分頁標籤**放在圖片或 bento 格子上。
- **禁止 `Scroll · 001 Capabilities` 式滾動提示**：簡單箭頭或「Scroll」就夠，不需區塊編號前綴。
- **禁止 "Index of Work, 2018-2026" 式範圍標籤**作為眉標。直接說明區塊內容。

**分隔符與點**
- **中間點（`·`）有用量限制**：每行 metadata strip 最多 1 個。不要用它作為所有東西的預設分隔符（"foo · bar · baz · qux · quux"）。
- **禁止在每個清單 / nav / badge 項目前放彩色狀態點**：只有在點確實傳達語意狀態（伺服器狀態、可用性旗標）且用量稀少時才可用。

**Em-dash 與字體裝飾**
- **禁止 em-dash（`—`）** 作為設計元素或任何地方使用（見下方完整禁令）。
- **禁止預設使用 `<br>` 斷行加 italic 標題** 作為設計手法："for thirty`<br>`*years.*" 式的拆分。標題應先可自然閱讀。
- **禁止垂直旋轉文字**（"INDEX OF WORK, 2018-2026" 旋轉 90°）：限用於 brief 明確是 agency / Awwwards / 實驗性且有真實構圖理由。
- **禁止準星 / 格線裝飾**：純粹為了「讓頁面感覺有設計」而畫的垂直和水平線。只有在組織真實內容時才用。

**假 product preview**
- **禁止在 Hero 中放 div 拼接假 product UI**（假任務清單、假終端、假 dashboard）：這是 LLM 設計的第一 Tell。使用真實截圖、生成圖片、真實元件 preview，或完全不放。
- **禁止假截圖中的版本 footer**（"v0.6.2-rc.1"、"last sync 4s ago · main"）。

**行銷文案 Tells**
- **禁止 "Quietly in use at" / "Quietly trusted by"** 社會證明標題。使用自然語言："Trusted by"、"Used at"、"Customers include"，或直接省略標題。
- **禁止 "From the field" / "Field notes" / "Currently on the bench" / "On our desks" / "Loose plates" 式詩意標籤**放在引言、部落格或側邊欄區塊。這是表演性工匠感的 AI Tell。使用功能性標籤（"Testimonials"、"Latest writing"、"Now working on"）或省略。
- **禁止 "We respect the French ones" 式**假謙遜業界參照。
- **禁止天氣 / 地區條帶**（"LIS 14:23 · 18°C"）出現在 header / footer，除非 brief 明確是關於特定地點 / 跨時區工作室。
- **禁止眉標下方的 micro-meta 句子**：如「這些全是今天已出貨的功能，不是路線圖承諾。清單會刻意保持精簡。」置於區塊標題下方的這類句子是雜訊。
- **禁止泛型步驟標籤**："Stage 1 / Stage 2 / Stage 3"、"Step 1 / Step 2 / Step 3"、"Phase 01 / Phase 02 / Phase 03"。用實際動詞直接說明（"Install"、"Configure"、"Ship"），不要 "Stage 1: Install"。

**Pills、標籤與版本章**
- **禁止在圖片上疊加 pill / label / tag**：不要在照片上放 `<span>` 覆蓋標籤，如 `Brand · 02`、`PLATE · BRAND`、`Field notes - journal`。讓圖片自己說話，或在圖片下方（外部）加說明文字。
- **禁止用偽裝照片作者說明作為裝飾**：`Field study no. 12 · Ines Caetano`、`Plate 03 · House archive`、`Frame XII · 35mm` 放在 stock/picsum 圖片下方是裝腔作勢。照片說明只有在為真實攝影師署名真實照片時才允許。
- **禁止在行銷頁面放版本 footer**：`v1.4.2`、`Build 0048`、`last sync 4s ago · main` 是 CLI / devtool 元素，不是 landing / portfolio 頁面內容。
- **禁止 "Reservation 412 of 800" 式即時庫存計數器**作為裝飾。只有 brief 明確是限量等候名單且有真實資料時才允許。

**裝飾文字條帶**
- **禁止 Hero 底部裝飾文字條帶**："BRAND. MOTION. SPATIAL."、"TYPE / FORM / MOTION"、"DESIGN · BUILD · SHIP"、"ESTD. 2018 · LISBON · BRAND. MOTION. SPATIAL." 這類 mono-caps 小字橫跨 hero 底部是 agency portfolio 的陳詞濫調。只有在條帶包含真實可點擊連結或真實狀態資訊時才允許。
- **禁止區塊標題右上角的浮動小字**：區塊有一個靠左大標題，右上角浮著一個小段解釋文字，與其他元素沒有明確對齊關係。這個浮動元素是 Tell。把副文字直接放在標題下方，或建立清晰的兩欄標題（左：標題，右：對齊的內文），不要放角落浮動段落。

**Lists、分隔線與評分**
- **禁止在長清單 / 規格表的每一行都用 `border-t` + `border-b`**：選一種（行與行之間的底邊線，或群組上方的頂邊線），並少量使用。10 行規格表每行都有分隔線是最懶惰的版型。
- **禁止用填滿背景軌道的評分 / 進度條**作為比較視覺。需要顯示「X 比 Y」比較時，用數字 + 小圖示，或不帶背景軌道的內嵌小條。

**地區、時間與捲動提示**
- **地區 / 城市名 / 時間 / 天氣條帶在 99% 的 brief 中禁止**。只有在全球分布工作室、旅遊品牌或實體場所 brief 時才允許。頁尾的聯絡地址一行是可以的；裝飾性地區條帶不行。
- **捲動提示禁止**：`Scroll`、`↓ scroll`、`Scroll to explore`、動畫滑鼠滾輪圖示。使用者知道什麼是捲動。
- **完全禁止裝飾性狀態點**：nav 項目前、清單行前、badge 前的彩色點是 Tell。只有在傳達真實語意狀態且每個頁面區塊限一個時才允許。

### 9.G EM-DASH 完全禁令（最常違反的 Tell）

**Em-dash（`—`）完全禁止。** 這是 LLM 最具代表性的風格拐杖，也是生產測試中第一名的視覺 Tell。沒有「少用」的允許空間，沒有「自然語言頻率」的允許空間，沒有「內文中可以」的允許空間。完全禁止。

- **標題禁止**：用句號或逗號代替。
- **眉標 / 標籤 / pill / 按鈕文字 / 圖片說明 / nav 項目禁止**：用換行、欄位分隔或細分隔線代替。
- **內文禁止**：重組句子：兩個句子用句號、或逗號、或括號、或冒號。
- **引言署名禁止**：用帶空格的普通連字號（` - `）或換行 + 較小字重的姓名。
- **en-dash（`–`）作為分隔符也禁止**：日期範圍（`2018-2026`）用連字號。數字範圍（`€40-80k`）用連字號。

頁面上允許的唯一破折號字元：
- 普通連字號 `-`（複合字、範圍、markup 中的分隔線）
- 數學中的負號（`-5°C`）

如果輸出中有任何一個 `—` 或 `–` 對使用者可見，輸出就是 Pre-Flight 失敗，必須重寫。

---

## 五、Pre-Flight 完工前檢查清單

完工前，逐條核對以下項目：

- [ ] 字型不是 `Inter`（除非有正當理由）
- [ ] 沒有 Fraunces / Instrument_Serif
- [ ] 沒有 AI 紫色漸層 / 霓虹發光
- [ ] 強調色全頁一致，沒有不一致
- [ ] Premium consumer 沒有用 `#f5f1ea` 系列背景
- [ ] Hero 沒有三欄等寬卡片
- [ ] 沒有任何 em-dash `—` 或 `–` 分隔符
- [ ] 所有按鈕文字對比度 WCAG AA 通過
- [ ] 所有按鈕標籤在桌機版單行顯示
- [ ] 沒有重複意圖的 CTA
- [ ] Loading / Empty / Error 狀態都已實作
- [ ] 行動裝置版型收合已宣告
- [ ] 頁面主題（light / dark）全頁鎖定，沒有中途反轉
- [ ] 沒有 div 拼接假截圖
- [ ] 沒有 `border-t + border-b` 每行都有的規格表
- [ ] 沒有泛型佔位符名稱（John Doe、Sarah Chan 等）
- [ ] 眉標數量 ≤ ceil(sectionCount / 3)
- [ ] 沒有 zigzag 連續 3 個以上的 image+text split 區塊
- [ ] 沒有重複的版型家族（每種版型家族最多出現一次）
- [ ] 輸出中沒有任何 `—`（em-dash）或 `–`（en-dash 分隔符）可見字元
- [ ] Light / Dark 兩種模式都已測試，沒有只出貨單一模式

---

## 六、Em-Dash 完全禁令

來自 taste-skill Section 9.G，這是 LLM 最常被發現的 Tell，必須 zero tolerance：

- `—`（em-dash）在所有可見文字中完全禁止：標題、eyebrow、標籤、按鈕文字、圖片說明、內文、引言歸屬
- 替代方式：用句號分兩句、用逗號、用括號、用冒號改寫句子
- 日期範圍（2018-2026）和數字範圍（€40-80k）用一般 hyphen `-`
- `–`（en-dash 作分隔符）同樣禁止
- 輸出中出現任何一個 `—` 或 `–` 即 Pre-Flight 失敗，必須重寫
- 此規則不可用「謹慎使用」軟化，是二元規則：零 em-dash

---

## 七、設計詞彙庫（Reference Vocabulary）

來自 taste-skill Section 10。Agent 應知道這些模式名稱，以便設計討論和快速選型。這是詞彙表，不是代碼庫；實作細節另存 Block Library。

### Hero Paradigms（Hero 版型）

- **Asymmetric Split Hero** - 文字在一側、資產在另一側，大量留白
- **Editorial Manifesto Hero** - 大字型、無視覺資產、近乎海報
- **Video / Media Mask Hero** - 文字以遮罩形式切出，背景為影片
- **Kinetic-Type Hero** - 動態字型作為主要視覺
- **Curtain-Reveal Hero** - Hero 元素在滾動時如幕布展開
- **Scroll-Pinned Hero** - Hero 固定不動，內容在背後滾動

### Navigation & Menus（導覽與選單）

- **Mac OS Dock Magnification** - 邊緣導覽，圖示在 hover 時流暢放大
- **Magnetic Button** - 按鈕朝游標方向吸引
- **Gooey Menu** - 子項目如黏性液體分離
- **Dynamic Island** - 可變形的狀態 / 提示 pill
- **Contextual Radial Menu** - 在點擊位置展開的圓形選單
- **Floating Speed Dial** - FAB 展開為弧形次要動作
- **Mega Menu Reveal** - 全螢幕下拉式選單，內容交錯淡入

### Layout & Grids（版型與網格）

- **Bento Grid** - 不對稱磁磚分組（Apple Control Center 風格）
- **Masonry Layout** - 交錯網格，無固定行高
- **Chroma Grid** - 邊框 / 磁磚帶有微妙動態漸層
- **Split-Screen Scroll** - 兩個半面朝相反方向滑動
- **Sticky-Stack Sections** - 區塊在滾動時固定並堆疊

### Cards & Containers（卡片與容器）

- **Parallax Tilt Card** - 3D 傾斜追蹤滑鼠座標
- **Spotlight Border Card** - 邊框在游標下發光
- **Glassmorphism Panel** - 磨砂玻璃加內折射
- **Holographic Foil Card** - hover 時彩虹色澤偏移
- **Tinder Swipe Stack** - 實體卡片堆疊，可滑走
- **Morphing Modal** - 按鈕展開成自身的對話框

### Scroll Animations（滾動動畫）

- **Sticky Scroll Stack** - 卡片固定並實體堆疊
- **Horizontal Scroll Hijack** - 垂直滾動轉水平平移
- **Locomotive / Sequence Scroll** - 影片 / 3D 序列與捲軸連動
- **Zoom Parallax** - 中央背景圖隨滾動放大
- **Scroll Progress Path** - SVG 線條隨滾動繪製
- **Liquid Swipe Transition** - 頁面轉場如黏性液體

### Galleries & Media（畫廊與媒體）

- **Dome Gallery** - 3D 全景畫廊
- **Coverflow Carousel** - 帶有角度邊緣的 3D 輪播
- **Drag-to-Pan Grid** - 無邊界可拖拉畫布
- **Accordion Image Slider** - 細長條在 hover 時展開
- **Hover Image Trail** - 滑鼠移動留下爆現圖片軌跡
- **Glitch Effect Image** - hover 時 RGB 頻道偏移

### Typography & Text（字型與文字）

- **Kinetic Marquee** - 無限文字帶，隨滾動方向反轉
- **Text Mask Reveal** - 超大字型作為透明窗口呈現影片
- **Text Scramble Effect** - 載入 / hover 時如 Matrix 解碼
- **Circular Text Path** - 文字沿旋轉圓弧排列
- **Gradient Stroke Animation** - 外框文字搭配流動漸層
- **Kinetic Typography Grid** - 字母躲避游標

### Micro-Interactions & Effects（微互動與效果）

- **Particle Explosion Button** - CTA 成功時炸裂成粒子
- **Liquid Pull-to-Refresh** - 重新載入指示器如分離水滴
- **Skeleton Shimmer** - 佔位符上移動的光反射
- **Directional Hover-Aware Button** - 填色從游標所在側進入
- **Ripple Click Effect** - 從點擊座標向外擴散的波紋
- **Animated SVG Line Drawing** - 向量即時自我繪製
- **Mesh Gradient Background** - 有機熔岩燈泡狀漸層
- **Lens Blur Depth** - 背景模糊以聚焦前景動作

### Animation Library Choice（動畫函式庫選型）

- **Motion (`motion/react`)** - UI / Bento / 狀態切換動畫的預設選擇
- **GSAP + ScrollTrigger** - 全頁 scrolltelling 與滾動劫持。隔離於專用的 leaf component 並加 `useEffect` cleanup
- **Three.js / WebGL** - canvas 背景與 3D 場景，同樣需隔離
- **禁止在同一個 component tree 中混用 GSAP / Three.js 與 Motion**：它們爭用同一個 frame

---

## 八、效能 + 可及性護欄

來自 taste-skill Section 6 和 Section 8：

### 6.A 硬體加速

只對 `transform` 和 `opacity` 做動畫；絕不動畫 `top`、`left`、`width`、`height`。`will-change` 謹慎使用，只加在真正會動畫的元素上。

### 6.B 減少動態（強制）

`MOTION_INTENSITY > 3` 必須實作 `prefers-reduced-motion`。在 Motion 中用 `useReducedMotion()` 降級為靜態；在 CSS 中以 `@media (prefers-reduced-motion: no-preference)` 或覆寫區塊控制。無限循環 / parallax / scroll-hijack / 磁性物理 在 reduce 模式下必須 collapse 為靜態或即時。

### 6.C Dark Mode（consumer 向頁面強制雙模式）

設計從一開始就同時考慮 light / dark，不得只做一種（除非 brief 明確指定單一模式）。採用 Tailwind `dark:` variant 或 CSS variables 擇一，同一專案不得混用兩種策略。

### 6.D Core Web Vitals 目標

- **LCP** < 2.5s：hero 圖必須 `next/image priority` 或 preload
- **INP** < 200ms：繁重工作移離主執行緒
- **CLS** < 0.1：為圖片、字型、embed 預留空間
- 宣告頁面完成前執行 Lighthouse

### 6.E DOM Cost

grain / noise 濾鏡只能用在 fixed `pointer-events-none` 的偽元素（`fixed inset-0 z-[60] pointer-events-none`）；絕不用在滾動容器上，持續 GPU repaint 會摧毀行動端 FPS。

### 6.F z-index 紀律

禁止亂噴 `z-50` / `z-10`。z-index 只用於系統層級（sticky nav、modal、overlay、grain）。在專案常數檔中記錄 z-index scale。

---

### Dark Mode Protocol（Section 8）

- 預設雙模式，除非 brief 明確指定單模式（例如印刷模擬 editorial）
- Token 策略二選一：Tailwind `dark:` variant 或 CSS variables；專案只選一種，不得混用
- 不得用純 `#000000` 或純 `#ffffff`（使用 zinc-950、off-white），純值會消除深度
- 確保 light 模式下有視覺層次感的 CTA，在 dark 模式下同樣突出
- 出貨前必須在 light / dark 兩種模式下測試，不可只在一種模式下出貨
