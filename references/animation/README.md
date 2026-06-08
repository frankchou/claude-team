# 動畫規格參考（Phase 1）

> 來源：taste-skill（stitch-skill / taste-skill）/ ui-ux-pro-max-skill（design-system primitive-tokens）。
> 唯讀素材，請勿直接修改。打磨後的動畫規格請寫入 `assets/animation/`。

---

## 時間規格

### 語義化時間範圍

| 類型 | 時間範圍 | 說明 |
|-----|---------|------|
| **微互動（Micro-interaction）** | 150–200ms | 按鈕 press 回饋、toggle 切換、checkbox |
| **狀態過渡（State Transition）** | 200–300ms | hover → active、展開收合、顏色變化 |
| **複雜轉場（Complex Transition）** | 300–400ms | 頁面切換、Modal 開關、側欄滑入 |
| **最大上限** | ≤ 500ms | 超過 500ms 使用者會感覺「卡頓」 |

### CSS Token（來自 ui-ux-pro-max primitive-tokens）

```css
:root {
  --duration-75:  75ms;
  --duration-100: 100ms;
  --duration-150: 150ms;   /* 微互動 */
  --duration-200: 200ms;   /* 快速過渡 */
  --duration-300: 300ms;   /* 標準過渡 */
  --duration-500: 500ms;   /* 複雜轉場上限 */
  --duration-700: 700ms;   /* 僅用於載入動畫 */

  /* 語義別名 */
  --duration-fast:   var(--duration-150);
  --duration-normal: var(--duration-200);
  --duration-slow:   var(--duration-300);
}
```

---

## 效能規則：只用 transform / opacity

### 允許動畫的屬性

```css
/* 允許 — GPU 合成層，不觸發 reflow */
transform: translateX() translateY() scale() rotate();
opacity: 0 → 1;
```

### 禁止動畫的屬性

```css
/* 禁止 — 觸發 layout reflow，導致掉幀 */
width: ...;
height: ...;
top: ...;
left: ...;
margin: ...;
padding: ...;
```

### 為什麼
- `transform` 和 `opacity` 的變化在 compositor 執行，不觸發 reflow 也不觸發 repaint
- 動畫 `width` / `height` / `top` / `left` 每幀都需要重新計算整個 layout tree

### Grain / Noise 處理
- 固定噪點濾鏡放在 `::before` / `::after` pseudo-element 上，使用 `position: fixed`
- 不在主要內容層上直接應用噪點 filter（效能代價極高）

---

## 緩動規則（Easing）

| 場景 | 緩動函數 | 說明 |
|-----|---------|------|
| **進場（Enter）** | `ease-out` | 快速進入 → 緩緩到位，自然感 |
| **退場（Exit）** | `ease-in` | 緩緩離開 → 快速消失，乾脆感 |
| **互動回饋** | `ease-out` | 立即反應感 |
| **UI 過渡** | 避免 `linear` | linear 感覺機械，缺乏質感 |
| **退場時間** | 進場的 60–70% | 退場比進場快，感覺更靈敏 |

### CSS 範例

```css
/* 進場 */
.modal-enter {
  animation: slideIn 250ms ease-out;
}

/* 退場 */
.modal-exit {
  animation: slideOut 150ms ease-in;  /* 更短 */
}
```

---

## Spring 物理推薦值

Spring physics 比 cubic-bezier 更自然——有質量感和真實物理反彈。

### 推薦基準值（Motion / Framer Motion）

```javascript
// 標準 spring — 有質感、沉穩
{
  type: "spring",
  stiffness: 100,
  damping: 20
}

// 輕快 spring — 較活潑
{
  type: "spring",
  stiffness: 200,
  damping: 25
}

// 慢速 spring — 大型元素移動
{
  type: "spring",
  stiffness: 60,
  damping: 15
}
```

