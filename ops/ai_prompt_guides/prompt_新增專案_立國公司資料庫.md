---
doc_id: OPS-AI-PROMPT-NEW_PROJECT_LIKUO_DB
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# 新增專案：立國公司專案資料庫 — 步驟與 Prompt

本文件提供「立國公司專案（資料庫）」之 **Project Repo 命名建議**、**操作步驟** 與 **可直接貼給 Cursor 執行的 Prompt**。

---

## 1. 建議命名

| 項目 | 建議 | 說明 |
|------|------|------|
| **Project Repo 名稱（GitHub 倉庫名）** | `eConsultant-Likuo-DB` 或 `Likuo-Company-Database` | 簡短、可讀、含客戶與類型；若組織有統一前綴可用 `eConsultant-Likuo-DB` |
| **project_key（目錄與文件用）** | `LIKUO_DB` | 用於 `projects/LIKUO_DB/`、交付包、PRD 引用；全大寫＋底線，與既有範例（如 HER_CHYUN）一致 |
| **客戶／專案顯示名稱** | 立國公司專案資料庫 | README、文件標題用 |

---

## 2. 操作步驟（依序執行）

### 步驟 1：建立專案 Repo（二擇一）

- **A. GitHub「Use this template」**  
  1. 在本 Template Repo（e-Consultant_SOP）頁面點 **Use this template** → **Create a new repository**  
  2. 倉庫名稱填：`eConsultant-Likuo-DB`（或你選的名稱）  
  3. 建立後 **Clone 到本機**

- **B. 手動複製**  
  1. 將 e-Consultant_SOP 整份複製到新資料夾，資料夾名即為新 Repo 名稱（如 `eConsultant-Likuo-DB`）  
  2. 若要用 Git：在該資料夾 `git init`，並在 GitHub 建立新倉庫後 `git remote add origin <新倉庫 URL>`

### 步驟 2：在「專案 Repo」根目錄開啟 Cursor

- 請在 **新 Clone 的專案 Repo**（例如 `eConsultant-Likuo-DB`）根目錄開啟 Cursor，**不要**在 Template Repo（e-Consultant_SOP）執行建立 projects/ 的指令。

### 步驟 3：執行「建立專案骨架」Prompt

- 在專案 Repo 的 Cursor 對話中貼上下方 **§3 的 Prompt**，直接送出。  
- AI 會在 `projects/LIKUO_DB/` 下建立 01_Discovery、02_Analysis、90_delivery_packages 與 README。

### 步驟 4（可選）：複製範本到專案

- 若要把 Template 的 PRD／交付範本複製到專案內，可在同一專案 Repo 再執行 **§4 的 copy-in Prompt**（需依本機路徑調整 `<template_source>`）。

---

## 3. Prompt：建立專案骨架（直接貼上執行）

**請在「專案 Repo」根目錄執行，變數已代入立國公司／LIKUO_DB。**

```
請在目前 Repo 的 projects/ 下建立專案骨架：

- 路徑：projects/LIKUO_DB/
- 目錄結構：
  - projects/LIKUO_DB/01_Discovery/   （README.md 說明用途）
  - projects/LIKUO_DB/02_Analysis/
  - projects/LIKUO_DB/90_delivery_packages/   （預留交付包根目錄）
  - projects/LIKUO_DB/README.md   （簡述專案：立國公司專案資料庫 / LIKUO_DB）

規則：不刪除、不覆寫既有檔案；若目錄或檔案已存在則跳過。完成後產出「建立結果報告」：列出已建立之路徑、已跳過之路徑、若有錯誤請列出。
```

---

## 4. Prompt（可選）：複製 Template 範本到專案

在**專案 Repo** 執行；請將 `<template_source>` 改為你本機 Template Repo 的路徑（例如 `../e-Consultant_SOP` 或絕對路徑）。

```
請將 Template Repo 的範本複製到 Project Repo 指定路徑：

- **來源**：<template_source>/templates 下之 prd、delivery、ops 子目錄內 .md 與 .html（可排除 readme.md）
- **目標**：projects/LIKUO_DB/00_templates/（若不存在請先建立目錄）
- **方式**：複製檔案，保留檔名；可依 prd、delivery、ops 建子目錄於目標下

規則：不刪除、不覆寫目標路徑已存在之檔案；若檔名衝突則跳過或另存新檔名並於報告註明。不修改、不刪除來源 Template Repo。完成後產出「copy-in 結果報告」：來源檔清單、目標路徑、已複製清單、已跳過清單。
```

---

## 5. 參考

- 完整四組 Prompt（A～D）：[ops/ai_prompt_guides/prompt_templates.md](prompt_templates.md)
- 新專案啟動與目錄說明：[index/00_overview.md](../../index/00_overview.md) §3
- Project Repo 治理與最低要求：[templates/ops/tpl_project_repo_治理原則.md](../../templates/ops/tpl_project_repo_治理原則.md)
