---
doc_id: OPS-AI-PROMPT-TEMPLATES
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# AI Prompt 範本（可直接貼給 Cursor 執行）

本文件提供四組可直接貼給 Cursor AI 執行的 Prompt 範本，用於專案骨架、範本複製、交付包骨架與治理檢核。

---

## 1. 使用前提

- **本 Repo（e-Consultant_SOP）為 Template Repo（純治理庫）**：僅放置治理規範、標準與範本，**不在此 Repo 內建立或維護專案實際產物**。
- **專案工作應在 Project Repo 執行**：新專案應以本 Repo 為基底 clone 出「專案 Repo」，或於獨立 Repo 中依本 Template 建立目錄與引用；所有 Discovery、Analysis、交付包、程式碼等均在 **Project Repo** 內進行。
- 以下 Prompt 若在 **Template Repo** 執行，僅限於「讀取、產出報告、生成指引」；**建立 projects/、90_delivery_packages/ 等結構時，應在 Project Repo 執行**。

---

## 2. Prompt 範本 A：建立 Project Repo 骨架

### 目的

在 **Project Repo** 根目錄下建立 `projects/<project_key>/` 骨架，包含 Discovery、Analysis、交付包目錄與必要 README，供後續專案產物放置。

### 變數

| 變數 | 說明 | 範例 |
|------|------|------|
| `<project_key>` | 專案代碼或識別，用於目錄名與說明 | `HER_CHYUN`、`CUS2025` |
| `<customer>` | 客戶或專案名稱（可選，用於 README） | 合群報關、某某公司 |

### 安全規則

- **不刪除**既有檔案或目錄。
- **不覆寫**已存在之檔案；若路徑已存在，跳過並於報告中列出。
- **Scope**：僅在當前 Repo 之 `projects/<project_key>/` 下建立目錄與檔案；不在 Template Repo 建立（若偵測為 Template Repo，改為產出「建議在 Project Repo 執行」之指引檔）。

### Prompt 內文（複製貼上後替換變數）

```
請在目前 Repo 的 projects/ 下建立專案骨架：

- 路徑：projects/<project_key>/
- 目錄結構：
  - projects/<project_key>/01_Discovery/   （README.md 說明用途）
  - projects/<project_key>/02_Analysis/
  - projects/<project_key>/90_delivery_packages/   （預留交付包根目錄）
  - projects/<project_key>/README.md   （簡述專案：<customer> / <project_key>）

規則：不刪除、不覆寫既有檔案；若目錄或檔案已存在則跳過。完成後產出「建立結果報告」：列出已建立之路徑、已跳過之路徑、若有錯誤請列出。
```

### 執行後輸出報告格式

```markdown
## Project Repo 骨架建立結果

- **project_key**：<project_key>
- **執行時間**：YYYY-MM-DD
- **已建立**：列出新建目錄與檔案路徑
- **已跳過**：列出已存在而跳過之路徑（若有）
- **錯誤／備註**：若有則列出；若偵測為 Template Repo 則註明「請在 Project Repo 執行」
```

---

## 3. Prompt 範本 B：從 Template Repo 複製 templates 到 Project Repo（copy-in）

### 目的

自 **Template Repo（e-Consultant_SOP）** 的 `templates/prd/`、`templates/delivery/`、`templates/ops/` 選定範本，複製到 **Project Repo** 的指定路徑（例如專案目錄或交付包目錄），供專案填寫使用。執行時應在 **Project Repo** 或已 clone Template 的環境中操作。

### 變數

| 變數 | 說明 | 範例 |
|------|------|------|
| `<project_key>` | 專案代碼，對應 Project Repo 內 projects/<project_key>/ | `HER_CHYUN` |
| `<template_source>` | Template Repo 的 templates 路徑（可為相對或絕對） | `../e-Consultant_SOP/templates` 或本機路徑 |
| `<target_path>` | Project Repo 內目標目錄（複製到此） | `projects/HER_CHYUN/00_templates/` |

### 安全規則

- **不刪除**目標目錄既有檔案。
- **不覆寫**已存在之同名檔案；若目標已有該檔，改為複製為新檔名（如加 `_imported` 後綴）或跳過並列於報告。
- **Scope**：僅執行「複製範本檔到指定路徑」；不修改 Template Repo 內容，不刪除任何來源檔。

### Prompt 內文（複製貼上後替換變數）

```
請將 Template Repo 的範本複製到 Project Repo 指定路徑：

- **來源**：<template_source>/prd、<template_source>/delivery、<template_source>/ops 下之 .md 與 .html（排除 readme.md 若僅需清單）
- **目標**：<target_path>（若不存在請先建立目錄）
- **方式**：複製檔案，保留檔名；可依 prd、delivery、ops 建子目錄於目標下

規則：不刪除、不覆寫目標路徑已存在之檔案；若檔名衝突則跳過或另存新檔名並於報告註明。不修改、不刪除來源 Template Repo。完成後產出「copy-in 結果報告」：來源檔清單、目標路徑、已複製清單、已跳過清單。
```

### 執行後輸出報告格式

```markdown
## Template copy-in 結果報告

- **template_source**：<template_source>
- **target_path**：<target_path>
- **執行時間**：YYYY-MM-DD
- **已複製**：列出「來源檔 → 目標路徑」
- **已跳過**：列出因已存在或錯誤而跳過之項目
- **錯誤／備註**：若有則列出
```

---

## 4. Prompt 範本 C：建立一包交付包骨架

### 目的

在 **Project Repo** 內建立單一交付包目錄骨架 `90_delivery_packages/<package_key>/`，內含標準交付包所需之空白或範本檔（README、PRD 範圍摘要、情境與驗收、子程式清單、欄位對照表等），供後續填寫。

