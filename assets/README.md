# 自有素材庫（assets/）

> 這裡是跑過真實專案後打磨出的自有素材。
> 透過「收割」指令由 knowledge-harvest skill 寫入，不可手動添加未經驗證的素材。

## 寫入條件（四關卡）

1. 實際被採用（非備選方案）
2. 使用者確認或 QA 視覺通過
3. 去掉品牌後同類專案也能用
4. 是具體規格值，非原則描述

## 目前狀態

Phase 1（當前）：從 references/ 引入外部素材作為參考
Phase 2（3-5 個專案後）：assets/ 積累足夠後，優先讀取這裡

## 標準 frontmatter

```yaml
---
validated_in: project-name
validated_date: YYYY-MM-DD
project_type: saas-tool  # 標準分類之一
status: final
confidence: high
---
```
