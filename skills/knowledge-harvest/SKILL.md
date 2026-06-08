---
name: knowledge-harvest
description: 知識收割執行流程。當使用者說「收割」、「結案」或「專案完成」時由總指揮派工執行。掃描本專案所有 draft sessions，四關卡評估後升級至 assets/。
---

# 知識收割（knowledge-harvest）

## 觸發條件

使用者說「收割」、「知識收割」、「結案」、「專案完成」。

## 執行步驟

1. 詢問目前是哪個專案（若總指揮未指定）
2. 掃描 `~/.claude/team-knowledge/sessions/` 中所有 `project: <此專案>` 且 `status: draft` 的記錄
3. 對每筆記錄逐一跑四關卡
4. 輸出評估結果（哪些通過、哪些封存、原因）
5. 通過的寫入 `~/.claude/assets/<類別>/`
6. 更新 session 的 status（final / archived）
7. 回報總指揮：升級 X 筆 / 封存 Y 筆

## 四關卡

全部「是」才進 assets/：

1. 關卡 1：這個素材在本專案被真實採用（非備選方案）？
2. 關卡 2：使用者確認、設計審查通過、或 QA 視覺確認？
3. 關卡 3：去掉專案品牌後，其他同類型專案也能直接使用？
4. 關卡 4：是具體可用的規格值（色碼、字型名稱、毫秒數），不是原則描述？

## assets/ 寫入格式

```markdown
---
validated_in: <project-name>
validated_date: YYYY-MM-DD
project_type: <project_type>
status: final
confidence: high | medium
---
（具體規格內容）
備註：（為什麼這個值好用，在什麼情境下適用）
```

## project_type 標準分類

必須用以下之一：
`saas-tool` / `ecommerce` / `content-site` / `brand-site` / `dashboard` / `mobile-app` / `marketing-site`
