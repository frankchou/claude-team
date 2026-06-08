# 22 Visual Style Directions

來源：ui-ux-pro-max styles.csv + taste-skill（外部引入，Phase 1）

> 使用說明：設計師在開案時從此清單選定方向，並寫入專案 ui-spec.md。
> 每種方向有對應的實作 CSS 關鍵字，可直接帶入 Tailwind 或 CSS-in-JS。

---

### 1. Minimalist Clean

**適用**：企業 SaaS、文件平台、Dashboard、B2B 工具
**特徵**：大量留白（`py-32` ~ `py-48`）、單色系或極少色彩、幾何 grid 為主、字型層級清晰、無裝飾元素。所有視覺判斷以「這個元素是否必要？」為標準，不是不能加，而是加之前必須說出理由。
**禁止配搭**：創意代理商風格、霓虹色、複雜動畫、裝飾性插圖

---

### 2. Bold Typography

**適用**：行銷網站、品牌旗艦頁、活動登陸頁、代理商作品集
**特徵**：標題字型超大（`text-7xl` ~ `text-9xl`）、字重極重（700–900）、字型本身即是視覺重心、大量 tracking-tighter / uppercase 使用、頁面其他元素讓位給文字排版。
**禁止配搭**：資料密集的儀表板、政府 / 醫療服務（可讀性優先）、小螢幕多欄設計

---

### 3. Glassmorphism

**適用**：高端 SaaS 卡片、Modal overlay、精品消費品、Apple 風格介面
**特徵**：`backdrop-filter: blur(10-20px)`、半透明白色（`rgba(255,255,255,0.1-0.3)`）、1px 白色內邊框（`border: 1px solid rgba(255,255,255,0.2)`）、分層深度感、必須搭配鮮豔背景才有效果。需提供 `prefers-reduced-transparency` 的實心備援。
**禁止配搭**：低對比背景、無障礙優先場景（對比度不穩定）、純文字為主的文件

---

### 4. 3D / Depth

**適用**：遊戲、產品展示、沉浸式體驗、高端電商、AR/VR 入口
**特徵**：WebGL / Three.js / React Three Fiber、真實光影、視差（3-5 層）、物理動畫（`stiffness: 100, damping: 20`）、景深效果。行動端效能需降級處理。
**禁止配搭**：行動端低效能裝置（必須降級）、政府 / 公共服務、資料表格 / 表單主導的介面

---

### 5. Brutalist

**適用**：設計師作品集、反主流科技品牌、藝術展覽、編輯媒體
**特徵**：邊框明顯（`border: 2-4px solid`）、`border-radius: 0`、純色原色（紅/藍/黃/黑/白）、系統等寬字型（`font-family: monospace`）、不流暢的即時切換（`transition: none`）、刻意的不對稱。非「壞設計」，是「刻意的粗糙」。
**禁止配搭**：企業客戶、醫療、金融、需要建立信任感的場景

---

### 6. Neumorphism

**適用**：健康 / 冥想 app、智慧家居控制面板、美學 Dashboard
**特徵**：同色系凸/凹浮雕、多層柔光陰影（`box-shadow: -5px -5px 15px light, 5px 5px 15px dark`）、圓角 12-16px、單色系（差異只在明暗），按壓時內凹。對比度低是最大弱點，須特別處理文字對比。
**禁止配搭**：資料密集 Dashboard、無障礙優先場景（對比度天生低）、需要高辨識度的商業場景

---

### 7. Dark Luxury

**適用**：精品品牌、夜店 / 音樂場館、高端 Fintech、影音串流、汽車品牌
**特徵**：接近黑的深色背景（`#0F172A` 或 `#09090b`）、金色 / 銀色 / 玫瑰金單一強調色、高對比白色文字、稀少的裝飾元素、大量留白對抗黑底的壓迫感。不是「加霓虹就是暗色奢華」。
**禁止配搭**：兒童產品、明亮活潑的消費品、政府服務

