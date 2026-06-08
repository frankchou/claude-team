# Animation Timing Reference

來源：taste-skill + ui-ux-pro-max（外部引入，Phase 1）

---

## 時間規格

| 互動類型 | 時長 | 備註 |
|---------|------|------|
| 微互動（hover / tap / active） | 150–200ms | 超過即感覺遲鈍 |
| 過渡（Modal 開關 / Drawer） | 200–300ms | 進場比退場慢 |
| 頁面元素進場（scroll reveal） | 400–600ms | 單元素；stagger 延遲額外 60ms/item |
| 複雜轉場 / 頁面切換 | ≤ 400ms | 超過即感覺卡頓 |
| 背景漸層動畫 (Aurora/mesh) | 8000–12000ms | 必須 loop，不得停頓 |
| **禁止** | > 500ms 無載入指示 | 超過即需加 Skeleton / Spinner |

---

## 緩動規則

### 進場（ease-out）

```css
/* CSS */
transition-timing-function: cubic-bezier(0, 0, 0.2, 1);
/* Tailwind */
transition ease-out
```

物體從遠到近，先快後慢，符合物理直覺。

### 退場（ease-in）

```css
/* CSS */
transition-timing-function: cubic-bezier(0.4, 0, 1, 1);
/* Tailwind */
transition ease-in
```

退場應比進場快 30-40%（例如進場 300ms，退場 200ms）。

### 精緻進場（自訂緩動）

```css
/* Vercel/Linear 常用 */
transition-timing-function: cubic-bezier(0.16, 1, 0.3, 1);
/* Motion (framer-motion) 等效 */
ease: [0.16, 1, 0.3, 1]
```

### Spring 物理（Motion / Framer Motion）

```ts
// 標準 spring — 大多數互動元素
transition: {
  type: "spring",
  stiffness: 100,
  damping: 20,
}

// 彈性按鈕 / 輕量彈跳
transition: {
  type: "spring",
  stiffness: 260,
  damping: 20,
}

// Claymorphism / 兒童 app 彈跳
// cubic-bezier(0.34, 1.56, 0.64, 1) — 超過 1 的 overshoot
```

### 禁止

- UI 過渡 **禁止使用 `linear`**：linear 缺乏慣性感，看起來像機器，不像物理。
- 禁止在 React state 追蹤連續值（滑鼠位置、scroll progress）——改用 `useMotionValue` / `useTransform`。

---

## 只允許動畫的 CSS 屬性

**允許（GPU 加速，不觸發 layout）：**

```
transform: translateX() translateY() scale() rotate() skew()
opacity: 0 → 1
filter: blur() brightness()（謹慎使用）
```

**嚴格禁止（觸發 layout / paint，掉幀）：**

```
width / height（改用 transform: scale()）
top / left / bottom / right（改用 transform: translate()）
margin / padding
max-height（accordion 動畫改用 clip-path 或 scale）
color（文字顏色切換可用，但不要做 transition）
```

---

## prefers-reduced-motion

所有 `MOTION_INTENSITY > 3` 的動畫**必須**尊重此媒體查詢。

### CSS 寫法

```css
/* 動畫僅在使用者無特殊需求時啟用 */
@media (prefers-reduced-motion: no-preference) {
  .card {
    transition: transform 300ms cubic-bezier(0.16, 1, 0.3, 1);
  }
}

/* 或反向停用 */
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Motion (framer-motion) 寫法

```tsx
import { useReducedMotion } from "motion/react";

function Card() {
  const reduce = useReducedMotion();
  return (
    <motion.div
      initial={reduce ? false : { opacity: 0, y: 24 }}
      animate={{ opacity: 1, y: 0 }}
      transition={reduce ? { duration: 0 } : { duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
    />
  );
}
```

**無限循環、視差、scroll-hijack、磁性物理動畫** — 在 `prefers-reduced-motion` 下必須完全停用或退化為靜態。

---

## 禁用動畫模式（AI Tell）

以下模式是 LLM 預設動畫輸出，需主動避免：

| 禁用模式 | 原因 |
|---------|------|
| 每張卡片都加 infinite pulse | 視覺雜訊，無語意 |
| 每個 section 都加 scroll reveal | 過度使用，失去強調效果 |
| Marquee 超過 1 個 / 頁 | 第二個 marquee 即是 lazy filler |
| `window.addEventListener('scroll', ...)` | 每幀執行，jank，硬禁 |
| `requestAnimationFrame` + `useState` | 每幀 re-render，崩潰 |
| `width` / `height` 做 transition | 觸發 layout，掉幀 |
| 頁面切換用 slide-from-right | AI 預設，缺乏設計意圖 |

---

## 動畫意圖原則（Motion Must Be Motivated）

加動畫之前，必須能回答：「這個動畫傳達什麼？」

**有效答案：**
- 層級（引導注意力至關鍵內容）
- 敘事（按序揭露，配合頁面故事結構）
- 回饋（確認使用者操作已被系統接收）
- 狀態轉換（明確標示某件事改變了）

**無效答案：**
- 「看起來比較酷」
- 「我看別人的網站這樣做」
- 「這個函式庫有這個功能」

---

## 效能邊界

| 指標 | 目標 |
|------|------|
| LCP | < 2.5s |
| INP（互動延遲） | < 200ms |
| CLS | < 0.1 |
| `will-change: transform` | 謹慎使用，只加在「確定會動」的元素 |
| grain / noise filter | 只加在 `fixed, pointer-events-none` 的 pseudo-element |
| Three.js / GSAP | lazy-load，不在首屏同步載入 |
