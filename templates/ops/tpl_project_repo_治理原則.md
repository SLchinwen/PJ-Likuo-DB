---
doc_id: TPL-OPS-PROJECT_REPO_GOVERNANCE
layer: template
domain: governance
stability: medium
visibility: internal
owner: systemlead
status: active
---

# Project Repo 治理原則

本文件定義「Project Repo（專案倉庫）」之治理結構與操作原則。

本文件適用於：
- 由 Template Repo clone 後建立之專案 Repo
- 既有專案導入治理改造時

---

# 一、Project Repo 的定位

## 1.1 與 Template Repo 的差異

| Template Repo | Project Repo |
|---------------|-------------|
| 公司治理母體 | 單一專案執行倉庫 |
| 放標準與範本 | 放專案產物與交付 |
| 不含專案資料 | 包含客戶需求與交付包 |
| 不使用日期命名 | 可使用日期命名（若必要） |

---

## 1.2 Project Repo 的角色

Project Repo 是：

> 單一專案之需求、分析、交付、雛型與技術實作的工作區。

它的目標是：

- 支援專案協同設計
- 支援交付包產出
- 支援驗收與版本對照
- 支援後續維護

---

# 二、標準目錄結構（建議）

```plaintext
projects/<project_key>/
│
├─ 01_Discovery/
├─ 02_Analysis/
├─ 03_Solution/
├─ 90_delivery_packages/
├─ internal_docs/
└─ README.md
```

---

# 三、最低治理要求（必遵）

專案 Repo 欲與公司治理一致、或需被審計／合規檢核時，須滿足下列**最低要求**：

| 項目 | 要求 |
|------|------|
| **結構隔離** | 專案產物置於 `projects/<project_key>/` 或約定工作區內；若為自 Template Repo clone 之 Repo，**根目錄不得**出現 `projects/`、`01_Discovery/`、`03_Solution/`、`90_delivery_packages/` 等與 Template 主路徑混淆之目錄（應在專案子目錄內建立）。 |
| **文件識別** | 重要 .md（PRD、交付包說明、治理相關）**建議**具 YAML 必填欄位：`doc_id`、`layer`、`domain`、`stability`、`visibility`、`owner`、`status`；格式見 Template Repo [治理總則](../../core/gov_e化專案治理總則.md) §1.2。 |
| **引用優於複製** | 能引用 Template Repo 之 core／standards 時以連結或 doc_id 引用，避免整份複製導致版本分岔。 |
| **PRD 模組化** | 專案 PRD 依 [PRD 拆分與交付單元規則](../../standards/prd/prd_拆分與交付單元規則.md) 採最小可交付單元（一主程式＋子程式）撰寫，以利 AI 與審核載入。 |
| **變更可追溯** | 重大治理或規格變更保留版本紀錄或 commit 說明，以利稽核。 |

未達上述最低要求時，專案產物可能無法通過公司治理 Lint 或交付檢核；導入時請以 Template Repo 之 [index/00_overview](../../index/00_overview.md) 與本文件為起點對齊。
