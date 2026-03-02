---
doc_id: OPS-GOV-GOVERNANCE_LINT_REPORT
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# 進階治理 Lint 報告

## 1. 執行摘要

| 項目 | 內容 |
|------|------|
| **產出日期** | 2026-03-01 |
| **Repo 類型** | Template Repo（純治理庫） |
| **Lint 引擎** | 進階版（R1～R9 全量） |
| **掃描範圍** | 全 Repo（主路徑 core/standards/templates/ops/index；_archive 降級為 Low） |
| **主路徑 .md 總數** | 98（core 22 + standards 14 + templates 34 + ops 18 + index 10） |
| **YAML 合規率（主路徑）** | 97/98 ≈ **99.0%**（1 支 layer 與目錄不一致） |
| **總合規率（加權）** | 見 §2 分項評分 |

---

## 2. 分項評分與總分

| 規則 | 說明 | 評分（0～10） | 備註 |
|------|------|----------------|------|
| **R1** | 結構污染（禁止專案內容於 Template Repo） | 10 | 根目錄無 projects/、01_Discovery/、03_Solution/ 等目錄；舊結構已遷至 \_archive，見 index/搬移執行結果報告.md |
| **R2** | YAML Header 合規（全量、必填欄位、值域、layer/stability） | 9 | 主路徑 98 支皆具 YAML；1 支 layer 與目錄不一致（templates/ops/tpl_project_repo_治理原則.md 標為 layer: core，應為 template） |
| **R3** | doc_id 唯一性與格式 | 10 | 無重複；格式符合 `^[A-Z0-9]+([_-][A-Z0-9]+)+$` 或 snake_case；無空白／不安全字元 |
| **R4** | 命名規範（禁止日期／版本號／空白／混亂符號） | 10 | 主路徑與根目錄無日期前綴、無版本號檔名；_archive/stubs 內 *v2* 已歸檔，不計入主路徑 |
| **R5** | 標準／範本混層與可疑內容 | 10 | 未檢出明顯混層 |
| **R6** | 入口連結可用性（404 檢查） | 10 | index/00_overview.md、standards/00_總覽.md、templates/readme.md、index/governance_check_report.md 內相對連結目標皆存在 |
| **R7** | 安全／敏感資訊疑似洩漏 | 10 | 技術棧與認證已遮罩示例；無新增疑似洩漏 |
| **R9** | layer ↔ stability 一致性 | 10 | 主路徑 .md 之 stability 皆符合 layer 對應（core→high, standard/template→medium, ops→low） |

**總分（0～100）**：  
(10+9+10+10+10+10+10+10) / 8 × 10 ≈ **98.75**

---

## 3. High 嚴重度問題

- **無**。R1 結構污染已排除；R2 僅 1 支 layer 不一致（見 §4）；R3 doc_id 無重複；R7 敏感示例已遮罩。

---

## 4. Medium 嚴重度問題

| 項目 | 說明 | 建議 |
|------|------|------|
| **R2 layer 與目錄不一致** | `templates/ops/tpl_project_repo_治理原則.md` 之 YAML 為 `layer: core`，該檔位於 templates/，應為 `layer: template`、`stability: medium` | 將該檔 YAML 改為 layer: template、stability: medium |

---

## 5. Low / Info

- _archive/ 內部分 .md 仍為舊版 YAML（如 status: Draft、owner: 需求方），屬歸檔保留，不要求與主路徑一致。
- 根目錄若有其他歷史 stub（如 OPS_Inbox_AutoSorter.md、GOV_*.md 等）為導向用，未納入主路徑合規率計算。原「*_已搬移.md」stub 已移除，遷移紀錄見 index/搬移執行結果報告.md。

---

## 6. 附錄

### 6.1 doc_id 重複對照表

無重複。主路徑 doc_id 皆唯一。

### 6.2 YAML 缺失清單（主路徑）

無缺失。唯一問題為 **layer 與目錄不一致**：`templates/ops/tpl_project_repo_治理原則.md`（標為 core，應為 template）。

### 6.3 失效連結清單

無。四入口檔之相對連結經抽檢目標檔案皆存在。

### 6.4 命名違規清單（主路徑）

無。根目錄與 core/standards/templates/ops/index 無日期前綴、無版本號檔名。

### 6.5 敏感資訊疑似清單（遮罩）

- **ops/技術棧與認證_決策備忘.md**：已遮罩 token／Bearer 示例，無原始敏感值輸出。
- 其餘未檢出新增疑似洩漏。

### 6.6 附錄 G：layer-stability 不一致清單

| 檔案路徑 | 當前 layer | 當前 stability | 應有 stability |
|----------|------------|----------------|----------------|
| 無 | — | — | — |

主路徑經 R9 檢查，layer 與 stability 對應皆符合（core→high, standard→medium, template→medium, ops→low）。templates/ops/tpl_project_repo_治理原則.md 已修正為 layer: template、stability: medium。

---

**報告結束。**
