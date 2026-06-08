# Typography Pairings

來源：taste-skill（外部引入，Phase 1）

## SaaS / 開發工具

- Display/Heading: Geist 700 / Satoshi 700
- Body: Geist 400 / Outfit 400
- Mono: Geist Mono / JetBrains Mono

配對邏輯：Geist 是 Vercel 官方字體，定位精準；Satoshi 帶有現代幾何感。
Mono 選用 JetBrains Mono 作主力，可讀性與開發工具場景吻合。

## 高端 / 精品

- Display: Cabinet Grotesk 800
- Body: Cabinet Grotesk 400
- Mono: IBM Plex Mono

配對邏輯：Cabinet Grotesk 單字族即可撐起整個版面層級，避免使用制式精品 Serif（參見禁用規則）。
IBM Plex Mono 承接 IBM 系的精確感，適合標價、規格標籤。

## 編輯 / 內容

- Display: Outfit 700 / Plus Jakarta Sans 700
- Body: Plus Jakarta Sans 400
- Mono: JetBrains Mono

配對邏輯：Plus Jakarta Sans 對繁體中文/越南文友善，中英混排可讀性佳。
Outfit 字距較寬，作大標題有空間感。

## 開發者 / 工具文件

- Display: Space Grotesk 700
- Body: IBM Plex Sans 400
- Mono: JetBrains Mono 400 / Fira Code 400

配對邏輯：來源 ui-ux-pro-max typography.csv 第 9 組（Developer Mono）。
IBM Plex 同族 Sans + Mono 視覺一致性高，Space Grotesk 提供獨特字符差異化。

## 品牌 / 代理商 / 創意

- Display: Syne 700
- Body: Manrope 400
- Mono: Space Mono

配對邏輯：來源 ui-ux-pro-max typography.csv 第 18 組（Fashion Forward）。
Syne 字頭鮮明獨特，不落俗套；Manrope 可讀性強。

## 政府 / 醫療 / 無障礙優先

- Display: Lexend 600
- Body: Source Sans 3 400 / Atkinson Hyperlegible 400
- Mono: —（不需要）

配對邏輯：來源 ui-ux-pro-max typography.csv 第 16 組（Corporate Trust）+ 第 48 組（Accessibility First）。
Atkinson Hyperlegible 是專為低視能設計的字體，WCAG AAA 情境下強烈推薦。

---

## 禁用字體（任何情況不得使用）

以下字體因過度濫用、視覺辨識度低，或是 LLM 預設輸出而列入黑名單：

| 字體 | 禁用原因 |
|------|---------|
| **Inter** | 極度氾濫，除非 Brief 明確要求 neutral/Linear-style |
| **Roboto** | Android 系統字，缺乏品牌識別度 |
| **Arial** | 系統備用字，不應主動選用 |
| **Open Sans** | 過時的「安全牌」選擇 |
| **Helvetica** | 沒有授權即無法保證一致性 |
| **Times New Roman** | 系統備用 Serif，不代表精品 |
| **Georgia** | 同上 |
| **Fraunces** | LLM 最常見的 Display Serif 預設，一眼辨出 AI 輸出 |
| **Instrument Serif** | 同上 |

> 原則：Serif 非常不推薦作為預設字體。「創意/精品 = Serif」的直覺是 AI Tell。
> Serif 只在品牌 Brief 明確指名，或確實是 editorial / luxury / heritage 情境時才使用。

---

## 技術實作規則（取自 taste-skill Section 3.A + 4.1）

- 使用 `next/font` 或 `@font-face + font-display: swap` 自行 host。
- 生產環境**禁止** `<link>` Google Fonts；僅開發/原型階段可用。
- Display 標題預設：`text-4xl md:text-6xl tracking-tighter leading-none`。
- Body 預設：`text-base text-gray-600 leading-relaxed max-w-[65ch]`。
- Italic 含下伸字（y g j p q）時，最小 `leading-[1.1]` + `pb-1`，防止裁切。
- 一個專案只用一個字族系統，不混用（例如不在 Fluent 項目混入 shadcn 字族）。
