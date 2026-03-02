---
doc_id: OPS-GOV-GOVERNANCE_LINT_FIX_PROMPT
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

你現在是「Template Repo 治理修正引擎」。

安全規則（必須遵守）：
- 不刪除任何檔案
- 不搬移任何檔案
- 只允許修改 .md 檔案
- 不修改 _archive/** 內任何檔案（除非下列任務明確要求）
- 只修正 High/Medium，Low/Info 只列建議
- 每個變更都要可追溯（輸出變更清單與理由）

依據：
- index/governance_lint_report.md（最新一份）

目標：
僅進行三類修正：
A) 補 YAML header
B) 修正失效連結（relative link）
C) 修正命名違規（以「安全 rename + stub」方式）

---

## 任務 A：補 YAML header（High/Medium）

範圍：
- core/**
- standards/**
- templates/**
- ops/**
- index/**

規則：
1) 若檔案缺 YAML frontmatter，則在檔案最上方新增
2) 若已有 YAML，則只補缺欄位，不改既有欄位值（除非值域錯誤）
3) Template Repo 預設：
   - visibility: internal
   - owner: systemlead
   - status: active
4) layer/stability 對應：
   - core → high
   - standard → medium
   - template → medium
   - ops → low

欄位格式（最小集合）：
---
doc_id: <依檔名與路徑生成，需穩定且唯一，禁止空白>
layer: core|standard|template|ops
domain: prd|delivery|development|security|governance|ops|general  （選最貼近）
stability: high|medium|low
visibility: internal
owner: systemlead
status: active
---

doc_id 生成規則（需一致）：
- 使用「大寫短碼」：<LAYER>-<DOMAIN>-<KEY>
- KEY 以檔名去副檔名後轉大寫，非英數改成底線，連續底線壓成一個
例：standards/prd/需求釐清與交付包_治理規範.md → STD-PRD-需求釐清與交付包_治理規範（若含中文可保留，但不得含空白；空白改為底線）

輸出：
- YAML 修正清單（檔案、動作：新增/補欄位、doc_id）

---

## 任務 B：修正失效連結（Medium）

僅修正以下入口文件中的失效連結：
- index/00_overview.md
- standards/00_總覽.md
- templates/readme.md
- index/governance_check_report.md

規則：
1) 只修正目標檔案「確實存在」的新路徑
2) 不改連結文字（除非連結文字完全錯誤）
3) 只改相對路徑

輸出：
- 失效連結修正清單（來源檔、原連結→新連結、原因）

---

## 任務 C：修正命名違規（Medium）

僅處理以下命名違規（從 lint 報告抓）：
- 檔名以 YYYYMMDD_ 開頭
- 檔名包含 _v2 / -v3 / v1.0 等版本字樣
- 檔名包含空白

安全 rename 規則（必須遵守）：
1) 只對 .md 檔案改名
2) 改名後必須在原路徑建立 stub 檔案（單行）：
   「此文件已更名並移至：<新路徑>」
3) 不修改檔案內文
4) 若有同名衝突，在檔名後加 _1、_2（不得加日期）

新檔名規則：
- 不含日期、不含版本
- 以語意化命名（snake_case 或保留原中文但去空白）
- 不改資料夾層級（不搬移）

輸出：
- rename 清單（原路徑→新路徑、stub 建立路徑）

---

## 交付：修正報告

請新增一份報告：
- index/governance_lint_fix_report.md

包含：
1) 修正摘要（A/B/C 做了什麼）
2) 變更清單（表格）
3) 未修正項目（Low/Info 或低信心）
4) 建議：修正後請再跑一次治理 Lint 驗證

開始執行。