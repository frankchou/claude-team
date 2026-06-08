---
name: knowledge-capture
description: 知識沉澱規範。ui-designer、ux-designer、art-designer、brand-designer、motion-designer、interaction-designer、content-strategist、fullstack-engineer 完工後必須執行。將本次任務的設計決策記錄為 draft session。
---

# 知識沉澱規範（knowledge-capture）

## 觸發時機

凡載入此 skill 的 agent，完工流程最後一步必須執行知識寫入。

## 重要原則

Sprint 中只寫 sessions/（draft），**絕不碰 assets/**。assets/ 只在「收割」指令時才寫入。

## session 檔名格式

`~/.claude/team-knowledge/sessions/YYYY-MM-DD_<project-name>_<agent-role>.md`

## session 內容格式

```markdown
---
project: <專案名稱>
agent: <agent 角色>
date: YYYY-MM-DD
project_type: saas-tool | ecommerce | content-site | brand-site | dashboard | mobile-app | marketing-site
status: draft
---

## 本次任務摘要
（做了什麼）

## 關鍵設計決策
（選擇 A 而非 B 的原因）

## 使用的素材
（字型、色值、動畫規格等具體值）

## 遇到的問題與解法
（踩坑記錄）

## 對下一個 agent 的提示
（接手這個專案需要知道什麼）
```

## 說明

session 包含所有決策，包含後來被推翻的，都是寶貴記錄。不判斷好壞，直接記錄。
