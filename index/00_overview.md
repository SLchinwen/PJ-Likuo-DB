---
doc_id: OPS-GOV-00_OVERVIEW
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# Template Repo 總覽

本 Repo 為 **e-Consultant_SOP** 之 **Template Repo（純治理庫）**，僅放置治理規範與範本，不放置專案實際資料。

---

## 1. 定位

- **用途**：公司級 e 化專案之文件治理、協作標準與範本庫。
- **不包含**：單一專案之 Discovery／Analysis 產物、專案程式碼、客戶專屬規格。專案資料應於各自專案 Repo 或複製本 Template 後之專案目錄中維護。
- **使用方式**：新專案以本 Repo 為基底 **clone** 或 **Use this template**，在複製後的 Repo 內建立專案目錄與產物；**不建議**在此 Repo 直接建立 `projects/` 或專案工作區。

---

## 2. 目錄用途

| 目錄 | 用途 |
|------|------|
| **core/** | 憲法層：治理母體、公司專案標準規範、生命週期總覽、程式編碼原則、AI 產出與新舊專案指引等。全 Repo 最高位階。 |
| **standards/** | 公司標準：可被各專案引用的中央標準，依領域分 prd、delivery、development、security。 |
| **templates/** | 範本：產出 PRD、交付包、營運文件時填寫的範本，依類型分 prd、delivery、ops。 |
| **ops/** | 工具／流程指引：發布、歸檔、提交、合併、檢查清單、環境建議等；AI 執行手冊置於 `ops/ai_prompt_guides/`。 |
| **index/** | 入口與檢核：本總覽、中央標準索引連結、治理檢核報告、搬移結果等。 |
| **_archive/** | 歸檔：舊結構、搬移備份、歷史規劃產物、已遷出之專案工作區與重複檔。僅供查閱，不參與日常治理。 |

---

## 3. 新專案啟動方式

1. **Clone 或 Use template**：自本 Repo 建立新 Repo（或複製整份目錄）。
2. **不在此 Repo 建 projects**：專案之 Discovery／Analysis／Solution、雛型、交付包等，應在**新專案 Repo** 中建立與維護。
3. **引用 core 與 standards**：在新專案 Repo 中，以「連結/引用」為主（建議在 `projects/<project_key>/_meta/` 或交付包 README 記錄引用來源）；若因交付需求必須複製，務必保留來源路徑或 doc_id 與同步策略。
4. **使用 templates**：自 `templates/prd/`、`templates/delivery/`、`templates/ops/` 複製範本到新專案 Repo，更名並填寫內容。
5. **參考 ops**：發布、版控、Inbox 歸檔等流程依 `ops/` 與 `ops/ai_prompt_guides/` 指引操作。

---

## 4. 主要入口連結（相對路徑）

### 憲法入口（建議閱讀順序）

**治理憲法** = 本 Repo 最高位階之原則與辦法，AI 與人員欲理解治理時請依下列順序載入，以減少重複與 context 消耗：

1. **先讀** [知識庫治理原則與需求背景](../core/gov_knowledge_base_治理原則.md)（原則層：需求背景、八項治理設計原則、變更治理原則）。
2. **再讀** [知識庫需求背景與治理辦法](../core/gov_knowledge_base_需求背景與治理辦法.md)（辦法層：痛點、核心原則、對齊修補政策、變更流程與驗收）。
3. **並列** [e 化專案治理總則（母體）](../core/gov_e化專案治理總則.md)：母體實務總則，統合文件規範、目錄與工作流、命名、OPS；與憲法並列，**若有衝突以憲法兩份為準**。

---

### 4.1 核心文件（core）

| 文件 | 路徑 |
|------|------|
| **知識庫治理原則**（憲法・原則） | [core/gov_knowledge_base_治理原則.md](../core/gov_knowledge_base_治理原則.md) |
| **知識庫需求背景與治理辦法**（憲法・辦法） | [core/gov_knowledge_base_需求背景與治理辦法.md](../core/gov_knowledge_base_需求背景與治理辦法.md) |
| 內部文件總覽 | [core/readme_internal_docs.md](../core/readme_internal_docs.md) |
| 內部文件分類索引 | [core/index_internal_docs.md](../core/index_internal_docs.md) |
| 公司專案標準規範 | [core/公司專案標準規範_需求與開發協作.md](../core/公司專案標準規範_需求與開發協作.md) |
| 生命週期與流程總覽 | [core/需求到交付包_生命週期與流程總覽.md](../core/需求到交付包_生命週期與流程總覽.md) |
| 新專案參考辦法 | [core/新專案參考使用辦法_整合ai開發.md](../core/新專案參考使用辦法_整合ai開發.md) |

---

### 4.2 標準索引（standards）

| 文件 | 路徑 |
|------|------|
| 中央標準總覽 | [standards/00_總覽.md](../standards/00_總覽.md) |

---

### 4.3 範本總覽（templates）

| 文件 | 路徑 |
|------|------|
| 範本一覽 | [templates/readme.md](../templates/readme.md) |

---

### 4.4 操作與 AI 指引（ops）

| 文件 | 路徑 |
|------|------|
| Prompt 範本總覽 | [ops/ai_prompt_guides/prompt_templates.md](../ops/ai_prompt_guides/prompt_templates.md) |
| AI 發布指引 | [ops/ai_prompt_guides/ops_publish_to_web.md](../ops/ai_prompt_guides/ops_publish_to_web.md) |
| Inbox 自動歸檔指引 | [ops/ai_prompt_guides/ops_inbox_autosorter.md](../ops/ai_prompt_guides/ops_inbox_autosorter.md) |

---

### 4.5 本 index

| 文件 | 路徑 |
|------|------|
| 本總覽 | [index/00_overview.md](00_overview.md) |
| **doc_id 索引** | [index/doc_id_index.md](doc_id_index.md) |
| 治理檢核報告 | [index/governance_check_report.md](governance_check_report.md) |
| Ops 重複檔比對摘要 | [index/ops_重複檔比對摘要.md](ops_重複檔比對摘要.md) |

---

> 本入口頁為 Template Repo 導航樞紐，新增標準或範本時，請同步更新此區。
