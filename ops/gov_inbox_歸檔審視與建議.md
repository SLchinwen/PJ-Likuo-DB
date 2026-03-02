---
doc_id: ops_governance_inbox_archive_review
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
title: "_Inbox 歸檔審視與建議（範本方式）"
type: Spec
tags: [治理, 歸檔, 範本, Inbox, 審視]
version: 1.0
last_updated: 2025-02-09
---

# _Inbox 歸檔審視與建議（範本方式）

本文件依 **GOV_e化專案治理總則** 之文件治理標準與歸類邏輯，對 `_Inbox/` 內現有檔案進行審視，並以**範本方式**（YAML 檔頭、版本紀錄、命名規範、目錄歸屬）提出歸檔建議，供執行歸檔或複製至新專案時依循。

---

## 1. 審視標準說明

| 項目 | 依據 |
| :--- | :--- |
| **YAML Frontmatter** | 須含 title, type, status, tags, version, owner, last_updated（見治理總則 §1.2） |
| **版本紀錄** | 文件最下方須有「版本紀錄」表格（見治理總則 §1.3） |
| **歸屬目錄** | 依內容性質：01_Discovery / 02_Analysis / 03_Solution / 00_Templates / 00_Governance / 99_Archives（見 §2） |
| **檔名** | 一般產物：`YYYYMMDD_類型_關鍵字.md`；範本與治理可保留 `Tpl_*`、`GOV_*`、`OPS_*` 前綴 |

### 1.1 建議新增之目錄：internal_docs（倉庫根目錄）

**用途**：集中存放**規範、標準、辦法、Runbook**（非客戶訪談/分析/規格書），與 `00_Templates`（範本）區隔，便於新專案複製整包治理與營運手冊。

