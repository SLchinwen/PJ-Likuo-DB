# Template Repo（純治理庫）— 重構規劃報告

**產出日期**：2026-03-01  
**角色**：企業文件治理架構師  
**目標**：將本 Repo 調整為「Template Repo（純治理庫）」結構。  
**安全規則**：不刪除、不覆寫、不搬移；僅產出規劃報告。

---

## 一、目標結構（Target）

```
e-Consultant_SOP/
├── core/
├── standards/
│   ├── prd/
│   ├── delivery/
│   ├── development/
│   └── security/
├── templates/
│   ├── prd/
│   ├── delivery/
│   └── ops/
├── ops/
│   └── ai_prompt_guides/
├── index/
├── _archive/
└── README.md
```

---

## 二、目前 Repo 掃描摘要

### 2.1 現有頂層目錄與檔案

| 路徑 | 類型 | 說明 |
|------|------|------|
| **core/** | 目錄 | 已存在（v2 搬移後）；憲法層與治理總則 |
| **standards/** | 目錄 | 已存在；含 prd、delivery、development、security |
| **templates/** | 目錄 | 已存在；目前為扁平，無 prd/delivery/ops 子目錄 |
| **ops/** | 目錄 | 已存在；目前為扁平，無 ai_prompt_guides 子目錄 |
| **projects/** | 目錄 | 舊專案工作區（01_Discovery、02_Analysis、_Inbox、docs）— **舊專案痕跡** |
| **internal_docs/** | 目錄 | 舊結構；與 core/ 重複內容 — **可歸 _archive** |
| **00_Templates/** | 目錄 | 舊範本目錄；與 templates/ 重複 — **可歸 _archive** |
| **docs/** | 目錄 | 對外網站源（專案用）— **舊專案痕跡** |
| **_migration_backup/** | 目錄 | 搬移備份 — **建議歸 _archive** |
| **01_Discovery/** | 目錄 | 專案 Discovery 工作區 — **舊專案痕跡** |
| **02_Analysis/** | 目錄 | 專案 Analysis 工作區 — **舊專案痕跡** |
| **_Inbox/** | 目錄 | 專案 Inbox — **舊專案痕跡** |
| **.github/** | 目錄 | CI/CD 工作流 |
| **GOV_e化專案治理總則.md** | 檔案 | 根目錄重複（已有 core 版） |
| **GOV_Inbox_歸檔審視與建議.md** | 檔案 | 根目錄重複（已有 ops 版） |
| **OPS_Publish_To_Web.md** | 檔案 | 根目錄重複（已有 ops 版） |
| **OPS_Inbox_AutoSorter.md** | 檔案 | 根目錄重複（已有 ops 版） |
| **.cursorrules** | 檔案 | 根目錄（另有 core/.cursorrules） |
| **mkdocs.yml** | 檔案 | 建站組態（專案用） |
| **README.md** | 檔案 | 根目錄總覽（若有） |
| **重構對照表_分層治理架構v2.md** | 檔案 | 規劃產物 |
| **重構執行報告_分層治理架構v2.md** | 檔案 | 規劃產物 |
| **YAML_header_變更清單.md** | 檔案 | 規劃產物 |

### 2.2 分類原則（本報告採用）

| layer | 定義 | 典型內容 |
|-------|------|----------|
| **core** | 憲法層：治理母體、公司級總則、全 Repo 入口 | GOV 總則、公司專案標準規範、生命週期、.cursorrules |
| **standard** | 公司標準：可被專案引用的中央標準 | standards/ 下 prd、delivery、development、security |
| **template** | 範本：產出文件時填寫的範本檔 | Tpl_*、各類交付用範本 |
| **ops** | 工具／流程指引：日常營運、發布、版控、AI 執行手冊 | OPS_*、提交/合併步驟、GitHub 檢查、AI runbook |
| **uncertain** | 無法單從路徑判斷，或具雙重性質 | 專案特定規格、混合用途文件 |

---

## 三、重構搬移對照表

以下以「單一來源」為原則：若同一內容已存在於 **core / standards / templates / ops**（v2 結構）與 **internal_docs / 00_Templates / 根目錄**，建議以 **已在新結構者** 為準，舊路徑建議歸 **index/**（入口說明）或 **_archive/**，不重複搬移。

### 3.1 core 層（維持現狀，僅建議入口集中）

| 原路徑 | 建議新路徑 | layer | domain | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|--------|----------|----------------|
| core/*（全部 .md 與 .cursorrules） | 維持 core/ | core | 見 YAML_header_變更清單 | 已是憲法層，無需搬移 | 否 |
| internal_docs/README.md | — | core | governance | 與 core/readme_internal_docs.md 重複；建議保留 core 版，internal_docs 整目錄歸 _archive | 是（確認後再歸檔） |
| internal_docs/index.md | — | core | governance | 與 core/index_internal_docs.md 重複 | 是 |
| internal_docs/公司專案標準規範_需求與開發協作.md | — | core | governance | 與 core 版重複 | 是 |
| internal_docs/協作與治理規範.md | — | core | governance | 與 core 版重複 | 是 |
| internal_docs/docs_治理規範.md | — | core | governance | 與 core 版重複 | 是 |
| internal_docs/需求到交付包_*.md、程式編碼原則_*.md、雛型產出規範*.md、AI*.md、開發團隊*.md、如何要求*.md、新專案*.md、舊專案*.md、單支程式*.md、交付開發包補足*.md | — | core | 各 domain | 均與 core/ 內檔案重複；建議整目錄歸 _archive，不重複搬移 | 是 |
| GOV_e化專案治理總則.md（根目錄） | — | core | governance | 與 core/gov_e化專案治理總則.md 重複；建議刪除或歸 _archive（本報告不執行） | 是 |
| .cursorrules（根目錄） | core/.cursorrules 或維持根目錄 | core | — | 倉庫級 AI 準則；可保留根目錄一份供 GitHub 使用，core 為治理庫內副本 | 是 |

### 3.2 standards 層（維持現狀，無需搬移）

| 原路徑 | 建議新路徑 | layer | domain | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|--------|----------|----------------|
| standards/00_總覽.md | standards/00_總覽.md | standard | governance | 維持 | 否 |
| standards/prd/*.md | standards/prd/ | standard | prd | 維持 | 否 |
| standards/delivery/*.md | standards/delivery/ | standard | delivery | 維持 | 否 |
| standards/development/*.md | standards/development/ | standard | api/development | 維持 | 否 |
| standards/security/*.md | standards/security/ | standard | security | 維持 | 否 |
| internal_docs/standards/*（全部） | — | standard | 各 domain | 與 standards/ 重複；隨 internal_docs 歸 _archive | 是 |

### 3.3 templates 層（建議依 domain 分子目錄）

| 原路徑 | 建議新路徑 | layer | domain | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|--------|----------|----------------|
| templates/readme.md | templates/readme.md 或 index/templates_index.md | template | governance | 範本總覽；可維持或改為 index 入口 | 是 |
| templates/tpl_solution_spec.md | templates/prd/tpl_solution_spec.md | template | prd | 屬 PRD 範本 | 否 |
| templates/tpl_需求變更單.md | templates/prd/tpl_需求變更單.md | template | prd | 屬 PRD／需求範本 | 否 |
| templates/tpl_驗收條件.md | templates/prd/tpl_驗收條件.md | template | prd | 屬 PRD／驗收範本 | 否 |
| templates/tpl_discovery_note.md | templates/prd/tpl_discovery_note.md | template | prd | 屬 PRD／Discovery 範本 | 否 |
| templates/tpl_rfp_系統全貌.md | templates/prd/tpl_rfp_系統全貌.md | template | prd | 屬 PRD／RFP 範本 | 否 |
| templates/tpl_prd_本階段範圍摘要.md | templates/prd/tpl_prd_本階段範圍摘要.md | template | prd | 屬 PRD 範本 | 否 |
| templates/tpl_工程師開工指引.md | templates/delivery/tpl_工程師開工指引.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_欄位名稱對照表_交付用.md | templates/delivery/tpl_欄位名稱對照表_交付用.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_子程式清單_交付用.md | templates/delivery/tpl_子程式清單_交付用.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_情境與驗收說明_交付用.md | templates/delivery/tpl_情境與驗收說明_交付用.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_程式代號與權限矩陣_交付用.md | templates/delivery/tpl_程式代號與權限矩陣_交付用.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_交付開發包_readme.md | templates/delivery/tpl_交付開發包_readme.md | template | delivery | 屬交付包範本 | 否 |
| templates/tpl_開發要求與資安清單.md | templates/ops/tpl_開發要求與資安清單.md | template | ops/security | 屬營運／資安清單範本 | 否 |
| templates/tpl_gov_公司e化標準治理.md | templates/ops/tpl_gov_公司e化標準治理.md | template | ops/governance | 屬治理範本（專案複製用） | 否 |
| templates/tpl_客戶與專案背景.md | templates/ops/tpl_客戶與專案背景.md | template | ops | 屬專案啟動／背景範本 | 否 |
| templates/tpl_批次規格.md | templates/prd/tpl_批次規格.md 或 templates/ops/tpl_批次規格.md | template | prd/api | 批次規格範本；可歸 prd 或 ops | 是 |
| templates/tpl_prototype_html.html | templates/ops/tpl_prototype_html.html 或維持 templates/ | template | ops | 雛型 HTML 範本 | 否 |
| 00_Templates/*（全部） | — | template | 各 domain | 與 templates/ 重複；建議整目錄歸 _archive，不重複搬移 | 是 |

### 3.4 ops 層（建議新增 ai_prompt_guides 子目錄）

| 原路徑 | 建議新路徑 | layer | domain | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|--------|----------|----------------|
| ops/ops_publish_to_web.md | ops/ai_prompt_guides/ops_publish_to_web.md | ops | governance | AI 網站發布執行手冊，屬 AI prompt 指引 | 否 |
| ops/ops_inbox_autosorter.md | ops/ai_prompt_guides/ops_inbox_autosorter.md | ops | governance | AI 自動歸檔執行手冊，屬 AI prompt 指引 | 否 |
| ops/協同開發_文件治理流程.md | ops/協同開發_文件治理流程.md 或 ops/ai_prompt_guides/ | ops | governance | 交付包產出流程；可視為 AI/人工共用指引 | 是 |
| ops/更新對外文件與發布.md | ops/更新對外文件與發布.md | ops | governance | 維持 | 否 |
| ops/提交變更步驟.md | ops/提交變更步驟.md | ops | governance | 維持 | 否 |
| ops/修正_合併到_main_的步驟.md | ops/修正_合併到_main_的步驟.md | ops | governance | 維持 | 否 |
| ops/unstuck_steps.md | ops/unstuck_steps.md | ops | governance | 維持 | 否 |
| ops/github_檢查清單.md | ops/github_檢查清單.md | ops | governance | 維持 | 否 |
| ops/交付前檢查與待補清單.md | ops/交付前檢查與待補清單.md | ops | governance | 維持 | 否 |
| ops/gov_inbox_歸檔審視與建議.md | ops/gov_inbox_歸檔審視與建議.md | ops | governance | 維持 | 否 |
| ops/技術棧與認證_決策備忘.md | ops/技術棧與認證_決策備忘.md | ops | governance | 維持 | 否 |
| ops/azure環境建議.md | ops/azure環境建議.md | ops | governance | 維持 | 否 |
| ops/workflows/publish.yml | ops/workflows/publish.yml | ops | — | 維持或改為 .github 唯一 | 是 |
| ops/mkdocs.yml | ops/mkdocs.yml 或根目錄 | ops | — | 建站組態 | 是 |
| OPS_Publish_To_Web.md（根目錄） | — | ops | governance | 與 ops 版重複；建議歸 _archive | 是 |
| OPS_Inbox_AutoSorter.md（根目錄） | — | ops | governance | 與 ops 版重複 | 是 |
| GOV_Inbox_歸檔審視與建議.md（根目錄） | — | ops | governance | 與 ops 版重複 | 是 |

### 3.5 index/（新建，入口與總覽）

| 原路徑 | 建議新路徑 | layer | domain | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|--------|----------|----------------|
| core/readme_internal_docs.md | index/readme_governance.md 或維持 core 並在 index 做連結 | core/index | governance | 治理庫總覽入口；可複製或連結 | 是 |
| core/index_internal_docs.md | index/index_docs.md 或維持 core 並在 index 做連結 | core/index | governance | 詳細一覽；可複製或連結 | 是 |
| （新建） | index/README.md | index | — | 說明本 Repo 為 Template Repo、各層用途、連結 core/standards/templates/ops | 否 |

### 3.6 _archive/（建議歸檔，不刪除）

| 原路徑 | 建議新路徑 | layer | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|----------|----------------|
| _migration_backup/（整個目錄） | _archive/migration_backup/ | — | 搬移備份，純治理庫不再需要 | 是 |
| internal_docs/（整個目錄） | _archive/internal_docs/ | — | 與 core/、standards/ 重複；舊結構 | 是 |
| 00_Templates/（整個目錄） | _archive/00_Templates/ | — | 與 templates/ 重複；舊結構 | 是 |
| GOV_e化專案治理總則.md（根） | _archive/GOV_e化專案治理總則.md | — | 與 core 版重複 | 是 |
| OPS_Publish_To_Web.md（根） | _archive/OPS_Publish_To_Web.md | — | 與 ops 版重複 | 是 |
| OPS_Inbox_AutoSorter.md（根） | _archive/OPS_Inbox_AutoSorter.md | — | 與 ops 版重複 | 是 |
| GOV_Inbox_歸檔審視與建議.md（根） | _archive/GOV_Inbox_歸檔審視與建議.md | — | 與 ops 版重複 | 是 |
| 重構對照表_分層治理架構v2.md | _archive/重構對照表_分層治理架構v2.md | — | 歷史規劃產物 | 是 |
| 重構執行報告_分層治理架構v2.md | _archive/重構執行報告_分層治理架構v2.md | — | 歷史規劃產物 | 是 |
| YAML_header_變更清單.md | _archive/YAML_header_變更清單.md 或保留根目錄 | — | 可歸檔或保留供查 | 是 |

### 3.7 舊專案痕跡（建議歸 _archive 或移除於純治理庫）

| 原路徑 | 建議新路徑 | layer | 搬移原因 | 是否需人工確認 |
|--------|------------|-------|----------|----------------|
| projects/（整個目錄） | _archive/projects/ | uncertain | 專案工作區與專案特定產物，非治理庫本體 | 是 |
| 01_Discovery/ | _archive/01_Discovery/ | uncertain | 專案 Discovery 工作區 | 是 |
| 02_Analysis/ | _archive/02_Analysis/ | uncertain | 專案 Analysis 工作區 | 是 |
| _Inbox/ | _archive/_Inbox/ | uncertain | 專案 Inbox | 是 |
| docs/ | _archive/docs/ | uncertain | 對外網站源（專案用） | 是 |
| projects/司機與廠商主檔_規格.md | _archive/projects/司機與廠商主檔_規格.md | uncertain | 專案特定規格 | 是 |
| projects/專案評估_e化專案進行與工程分工.md | _archive/projects/專案評估_e化專案進行與工程分工.md | uncertain | 專案紀錄範例 | 是 |
| projects/接下來要做的事.md | _archive/projects/接下來要做的事.md | uncertain | 專案待辦 | 是 |
| projects/coding_standard_program_codes.md | _archive/projects/coding_standard_program_codes.md | uncertain | 本專案（報關）程式代號，非通用治理 | 是 |
| projects/docs/* | _archive/projects/docs/ | uncertain | 專案對外網站 | 是 |
| projects/01_Discovery/readme.md 等 | _archive/projects/... | uncertain | 專案工作區說明 | 是 |

### 3.8 uncertain（需人工判斷）

| 原路徑 | 建議新路徑 | layer | 說明 | 是否需人工確認 |
|--------|------------|-------|------|----------------|
| .github/workflows/publish.yml | 維持或 ops/workflows/ | ops | CI/CD；若 Repo 僅作 Template 可簡化或移除 | 是 |
| mkdocs.yml（根目錄） | 維持或 ops/ 或 _archive | — | 專案建站用；純治理庫可能不需 | 是 |
| README.md（根目錄） | 根目錄 README.md | — | 改寫為 Template Repo 說明、連結 index/ 與各層 | 是 |

---

## 四、舊專案痕跡與 _archive 標示彙總

### 4.1 存在舊專案痕跡

| 類型 | 路徑 | 說明 |
|------|------|------|
| 專案工作區 | 01_Discovery/、02_Analysis/、_Inbox/ | 合群報關等專案之 Discovery／Analysis／Inbox |
| 專案目錄 | projects/ | 內含 01_Discovery、02_Analysis、_Inbox、docs、司機與廠商主檔規格、專案評估、接下來要做的事、coding_standard_program_codes |
| 對外網站源 | docs/ | 專案對外 MkDocs 網站來源 |
| 專案特定規格 | 司機與廠商主檔_規格.md、專案評估_e化專案進行與工程分工.md、coding_standard_program_codes.md | 單一專案內容，非通用治理 |
| 專案待辦 | 接下來要做的事.md | 專案級待辦 |

以上在「純治理庫」定位下建議遷至 **_archive/** 或從主結構移除（本報告不執行刪除）。

### 4.2 建議歸入 _archive 的目錄／檔案

| 項目 | 說明 |
|------|------|
| **_migration_backup/** | 搬移備份，不再參與日常治理結構 |
| **internal_docs/** | 舊內部文件結構，內容已由 core/、standards/ 涵蓋 |
| **00_Templates/** | 舊範本目錄，內容已由 templates/ 涵蓋 |
| **projects/**、**01_Discovery/**、**02_Analysis/**、**_Inbox/**、**docs/** | 專案工作區與網站源，非治理庫本體 |
| **根目錄重複檔** | GOV_e化專案治理總則.md、GOV_Inbox_歸檔審視與建議.md、OPS_Publish_To_Web.md、OPS_Inbox_AutoSorter.md（與 core/、ops/ 重複） |
| **歷史規劃產物** | 重構對照表_分層治理架構v2.md、重構執行報告_分層治理架構v2.md、YAML_header_變更清單.md（可選歸檔或保留） |

---

## 五、執行建議（僅供後續參考，本次不執行）

1. **建立目標目錄**：`templates/prd/`、`templates/delivery/`、`templates/ops/`、`ops/ai_prompt_guides/`、`index/`、`_archive/`。
2. **templates 分子目錄**：依上表將 `templates/*.md` 與 `tpl_prototype_html.html` 搬至 `templates/prd/`、`templates/delivery/`、`templates/ops/`（不刪除、不覆寫；可複製後再決定是否刪舊）。
3. **ops/ai_prompt_guides**：將 `ops_publish_to_web.md`、`ops_inbox_autosorter.md` 搬入（或複製）至 `ops/ai_prompt_guides/`。
4. **index/**：新建 `index/README.md`，必要時自 core 複製或連結總覽／一覽。
5. **_archive/**：將 `_migration_backup/`、`internal_docs/`、`00_Templates/`、根目錄重複檔、專案痕跡目錄與檔案遷入 _archive（建議先複製再移，且不刪除原檔直到確認）。
6. **根目錄 README.md**：改寫為 Template Repo 說明，並指向 core/、standards/、templates/、ops/、index/。
7. **人工確認**：所有標記「是否需人工確認＝是」的項目，需由負責人決定後再執行搬移或歸檔。

---

## 六、對照表欄位說明

- **原路徑**：目前 Repo 內路徑。  
- **建議新路徑**：目標結構下建議位置；「—」表示建議歸檔或不再重複搬移。  
- **layer**：core / standard / template / ops / uncertain。  
- **domain**：prd / api / delivery / security / governance 等。  
- **搬移原因**：為何建議該路徑或歸檔。  
- **是否需人工確認**：是／否；「是」表示建議由負責人決策後再執行。

---

**報告結束。未刪除、未覆寫、未搬移任何檔案。**
