---
doc_id: core_delivery_ai_output_guideline
layer: core
domain: delivery
stability: high
visibility: internal
owner: systemlead
status: active
title: "AI｜產出交付文件指引"
type: Guide
tags: [AI, 交付包, 產出指引]
version: 1.0
last_updated: 2026-02-23
---

# AI｜產出交付文件指引

本文件供 **AI 參考**，當需求方要求產出「交付開發包」或相關交付文件時，依下列步驟與範本產出。人類產出時亦可依此指引操作。

---

## 1. 產出前確認

在產出交付開發包前，請確認：

| 檢查項 | 說明 |
| :--- | :--- |
| **交付門檻** | PRD 已確認、雛型（有 UI）或批次規格（無 UI）已定稿 |
| **本階段範圍** | 已明確本階段要開發之程式代號、功能、欄位 |
| **範本路徑** | 本 Template Repo：`templates/`、`standards/`；專案 Repo：00_Templates/、internal_docs/standards/ |

---

## 2. 產出交付開發包之步驟

### Step 1：建立目錄結構

依 [交付包結構範本](standards/交付包結構範本.md) 建立：

- **有 UI**：01_規格、02_雛型（含 prototype/）、03_附錄
- **無 UI**：01_規格（含批次規格/）、02_附錄

### Step 2：產出 README.md

- 範本：本 Template Repo `templates/tpl_交付開發包_readme.md`；專案 Repo：00_Templates/Tpl_交付開發包_README.md
- 填寫：專案名稱、本階段範圍、交付版次、對應 Tag／commit、**依賴清單**（§3）、**技術棧／認證**（§4）、目錄結構、使用指引

### Step 3：產出 .cursorrules

- 範本：本 Template Repo `standards/cursorrules_範本.md`；專案 Repo：internal_docs/standards/cursorrules_範本.md
- 合併：公司標準精華 + 本專案程式代號、欄位、雛型／批次規格路徑

### Step 4：產出 01_規格 內檔案

| 檔案 | 範本 | 萃取來源 |
| :--- | :--- | :--- |
| PRD_本階段範圍摘要.md | Tpl_PRD_本階段範圍摘要 | 完整 PRD、需求變更；僅本階段 |
| 程式代號與權限矩陣.md | Tpl_程式代號與權限矩陣_交付用 | 程式代號架構、權限矩陣；僅本階段；子程式、批次、API／TABLE 命名依 [程式編碼原則](程式編碼原則_共用規範.md) §4～§5 |
| 欄位名稱對照表.md | Tpl_欄位名稱對照表_交付用 | 模組欄位對照表；僅本階段；**含必填、格式／長度、錯誤情境**（若 PRD 或雛型有） |
| 情境與驗收說明.md | Tpl_情境與驗收說明_交付用 | PRD 情境、**錯誤／邊界情境**（選）、驗收條件範本；驗收條件**含 S、D 類型** |
| 開發要求與資安清單.md | Tpl_開發要求與資安清單 | standards/資安要求清單 |
| **子程式清單.md** | Tpl_子程式清單_交付用 | 雛型檢視、操作步驟說明、PRD；依 [子程式清單與實作建議｜治理規範](standards/子程式清單與實作建議_治理規範.md) **必備** |

### Step 4.5：子程式清單與欄位對照表檢查與產出（有 UI 交付包必備）

產出交付包時，**必須**完成下列檢查與產出（依 [需求釐清與交付包｜治理規範](standards/需求釐清與交付包_治理規範.md)）：

| 檢查項 | 情境 | AI 行為 |
| :--- | :--- | :--- |
| **子程式清單** | 已存在 | 確認置於 `01_規格/子程式清單.md`；README、使用指引、.cursorrules 已引用 |
| **子程式清單** | 不存在 | **自動產出**：依雛型、操作步驟、PRD 產出並納入交付包 |
| **欄位名稱對照表** | 已存在 | 確認置於 `01_規格/欄位名稱對照表.md` |
| **欄位名稱對照表** | 不存在 | **自動產出**：依雛型、PRD、操作步驟產出並納入交付包 |
| **人工產出時** | — | 產出其他檔案後**提醒**：交付包須含子程式清單與欄位對照表；可要求 AI 代為產出 |

### Step 4.6：依賴與介面摘要（有依賴時）

若本程式**依賴**他程式／API／TABLE（見 README 依賴清單），須擇一產出：

- **03_附錄/依賴介面摘要.md**：列出依賴之名稱、路徑／Endpoint、必填參數、回傳要點；或
- 於 README §3 依賴清單之「取得方式或連結」欄填寫他程式之 `API_規範.md` 或交付包路徑，供工程師取得介面定義。

### Step 5：產出 03_附錄/工程師開工指引.md

依 [工程師開工指引｜治理規範](standards/工程師開工指引_治理規範.md) 產出 `03_附錄/工程師開工指引.md`，含：

- **建議進行步驟**：讀規格→環境準備→產 schema/API→依子程式實作→驗收
- **AI Prompt 建議**：產 schema、產 API、依子程式實作、驗收檢核
- **建議環境**：Azure SQL、App Service、Application Insights；依 [Azure環境建議](../Azure環境建議.md)
- **準備事項**：交付包、Azure 存取、依賴程式

範本：本 Template Repo `templates/tpl_工程師開工指引.md`；專案 Repo：00_Templates/Tpl_工程師開工指引.md（含**交付包接收者自檢**清單）

### Step 6：產出 02_雛型 或 02_批次規格

| 類型 | 產出內容 |
| :--- | :--- |
| **有 UI** | 複製定稿雛型至 02_雛型/prototype/；產出或複製操作步驟說明 |
| **無 UI** | 依 Tpl_批次規格 產出每支批次之規格檔於 01_規格/批次規格/ |