---

### 8. Pastel Soft

**適用**：兒童教育、健康 wellness、美容 spa、寵物 app、輕量 SaaS onboarding
**特徵**：低飽和度粉彩（Soft Peach / Baby Blue / Mint / Lilac）、圓角 16-24px、柔和陰影（兩層：外凸 + 內凹）、friendly 字型（Nunito / Varela Round）、按壓有 `scale(0.98)` 觸感回饋。
**禁止配搭**：企業 B2B、金融、資料密集場景、需要嚴肅可信感的品牌

---

### 9. Neon Cyberpunk

**適用**：遊戲、Web3/DeFi、電競平台、科幻 UI、駭客主題作品
**特徵**：深黑底（`#000000` 或 `#0A0E27`）、霓虹色文字發光（`text-shadow: 0 0 10px neon`）、等寬字型、CRT scanline 覆蓋效果、glitch 動畫（`skew + offset keyframes`）。此風格須「刻意控制」，不能全頁霓虹轟炸。
**禁止配搭**：企業服務、醫療、政府、精品品牌（霓虹不等於精品）

---

### 10. Nature / Organic

**適用**：有機農業、永續科技、健康食品、戶外品牌、環保非營利
**特徵**：大地色系（Forest Green / Earth Amber / Stone）、有機不規則形狀（非方形卡片）、自然材質攝影、非對稱排版、慢速進場動畫（強調從容感）。避免飛速 hover 動畫，與品牌調性衝突。
**禁止配搭**：高科技產品、遊戲、金融交易平台

---

### 11. Corporate Professional

**適用**：法律事務所、保險、企業 B2B、政府服務、金融機構
**特徵**：深藍 / 深灰主色、方正佈局（12欄 grid）、無裝飾圖形、字型選 Lexend / IBM Plex Sans / Source Sans 3、訊息密度適中、高度依賴白底 + 深色文字確保文件感。
**禁止配搭**：創意品牌、消費娛樂、新創行銷頁

---

### 12. Playful / Cartoon

**適用**：兒童 app、教育遊戲、吉祥物主題、娛樂平台、食品零售
**特徵**：高飽和度（但非霓虹）、粗描邊元素（3-4px border）、圓潤字型（Baloo 2 / Fredoka）、角色插圖、動畫豐富（彈跳 spring、位移、表情變化）。
**禁止配搭**：金融、醫療、政府、B2B 工具

---

### 13. Editorial / Magazine

**適用**：出版媒體、文化雜誌、個人寫作平台、新聞網站
**特徵**：不對稱排版、多欄網格混用、大型引言排版（pull quote）、Serif display 字型（PP Editorial New / GT Sectra / Tiempos Headline）、圖片帶框或出血、行高寬鬆（`leading-relaxed`）。此情境是少數 Serif 合理的場景。
**禁止配搭**：SaaS 工具、資料儀表板、電商購物流程

---

### 14. Retro / Vintage

**適用**：精釀啤酒、餐廳、手工藝品牌、音樂場館、懷舊遊戲
**特徵**：Abril Fatface / Bebas Neue 等復古展示字型、舊紙張質感（noise / grain overlay）、有限色盤（2-3色）、手繪邊框裝飾、年代感色彩（深紅 / 深褐 / 奶黃）。
**禁止配搭**：科技產品、現代感 SaaS、無障礙優先場景

---

### 15. Gradient Rich

**適用**：Aurora/mesh 背景 SaaS 行銷、音樂平台 Hero、創意品牌 splash
**特徵**：多色漸層（radial-gradient / conic-gradient）、8-12 秒緩慢動態、`background-size: 200% 200%`、`blend-mode: screen`。注意文字對比度——漸層背景上的文字是對比度最難控制的場景。
**禁止配搭**：文件 / 說明平台（分心）、企業 B2B（不夠莊重）、行動端低效能（動畫耗電）

---

### 16. Monochrome