### 參數說明
- `stiffness`：彈簧硬度，值越大運動越快
- `damping`：阻尼，值越大回彈越少（damping > 2*sqrt(stiffness) = 不回彈）
- `mass`：質量，影響慣性感（預設 1）

### 使用時機
- 互動元素（按鈕、卡片 hover、拖曳）：優先用 spring
- 頁面切換 / 轉場：可用 spring 或 cubic-bezier
- Skeleton loader shimmer：用 linear（循環動畫）

---

## prefers-reduced-motion 處理方式

### 基本原則
**必須尊重使用者的動畫偏好設定。** 這是無障礙（a11y）要求，不是可選項。

### CSS 實作

```css
/* 標準動畫定義 */
.card {
  transition: transform 250ms ease-out, opacity 200ms ease-out;
}

/* 尊重使用者偏好 */
@media (prefers-reduced-motion: reduce) {
  .card {
    transition: opacity 100ms ease-out;  /* 保留淡入，移除位移 */
    /* 或完全移除：transition: none; */
  }
}
```

### JavaScript / Motion 實作

```javascript
import { useReducedMotion } from "motion/react";

function AnimatedCard() {
  const shouldReduceMotion = useReducedMotion();

  return (
    <motion.div
      initial={{ opacity: 0, y: shouldReduceMotion ? 0 : 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={shouldReduceMotion
        ? { duration: 0.1 }
        : { type: "spring", stiffness: 100, damping: 20 }
      }
    />
  );
}
```

### 策略
- **位移動畫**：`prefers-reduced-motion` 時移除 translate，保留 fade
- **循環動畫（Spinner 除外）**：完全停止
- **必要的狀態反饋**（按鈕 press、loading）：可保留，但縮短至 ≤ 100ms
- **Parallax**：一律移除

---

## 其他核心規則

### 堆疊進場（Stagger）
列表 / 卡片群不要同時出現——使用級聯延遲產生瀑布式效果：

```javascript
// Framer Motion 列表 stagger
const container = {
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: {
      staggerChildren: 0.04,  /* 每項延遲 40ms */
    },
  },
};

const item = {
  hidden: { opacity: 0, y: 16 },
  visible: { opacity: 1, y: 0 },
};
```

建議 stagger 間距：30–50ms；超過 100ms 會感覺很慢。

### 持續微互動（Perpetual Micro-interactions）
活躍的 Dashboard 元件應有無限循環狀態：
- **Pulse**：心跳感（資料刷新指示）
- **Shimmer**：Skeleton loader 光掃
- **Float**：輕微浮動（特徵圖示）
- **Typewriter**：打字效果（AI 回應）

### 動畫不可阻塞互動
- 動畫進行中 UI 必須保持可互動
- 使用者的 tap / 點擊必須立即中斷並回應動畫

### Modal / Sheet 動畫
- 從觸發元素的位置縮放 + 淡入（提供空間脈絡）
- 桌機：`scale(0.95) + fade`
- 手機：從底部 slide-in

### 導航方向一致性
- 向前導航：從右側進入
- 向後導航：從左側進入
- 層級更深（子頁面）：從下方進入

---

## React / Next.js 實作注意事項

### Server / Client 元件分離
使用 Motion（Framer Motion）的元件**必須**是 Client Component：

```tsx
// AnimatedCard.tsx
"use client";

import { motion } from "motion/react";

export function AnimatedCard({ children }: { children: React.ReactNode }) {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      {children}
    </motion.div>
  );
}
```

Server Component 只渲染靜態結構，不包含任何動畫邏輯。

### 連續值使用 MotionValue
滑鼠位置、滾動進度等連續值**不可**用 `useState`——改用 `useMotionValue`：

```tsx
"use client";
import { useMotionValue, useTransform, motion } from "motion/react";

export function MagneticButton() {
  const x = useMotionValue(0);
  const rotate = useTransform(x, [-100, 100], [-5, 5]);
  // ...
}
```

`useState` 每次更新會觸發 React re-render，在每秒 60 次的滑鼠事件中會崩潰。