### 變數

| 變數 | 說明 | 範例 |
|------|------|------|
| `<package_key>` | 交付包識別（常為程式代碼或主程式名） | `CUS110_出口作業`、`CUSSYS010` |
| `<project_key>` | 所屬專案代碼（可選） | `HER_CHYUN` |
| `<customer>` | 客戶或專案名稱（可選，用於 README） | 合群報關 |

### 安全規則

- **不刪除**既有檔案或目錄。
- **不覆寫**已存在之檔案；若該路徑已有內容則跳過並列於報告。
- **Scope**：僅在當前 Repo 之 `90_delivery_packages/<package_key>/`（或 `projects/<project_key>/90_delivery_packages/<package_key>/`）下建立；不在 Template Repo 建立實際交付包。

### Prompt 內文（複製貼上後替換變數）

```
請在目前 Repo 建立一包交付包骨架：

- 路徑：90_delivery_packages/<package_key>/   （或 projects/<project_key>/90_delivery_packages/<package_key>/）
- 目錄內含：
  - README.md   （交付包說明、本包範圍、<package_key>、<customer>）
  - PRD_本階段範圍摘要.md   （可為空白範本或自 templates 複製）
  - 情境與驗收說明.md
  - 子程式清單.md
  - 欄位名稱對照表.md
  - 程式代號與權限矩陣.md
  - 工程師開工指引.md   （以上可為空白或自 Template 複製標題結構）

規則：不刪除、不覆寫既有檔案；若已存在則跳過。完成後產出「交付包骨架建立結果」：已建立路徑、已跳過路徑、錯誤／備註。
```

### 執行後輸出報告格式

```markdown
## 交付包骨架建立結果

- **package_key**：<package_key>
- **路徑**：90_delivery_packages/<package_key>/
- **執行時間**：YYYY-MM-DD
- **已建立**：列出新建檔案路徑
- **已跳過**：列出已存在而跳過之路徑
- **錯誤／備註**：若有則列出
```

---

## 5. Prompt 範本 D：執行治理檢核

### 目的

對當前 Repo 執行治理檢核，檢查：目錄結構是否符合 Template／Project 預期、資料夾命名、關鍵檔案 YAML header 是否存在、以及 **Template Repo 是否不應出現 projects/**（若為 Template Repo）。產出檢核報告供人工確認。

### 變數

| 變數 | 說明 | 範例 |
|------|------|------|
| `<repo_type>` | 當前 Repo 類型 | `Template` 或 `Project` |
| `<customer>` | 專案／客戶名稱（Project 時可填） | 合群報關 |

### 安全規則

- **不刪除**任何檔案。
- **不覆寫**任何檔案；檢核僅為「讀取 + 報告」，不自動修正。
- **Scope**：僅掃描目錄與檔案 metadata／檔頭；不改動內容。若為 Template Repo，則檢核「無 projects/ 或 projects/ 僅為 stub／說明」；若為 Project Repo，則檢核必要目錄與命名。

### Prompt 內文（複製貼上後替換變數）

```
請對目前 Repo 執行治理檢核並產出報告（不刪除、不覆寫任何檔案）：

1) **目錄結構符合度**
   - 必要目錄：core/、standards/（prd、delivery、development、security）、templates/（prd、delivery、ops）、ops/（含 ai_prompt_guides）、index/、_archive/
   - 若為 Template Repo：根目錄或一層下**不應**有實際專案資料之 projects/（僅允許 stub 或「已搬移」說明）；若有則列為「待修正」

2) **templates 分類**
   - 是否已分 prd、delivery、ops 子目錄並放置對應範本

3) **standards 分類**
   - 是否已分 prd、delivery、development、security 並放置對應標準

4) **YAML header 檢核**（抽樣）
   - core/、standards/、templates/、ops/ 下 .md 是否具備 doc_id、layer、domain、stability、visibility、owner、status（可抽樣數檔列出來源與結果）

5) **root 疑似專案資料**
   - 根目錄是否仍有應遷至 _archive 或 Project Repo 的專案產物（列出路徑）

6) **_archive**
   - 是否包含舊專案／舊結構歸檔（預期為 OK）

產出格式：markdown 報告，含上述 6 項之「符合／不符合／待辦」與清單。
```

### 執行後輸出報告格式

```markdown
## 治理檢核報告

- **repo_type**：<repo_type>
- **執行時間**：YYYY-MM-DD

### 1. 目錄結構符合度
- 結果：符合 / 部分符合 / 不符合
- 說明與缺少項目（若有）

### 2. templates 分類
- 結果：符合 / 不符合
- 說明

### 3. standards 分類
- 結果：符合 / 不符合 / 待辦
- 說明

### 4. YAML header 檢核（抽樣）
- 抽樣檔案與結果（具備／缺少欄位）

### 5. root 疑似專案資料
- 列出路徑或「無」

### 6. _archive
- 結果：OK / 待補
- 說明
```

---

## 6. 變數一覽

| 變數 | 範本 A | 範本 B | 範本 C | 範本 D |
|------|--------|--------|--------|--------|
| `<project_key>` | ✓ | ✓ | ✓（可選） | — |
| `<package_key>` | — | — | ✓ | — |
| `<customer>` | ✓（可選） | — | ✓（可選） | ✓（可選） |
| `<template_source>` | — | ✓ | — | — |
| `<target_path>` | — | ✓ | — | — |
| `<repo_type>` | — | — | — | ✓ |

---

**使用時請先替換上述變數為實際值，再貼入 Cursor 執行；執行後依各範本之「輸出報告格式」產出結果。**
