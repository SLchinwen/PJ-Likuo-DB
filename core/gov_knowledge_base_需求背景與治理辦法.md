---
doc_id: CORE-GOV-KB_GOVERNANCE_RATIONALE
layer: core
domain: governance
stability: high
visibility: internal
owner: systemlead
status: active
---

# 知識庫需求背景與治理辦法原則

本文件說明本知識庫（Template Repo / 純治理庫）之**需求背景**、**治理辦法**與**變更驗收原則**，作為未來調整結構、更新規範、擴充模板與演進治理工具時的決策依據。本文件為**辦法**；原則與需求背景見 [知識庫治理原則與需求背景](gov_knowledge_base_治理原則.md)。

---

## 1. 文件用途與適用範圍

### 1.1 用途
- 作為 Template Repo 的「治理憲法」：定義 Repo 定位、分層、命名、Metadata、隔離與變更程序。
- 作為團隊協作基準：避免標準/範本/專案資料混雜，降低重構成本。
- 作為 AI 可讀治理規格：讓 AI 能穩定產出、檢核與修正。

### 1.2 適用範圍
- 本 Repo（Template Repo）之目錄與文件治理規範。
- Project Repo（由本 Repo clone 後）之引用方式與隔離原則（僅定義介面與邊界，不介入專案內容）。

---

## 2. 需求背景（要解決什麼問題）

### 2.1 主要痛點
隨著多專案並行、AI 產出增加，常見問題包括：

- **標準文件分散**：每個專案各自演進，難以回收成公司標準。
- **範本與標準混用**：範本被直接當標準、標準被專案差異污染。
- **命名隨意**：以日期/版本命名導致連結失效、難以長期維護。
- **缺乏 Metadata**：AI 無法穩定路由、檢索與比對。
- **專案資料混入**：Template Repo 被當成專案工作區，造成結構污染與風險外洩。
- **治理不可量化**：缺少自動檢核（Lint）與閉環修正，治理會退化。

### 2.2 本 Repo 的核心定位
> 本 Repo 是「公司級治理母體 + 中央標準 + 可複製範本」  
> **不是**專案工作區、不是客戶交付倉庫、不是程式碼 Repo。

---

## 3. 治理辦法（核心原則）

### 原則 A：Template Repo 與 Project Repo 隔離
- Template Repo **不得**放置專案工作流目錄（如 01_Discovery、02_Analysis、03_Solution、projects/、90_delivery_packages/ 等）。
- 專案資料必須存在於 Project Repo。
- 若需要保留歷史或備份，統一搬移至 `_archive/`，並視需要在原位置留 stub。

**目的**：避免標準被專案差異污染、避免客戶資料外洩、保持可複製性。

---

### 原則 B：分層治理（core / standards / templates / ops / index / _archive）
- **core/**：憲法層（治理原則、協作規範、生命週期總覽、方法論等）。
- **standards/**：中央標準（可被專案引用的標準文件）。
- **templates/**：範本（供複製填寫，不直接當標準）。
- **ops/**：操作手冊與 AI prompt guides。
- **index/**：入口、索引、檢核與報告。
- **_archive/**：歷史與搬移保留區，不參與日常治理。

**目的**：結構先於內容，確保長期可維護與可擴展。

---

### 原則 C：Metadata（YAML Frontmatter）強制
主路徑（非 _archive）之 `.md` 文件必須包含 YAML，至少包含：

- doc_id
- layer
- domain
- stability
- visibility
- owner
- status

對應規則（示例）：
- core → stability: high
- standards/templates → stability: medium
- ops/index → stability: low

**目的**：支援 AI 檢索、Lint 驗證、差異比對與治理演進。

---

### 原則 D：穩定命名，不以檔名承載版本
- Template Repo 內檔名 **禁止**使用日期前綴、版本字樣（v2/v3/1.0）、空白。
- 版本資訊若需呈現，應放在：
  - YAML / 文件內版本紀錄
  - 或由 Git 版本控制追溯

**目的**：避免 rename 造成斷鏈，降低治理成本。

---

### 原則 E：不刪除，優先搬移（Archive Strategy）
- 不直接刪除歷史文件。
- 使用 `_archive/` 作為回收區。
- 必要時保留 stub（單行指向新路徑）。

**目的**：保留演進脈絡，降低「做錯就回不去」的心理阻力。

---

### 原則 F：安全與隔離優先
- Template Repo 不應含客戶專屬資料、PII、API key、token、secret。
- 示範值必須遮罩（例如 `<REDACTED>`、`<TOKEN>`、`<SECRET>`）。

**目的**：降低資安風險與誤發布風險。

---

## 4. Core 文件「對齊修補」治理制度（Alignment Patch Policy）

### 4.1 目的
Core 屬憲法層，內容會長期維護；但歷史文件可能含舊結構（00_Templates、internal_docs、01_Discovery…）。
因此採用「對齊修補」而非重寫，以避免治理哲學偏移。

### 4.2 允許的修補類型（P1～P5）
- **P1**：加入「Template Repo vs Project Repo」註記句（語意分離）
- **P2**：修正舊路徑（00_Templates → templates）
- **P3**：修正 internal_docs 的語意（Template→core / Project→internal_docs）
- **P4**：更新 YAML 範例與命名規則說明，使其不與 Lint 衝突
- **P5**：入口一致（統一指向 index/00_overview.md 與 core/readme_internal_docs.md）

### 4.3 禁止事項
- 禁止整篇重寫、重排方法論章節、改變核心決策原則。
- 禁止把專案目錄描述成 Template Repo 的根目錄結構。

---

## 5. 變更流程與驗收方式（治理閉環）

### 5.1 變更流程
1. 提出變更原因（Why）
2. 指定變更範圍（core / standards / templates / ops / index）
3. 執行治理修正（必要時使用 AI prompt）
4. 產出變更報告（index/…report.md）
5. 再跑治理 Lint（驗證閉環）
6. 若涉及 Core，需跑 Core Alignment Review

### 5.2 驗收標準
- 治理 Lint 分數達到預期門檻（建議 ≥ 96）
- YAML 合規率維持 100%（主路徑）
- 入口連結 0 失效
- 無結構污染（R1=10）
- 無敏感疑似（R7=10）

---

## 6. 長期演進方向（可選）

- 將治理 Lint 納入 CI（例如 GitHub Actions）
- 針對 standards/core 建立版本相容性政策
- 建立 doc_id 索引頁（或 registry）
- 規劃 internal/public 的發布 profile（若未來要對外）

---

## 7. 附錄：角色定義

- **Template Repo**：治理母體/標準/範本庫（本 Repo）
- **Project Repo**：專案工作區（clone 後的實作與交付）
- **_archive**：歷史保留與搬移回收，不參與治理主流程

---