### Step 6.5：產出 schema_參考與 API_規範（有 UI 時建議必備）

有 UI 之交付包，建議產出 `03_附錄/schema_參考.md`、`03_附錄/API_規範.md`（本程式範圍），依 [TABLE與API設計_AI產出指引](standards/TABLE與API設計_AI產出指引.md)。依據：欄位對照表、子程式清單、程式代號與權限矩陣。利於 AI 與工程師開工即對齊 TABLE/API，減少自行推論歧異。

### Step 7：產出驗收條件

- 格式：見 [驗收條件範本](standards/驗收條件範本.md)
- 每條含：**ID**、**類型**（F/P/S/D/B）、**描述**、**檢核方式**、**對應規格**；採結構化表格利於 AI 與人工檢核
- 撰寫原則：可檢核、避免模糊用語；關鍵情境建議對應「操作步驟＋預期結果」

---

## 3. 產出需求變更單之步驟

當客戶回饋或需求變更時：

1. 使用範本：本 Template Repo `templates/tpl_需求變更單.md`；專案 Repo：00_Templates/Tpl_需求變更單.md
2. 填寫：變更資訊、變更原文、對應變更規格、影響範圍、實作注意事項
3. 放置：`02_Analysis/YYYY-MM-DD_需求變更_模組名.md`
4. 若為小範圍變更：產出「變更補充包」（需求變更單 + 受影響規格 + 更新雛型）

---

## 4. 產出批次規格之步驟

當專案含無 UI 批次程式時：

1. 使用範本：本 Template Repo `templates/tpl_批次規格.md`；專案 Repo：00_Templates/Tpl_批次規格.md
2. 每支批次一檔，檔名：`<程式代號>_<簡述>.md`
3. 必備章節：觸發條件、輸入、處理邏輯、輸出、錯誤處理、驗收條件
4. 放置：交付包內 `01_規格/批次規格/`

---

## 5. 產出驗收條件之步驟

1. 使用範本：本 Template Repo `templates/tpl_驗收條件.md` 或 tpl_情境與驗收說明_交付用.md；專案 Repo：00_Templates/
2. 類型：F（功能）、P（權限）、S（資安）、D（資料）、B（批次）
3. 每條可獨立判斷通過／不通過
4. 檢核方式標註：操作測試、程式檢視、輸出檢查、自動化

---

## 6. 範本與標準路徑速查

| 用途 | 路徑（本 Template Repo → 專案 Repo 複製後） |
| :--- | :--- |
| 交付包結構 | standards/交付包結構範本.md → internal_docs/standards/ |
| 子程式清單治理規範 | standards/子程式清單與實作建議_治理規範.md → internal_docs/standards/ |
| **交付包 README** | templates/tpl_交付開發包_readme.md → 00_Templates/ |
| **PRD 本階段範圍摘要** | templates/tpl_prd_本階段範圍摘要.md → 00_Templates/ |
| **情境與驗收說明** | templates/tpl_情境與驗收說明_交付用.md → 00_Templates/ |
| **子程式清單** | templates/tpl_子程式清單_交付用.md → 00_Templates/ |
| **工程師開工指引** | templates/tpl_工程師開工指引.md → 00_Templates/ |
| **欄位名稱對照表** | templates/tpl_欄位名稱對照表_交付用.md → 00_Templates/ |
| **程式代號與權限矩陣** | templates/tpl_程式代號與權限矩陣_交付用.md → 00_Templates/ |
| **開發要求與資安清單** | templates/tpl_開發要求與資安清單.md → 00_Templates/ |
| 工程師開工指引治理規範 | standards/工程師開工指引_治理規範.md → internal_docs/standards/ |
| 驗收條件格式 | standards/驗收條件範本.md → internal_docs/standards/ |
| 批次規格格式 | standards/批次規格範本.md → internal_docs/standards/ |
| cursorrules | standards/cursorrules_範本.md → internal_docs/standards/ |
| 需求變更單 | templates/tpl_需求變更單.md → 00_Templates/ |
| 批次規格 | templates/tpl_批次規格.md → 00_Templates/ |

---

## 7. 相關文件

| 文件 | 說明 |
| :--- | :--- |
| [協同開發｜文件治理流程](協同開發_文件治理流程.md) | 完整流程、各階段產出、迭代、驗收 |
| [PRD 拆分與交付單元規則](standards/PRD_拆分與交付單元規則.md) | 主程式架構先建立、PRD 分開交付、交付單元邊界 |
| [AI｜Prompt 主程式與 PRD 拆分](AI_Prompt_主程式與PRD拆分.md) | 產出主程式架構、分開 PRD 之 Prompt 範例 |
| [子程式清單與實作建議｜治理規範](standards/子程式清單與實作建議_治理規範.md) | 產出交付包時子程式清單檢查與自動產出 |
| [子程式實作建議｜標準](standards/子程式實作建議_標準.md) | AI 實作時依子程式展開工作包之指引 |
| [中央標準｜總覽](standards/00_總覽.md) | 中央標準索引與引用方式 |

---

## 8. 版本紀錄

| 版本 | 日期 | 修改者 | 修改內容 |
| :--- | :--- | :--- | :--- |
| v1.0 | 2026-02-23 | AI | 建立 AI 產出交付文件指引 |
| v1.1 | 2026-02-23 | AI | 新增 Step 6.5 schema_參考與 API_規範（有 UI 建議必備）；Step 7 驗收條件強調結構化表格；依實作足夠性檢視建議 |
| v1.2 | 2026-02-23 | AI | Step 2 依賴與技術棧；Step 4 欄位錯誤情境、驗收 S/D；Step 4.6 依賴介面摘要；§6 範本路徑表補齊；依補足建議與版本對照 |
