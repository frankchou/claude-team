---
name: coding-conventions
description: 程式碼風格與慣例準則。撰寫或審查 TypeScript / React 程式碼時應參考。架構師、全端工程師、Code Reviewer 適用。
---

# 程式碼慣例

## 通用原則

- 新程式碼要**讀起來像周圍既有的程式碼** —— 比照其命名、註解密度、慣用寫法。
- 優先沿用專案既有的工具函式、型別、元件，不重複造輪子。
- 函式單一職責；避免過深巢狀，提早 return。
- 不留無用程式碼、不留 commented-out 區塊。

---

## TypeScript

- 全程 `strict`。避免 `any`；不得已時就近註解原因。
- 用 `type` / `interface` 明確描述資料結構，匯出共用型別。
- 公開函式標註回傳型別。

---

## React

- 一律 function component + hooks。
- side effect 放 `useEffect`，並正確處理 cleanup 與相依陣列。
- 昂貴計算或穩定 callback 才用 `useMemo` / `useCallback`，勿濫用。
- 元件檔案以該元件命名；一個檔案以一個主要 export 為原則。

---

## 命名

- 變數 / 函式：camelCase。型別 / 元件 / 類別：PascalCase。常數：UPPER_SNAKE_CASE。
- 命名要說明「是什麼 / 做什麼」，避免縮寫與模糊字眼。

---

## 註解

- 註解寫「為什麼」，不寫「做了什麼」（程式碼自己會說）。
- 比照專案語言（本專案註解多為繁體中文）。

---

## 錯誤處理

- 對外部呼叫（API、Firebase）做明確錯誤處理，不吞錯。
- 回傳結果用 discriminated union（如 `{ ok } | { error }`）優於拋例外，比照既有寫法。

---

## UI / CSS 反模式清單

以下寫法禁止出現，遇到需立即重構：

### 版面
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| `height: 100vh` | iOS Safari toolbar 導致截斷 | `min-height: 100dvh` |
| `position: absolute` 做垂直置中 | 脆弱，RWD 易壞 | flexbox / grid `align-items: center` |
| 硬碼像素斷點 `@media (max-width: 768px)` | 與設計系統 token 脫鉤 | 用設計系統定義的 breakpoint 變數 |
| 負 margin 做間距修正 | 隱藏父層 overflow 問題 | 修正容器 padding / gap |

### 圖片 / 媒體
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| `<img>` 無 `width` / `height` 屬性 | 造成 CLS（版面偏移） | 標注尺寸或用 `aspect-ratio` |
| JPG/PNG 直接使用無壓縮 | 影響 LCP | 用 WebP/AVIF，搭配 `<picture>` fallback |
| `background-image` 用大圖 | 無法懶載入 | 改用 `<img loading="lazy">` |

### 動畫
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| 動畫改 `width` / `height` / `top` / `left` | 觸發 layout reflow，掉幀 | 只用 `transform` / `opacity` |
| 無 `prefers-reduced-motion` 判斷 | 傷害前庭敏感使用者 | 加 `@media (prefers-reduced-motion: reduce)` |
| 動畫超過 500ms | 感覺卡頓 | micro-interaction ≤ 200ms，頁面轉場 ≤ 300ms |

### 清單 / 長列表
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| 直接渲染 1000+ 筆資料 | 造成 DOM 爆量、記憶體飆高 | 用虛擬化（react-window / tanstack-virtual） |
| 無 loading / empty / error 狀態 | 用戶看到空白不知所措 | 三個狀態一定要做 |

### 色彩 / 對比
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| 用 `#999` 灰文字在白底 | WCAG AA 不達標（對比 2.85:1） | 正文最低對比 4.5:1，大字 3:1 |
| 只靠顏色區分狀態（紅/綠） | 色盲使用者無法辨認 | 顏色 + 圖示 + 文字三重提示 |
| 隨意使用設計系統外的色碼 | 破壞品牌一致性 | 只使用設計 token，不硬碼色碼 |

### 表單
| 反模式 | 原因 | 正確做法 |
|--------|------|---------|
| `<div>` 假裝按鈕 | 鍵盤不可聚焦，螢幕閱讀器無法識別 | 用 `<button>` 或加 `role="button" tabIndex={0}` |
| `placeholder` 取代 `<label>` | 聚焦後消失，無法同時看說明與輸入 | `<label>` 必須存在，placeholder 只補充 |
| 驗證錯誤只改邊框顏色 | 無文字說明，輔助技術看不到 | `aria-describedby` 連結錯誤訊息元素 |

---

## 提交前

- `npx tsc -b` 必須通過，無型別錯誤才算完成。
- 跑過 lint（`eslint`）無 error（warning 可暫存但需記錄）。