**適用**：攝影工作室、個人作品集、藝廊、頂級時裝品牌
**特徵**：純黑白或單色系（允許一個弱強調色）、大面積負空間、字型即視覺主角、圖片為唯一色彩來源。簡單但執行難度高——單色更容易暴露排版瑕疵。
**禁止配搭**：資料密集場景（無色彩編碼困難）、兒童 / 娛樂產品、行動呼籲密集的轉換頁

---

### 17. Data / Dashboard

**適用**：BI 工具、分析儀表板、金融報表、運維監控、SaaS 後台
**特徵**：12 欄 CSS Grid、8-12px tight padding、`font-mono` 數字（確保數值對齊）、圖表顏色語意化（綠=正向/紅=警示/橙=注意）、骨架屏 loading 狀態、無裝飾卡片框，1px 線分隔。WCAG AA 是底線。
**禁止配搭**：行銷登陸頁、精品消費品（調性衝突）、兒童 / 娛樂

---

### 18. Hand-crafted / Artisan

**適用**：手工藝品牌、工作坊、獨立設計師、農夫市集、書店
**特徵**：手寫字型（Caveat / Kalam / Amatic SC）、不規則邊框與筆觸感、泥土質感攝影、溫暖偏黃光源、刻意的「不完美」排版。字型在小尺寸下需特別確認可讀性。
**禁止配搭**：科技 B2B、金融、企業服務、需要精確可讀的大量文字

---

### 19. Futuristic Tech

**適用**：SpaceTech、自動駕駛、量子運算、次世代 AI 產品頁
**特徵**：HUD 視覺語言（線框 / 十字準線 / 數據流）、Orbitron / Space Grotesk 展示字型、暗色底 + 單一電氣藍 / 青綠強調色、等寬資料標籤（uppercase + letter-spacing）、稀少但精確的動畫。
**禁止配搭**：消費者友善產品（太冷硬）、醫療（需溫暖感）、兒童

---

### 20. Warm Earthy

**適用**：精品餐廳、戶外生活品牌、手工咖啡、美食 app
**特徵**：大地暖色（Terracotta / Sage / Amber）、天然材質紋理攝影、鬆散溫暖的排版節奏、非正式字型配對（Lora + Raleway）。
**注意**：避免落入 AI 預設的「奶油米 #F5F1EA + 銅黃 + Espresso」組合，此為 LLM 最常見的精品 tell。請參考 color-palettes/wcag-reference.md 的替代方案。
**禁止配搭**：科技產品、遊戲、需要「效率感」的工具

---

### 21. Scandinavian Nordic

**適用**：家居設計、家具電商、極簡生活品牌、北歐食品
**特徵**：冷白 / 霧灰底色、極度克制的裝飾、自然材質（木紋 / 石材）照片、高留白（`py-40` ~ `py-56`）、單一低調強調色（Forest Green / Muted Blue）、非對稱但平衡的排版。
**禁止配搭**：高能量產品（遊戲、能量飲料）、資料密集 Dashboard

---

### 22. Maximalist

**適用**：潮牌、Gen Z 行銷、限定聯名、藝術裝置互動
**特徵**：多色彩共存、多字型疊用、元素重疊 / 出血、大量視覺刺激但需要「刻意的混亂」而非「無序的雜亂」。每個視覺決策都要能說出理由——Maximalism ≠ 任意堆砌。
**禁止配搭**：企業 B2B、醫療、政府、需要清晰轉換路徑的電商（注意力分散）

---

## 選擇方法

1. 先確定目標族群與產品類型（參考 ux-flow.md）。
2. 從 Dial Inference 表（DESIGN_VARIANCE / MOTION_INTENSITY / VISUAL_DENSITY）確認數值。
3. 對應此表選方向，寫入 `docs/features/<功能代號>/ui-spec.md`。
4. 同一頁面只選一個主方向，可混合一個次方向（需明確說明混合規則）。