- **internal_docs/**（與 `docs/` 同層）：公司專案標準規範、協作與治理、文件治理、程式編碼原則、新專案辦法、提交/發布步驟、解除卡關步驟等。**勿放在 docs 下**，以免 MkDocs 建置時將對內文件開放出去。

---

## 2. _Inbox 各檔審視與歸檔建議

### 2.1 規範與標準類（建議 → 00_Governance）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| 公司專案標準規範_需求與開發協作.md | ✅ 已有 YAML；建議補版本紀錄 | **internal_docs/**（倉庫根目錄） | 公司專案標準規範_需求與開發協作.md 或 20260209_規範_需求與開發協作.md | 公司級標準，可保留現名便辨識 |
| 協作與治理規範.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** | 協作與治理規範.md 或 20260209_規範_協作與治理.md | 補 YAML（type: Spec）、版本紀錄 |
| docs_治理規範.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** | docs_治理規範.md 或 20260209_規範_文件治理.md | 補 YAML、版本紀錄；與 OPS_Publish_To_Web 互參 |
| 程式編碼原則_共用規範.md | ✅ 已有 YAML；建議補版本紀錄 | **internal_docs/** | 程式編碼原則_共用規範.md | 跨專案共用 |
| coding_standard_program_codes.md | ✅ 已有 YAML；建議補版本紀錄 | **internal_docs/** | coding_standard_program_codes.md 或 程式編碼原則_專案對應.md | 專案對應範例，可與共用規範同目錄 |
| 新專案參考使用辦法_整合AI開發.md | ✅ 已有 YAML；建議補版本紀錄 | **internal_docs/** | 新專案參考使用辦法_整合AI開發.md | 新專案立項時複製用 |

### 2.2 範本類（建議 → 00_Templates）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| Tpl_Client_Profile.md | ✅ 已有 YAML；建議補版本紀錄 | 00_Templates | Tpl_Client_Profile.md | 與現有 Tpl_Discovery_Note 並存 |
| Tpl_Discovery_Note.md | 需比對 00_Templates 內同名檔 | 00_Templates | Tpl_Discovery_Note.md | 若 _Inbox 版較新可覆蓋或合併後更新 00_Templates |
| Tpl_Solution_Spec.md | 需比對 00_Templates 內同名檔 | 00_Templates | Tpl_Solution_Spec.md | 同上 |
| Tpl_PRD_功能作業.md | ✅ 已有 YAML；建議補版本紀錄 | 00_Templates | Tpl_PRD_功能作業.md | 功能作業 PRD 範本，四項必備對齊 |
| Tpl_模組欄位名稱對照表.md | 需檢查是否有 YAML、版本紀錄 | 00_Templates | Tpl_模組欄位名稱對照表.md | 欄位中英文對照範本 |
| Tpl_權限矩陣表.md | 需檢查是否有 YAML、版本紀錄 | 00_Templates | Tpl_權限矩陣表.md | 程式×角色權限矩陣範本 |

### 2.3 營運／操作手冊類（建議 → 00_Governance 或倉庫根目錄 OPS_*）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| 提交變更步驟.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** 或根目錄 | OPS_提交變更步驟.md 或 提交變更步驟.md | 補 YAML（type: Spec）、版本紀錄；與分支/PR 流程有關 |
| 更新對外文件與發布.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** 或根目錄 | 可與現有 OPS_Publish_To_Web.md 對照，擇一或合併 | 內容與 OPS_Publish_To_Web 重疊，建議合併為單一 OPS |
| 修正_合併到main的步驟.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** 或 99_Archives | OPS_合併分支至main.md 或 99_Archives（專案一次性） | 屬特定情境修復步驟，可保留為 OPS 或歸檔 |
| UNSTUCK_STEPS.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** 或根目錄 | OPS_解除分支卡關步驟.md | 補 YAML、版本紀錄；通用 Runbook |

### 2.4 分析／評估類（建議 → 02_Analysis）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| 專案評估_e化專案進行與工程分工.md | ✅ 已有 YAML；建議補版本紀錄 | 02_Analysis | 20260209_分析_專案評估與工程分工.md | 評估與建議，屬分析產物 |

### 2.5 撰寫指引／How-to（建議 → 00_Governance）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| 如何要求文件優化.md | ❌ 無 YAML、無版本紀錄 | **internal_docs/** | 如何要求文件優化.md 或 撰寫指引_文件優化.md | 補 YAML、版本紀錄；與協作者/AI 溝通用 |

### 2.6 時效性／專案特定（建議 → 99_Archives 或 00_Governance）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| GitHub_檢查清單.md | ❌ 無 YAML；內容為當時狀態 | 99_Archives | 20260209_檢查清單_GitHub與本機狀態.md | 時效性高，執行完可歸檔 |
| 接下來要做的事.md | ❌ 無 YAML；任務清單 | 99_Archives | 20260209_待辦_合併與清理.md | 完成後歸檔 |

### 2.7 索引與說明（建議 → 合併或取代現有）

| 現檔名 | 審視（YAML / 版本紀錄） | 建議歸屬 | 建議新檔名 | 備註 |
| :--- | :--- | :--- | :--- | :--- |
| index.md | ❌ 無 YAML；內容為「開發團隊文件」一覽 | **internal_docs/** | 可改寫為 internal_docs/README.md（對內文件索引） | 對內文件一覽，置於倉庫根目錄 internal_docs |
| README.md | ✅ 有 YAML、版本紀錄；內容為範本庫索引 | 00_Templates | 00_Templates/README.md | **取代**現有 00_Templates/README.md，或合併兩者內容為完整範本索引 |

---

## 3. 目錄結構建議（歸檔後）

歸檔執行後，建議結構如下（可依是否採用 00_Governance 調整）：

```
e-Consultant_SOP/
├── .cursorrules
├── GOV_e化專案治理總則.md
├── GOV_Inbox_歸檔審視與建議.md          ← 本文件
├── OPS_Inbox_AutoSorter.md
├── OPS_Publish_To_Web.md
├── 00_Templates/
│   ├── README.md                         ← 範本庫索引（可來自 _Inbox/README.md 合併）
│   ├── Tpl_Discovery_Note.md
│   ├── Tpl_Solution_Spec.md
│   ├── Tpl_Client_Profile.md
│   ├── Tpl_PRD_功能作業.md
│   ├── Tpl_模組欄位名稱對照表.md
│   └── Tpl_權限矩陣表.md
├── internal_docs/                       ← 對內文件（與 docs 同層，不納入 MkDocs，避免權限外洩）
│   ├── README.md                        ← 對內文件一覽（可來自 _Inbox/index.md 改寫）
│   ├── 公司專案標準規範_需求與開發協作.md
│   ├── 協作與治理規範.md
│   ├── docs_治理規範.md
│   ├── 程式編碼原則_共用規範.md
│   ├── coding_standard_program_codes.md
│   ├── 新專案參考使用辦法_整合AI開發.md
│   ├── 提交變更步驟.md
│   ├── 更新對外文件與發布.md 或 與 OPS_Publish_To_Web 合併
│   ├── UNSTUCK_STEPS.md → OPS_解除分支卡關步驟.md
│   └── 如何要求文件優化.md
├── docs/                                ← 僅對外；MkDocs 建置來源，勿放對內文件
├── 01_Discovery/                        ← 建立空目錄或依專案放入訪談等
├── 02_Analysis/
│   └── 20260209_分析_專案評估與工程分工.md
├── 03_Solution/
├── 99_Archives/
│   ├── 20260209_檢查清單_GitHub與本機狀態.md
│   └── 20260209_待辦_合併與清理.md
└── _Inbox/                              ← 清空後保留目錄
```

---

## 4. 範本方式檢查清單（執行歸檔時）

對每個要移出 _Inbox 的檔案，建議依序確認：

- [ ] **YAML Frontmatter**：補齊 title, type, status, tags, version, owner, last_updated。
- [ ] **版本紀錄**：若為新歸檔或首次標準化，於文末加上「版本紀錄」表格，初始一筆 v1.0。
- [ ] **type 對應**：Discovery / Analysis / Spec / Archive 與內容一致；範本可用 type: Spec 或自訂 Tpl。
- [ ] **檔名**：若採日期命名則用 `YYYYMMDD_類型_關鍵字.md`；範本與治理可保留 `Tpl_*`、`GOV_*`、`OPS_*`。
- [ ] **內部連結**：移動後若有相對路徑（如 `](公司專案標準規範_需求與開發協作.md)`），請改為新路徑（如 `](00_Governance/公司專案標準規範_需求與開發協作.md)` 或相對新位置）。

---

## 5. 建議執行順序

1. **建立目錄**：新增 `00_Governance`、`01_Discovery`、`02_Analysis`、`03_Solution`、`99_Archives`（若尚未存在）。
2. **規範與範本**：先處理 00_Governance 與 00_Templates 之檔案，補 YAML 與版本紀錄後移動。
3. **分析與歸檔**：再處理 02_Analysis、99_Archives，必要時重新命名。
4. **索引更新**：將 _Inbox 的 README（範本庫索引）合併至 `00_Templates/README.md`；將 index（開發團隊文件一覽）改寫為 `00_Governance/README.md` 或目錄說明。
5. **連結修正**：全文搜尋 `internal_docs/`、舊檔名，改為新路徑。
6. **清空 _Inbox**：確認無遺漏後刪除 _Inbox 內已搬離之檔案（或依 OPS_Inbox_AutoSorter 產出腳本執行）。

---

## 版本紀錄

| 版本 | 日期 | 修改者 | 修改內容 |
| :--- | :--- | :--- | :--- |
| v1.0 | 2025-02-09 | 專案負責人 | 初始版本：依治理總則範本方式審視 _Inbox，產出歸檔建議與目錄結構。 |
