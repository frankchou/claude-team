# Banner & Ad Sizes Reference

來源：ui-ux-pro-max（外部引入，Phase 1）

---

## 社群媒體

| 平台 | 用途 | 尺寸（px） | 備註 |
|------|------|-----------|------|
| **Facebook** | 封面照片 | 820 × 312 | 行動版顯示 560 × 312，避免重要元素在邊緣 |
| **Facebook** | 貼文圖片 | 1200 × 630 | 最常用比例（1.91:1） |
| **Facebook** | 限時動態 | 1080 × 1920 | 重要元素置中，上下 14% 避開安全區 |
| **Facebook** | 活動封面 | 1920 × 1005 | |
| **Instagram** | 正方形貼文 | 1080 × 1080 | |
| **Instagram** | 橫式貼文 | 1080 × 566 | 比例 1.91:1 |
| **Instagram** | 直式貼文 | 1080 × 1350 | 比例 4:5，動態填滿效果最佳 |
| **Instagram** | 限時動態 | 1080 × 1920 | |
| **Instagram** | Reels | 1080 × 1920 | |
| **Threads** | 貼文圖片 | 1080 × 1080 | 正方形為主流 |
| **X (Twitter)** | 封面 | 1500 × 500 | |
| **X (Twitter)** | 貼文圖片 | 1600 × 900 | 比例 16:9 |
| **LinkedIn** | 個人/公司封面 | 1584 × 396 | |
| **LinkedIn** | 貼文圖片 | 1200 × 627 | |
| **LinkedIn** | 限時動態 | 1080 × 1920 | |
| **YouTube** | 頻道封面 | 2560 × 1440 | 安全區 1546 × 423（各裝置皆可見） |
| **YouTube** | 縮圖 | 1280 × 720 | 最小 640 × 360，建議 1280 × 720 |
| **TikTok** | 影片縱向 | 1080 × 1920 | |
| **TikTok** | 個人封面 | 800 × 800 | |
| **Pinterest** | 標準 Pin | 1000 × 1500 | 比例 2:3 |
| **Pinterest** | 長 Pin | 1000 × 2100 | 比例 1:2.1（最大） |

---

## Web 廣告（Google Display Network）

| 尺寸（px） | 名稱 | 備註 |
|-----------|------|------|
| 728 × 90 | Leaderboard | 頁面頂端最常見 |
| 300 × 250 | Medium Rectangle | 投放量最大，必做尺寸 |
| 160 × 600 | Wide Skyscraper | 頁面側欄 |
| 300 × 600 | Half Page | 高影響力 |
| 970 × 250 | Billboard | 大型頂端橫幅 |
| 320 × 50 | Mobile Banner | 行動端必做 |
| 320 × 100 | Large Mobile Banner | 行動端 |
| 336 × 280 | Large Rectangle | 文章內嵌 |
| 250 × 250 | Square | 彈性配置 |
| 200 × 200 | Small Square | 輔助使用 |
| 468 × 60 | Banner | 舊版，仍有流量 |
| 120 × 600 | Skyscraper | 舊版側欄 |

---

## Email 行銷

| 用途 | 寬度（px） | 備註 |
|------|-----------|------|
| Email 內容最大寬 | 600–700 | 超過易被截斷 |
| Header Banner | 600 × 200 | |
| Hero Image | 600 × 300 | 比例 2:1 |
| Footer Banner | 600 × 100 | |
| Gmail 截圖預覽尺寸 | 640 × —（自動高） | |

---

## Open Graph / SEO 分享圖

| 用途 | 尺寸（px） | 備註 |
|------|-----------|------|
| OG Image（Facebook / LinkedIn） | 1200 × 630 | 最通用 |
| Twitter Card（大圖） | 1600 × 900 | summary_large_image |
| Twitter Card（小圖） | 800 × 418 | summary |
| WhatsApp 分享預覽 | 1200 × 630 | 同 OG |
| Slack / Discord 預覽 | 1200 × 630 | 同 OG |

---

## App Store / 應用商店

| 平台 | 用途 | 尺寸（px） |
|------|------|-----------|
| App Store (iOS) | iPhone 截圖（6.5"） | 1242 × 2688 |
| App Store (iOS) | iPhone 截圖（5.5"） | 1242 × 2208 |
| App Store (iOS) | iPad 截圖（12.9"） | 2048 × 2732 |
| App Store (iOS) | 預覽影片 | 1080 × 1920 |
| Google Play | 手機截圖 | 1080 × 1920（建議） |
| Google Play | Feature Graphic | 1024 × 500 |
| Google Play | App Icon | 512 × 512 |

---

## 設計注意事項

### 安全區（Safe Zone）原則
- 限時動態 / Reels：重要文字 / Logo 距上下邊緣保留 **14%**，距左右保留 **5%**。
- YouTube 封面：確認 1546 × 423 安全區內放入核心內容。
- 行動裝置 App 封面：避開狀態列（44-60px 頂部）與 Home Indicator（34px 底部）。

### 格式建議
- 靜態圖片：`WebP`（品質優先）或 `JPEG`（相容性優先）
- 帶透明度：`PNG` 或 `WebP`
- 動態廣告：`GIF`（≤ 150KB）或 `HTML5`
- 影片：`MP4 H.264`，行動端建議 ≤ 30fps

### 解析度
- 所有設計檔案以 **2x（@2x）解析度** 製作，輸出時縮為 1x 或保留 2x。
- Retina / High-DPI 裝置需要 2x 素材，否則模糊。
