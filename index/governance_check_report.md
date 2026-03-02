---
doc_id: OPS-GOV-GOVERNANCE_CHECK_REPORT
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# 治理檢核報告

**產出日期**：2026-03-01  
**角色**：Template Repo 治理修正員  
**範圍**：Phase 3 重構後之目錄結構、分類與入口檢核。

---

## 1. 目錄結構符合度

### 1.1 必要資料夾檢查

| 必要資料夾 | 是否存在 | 備註 |
|------------|----------|------|
| core/ | 是 | 憲法層文件已就位 |
| standards/ | 是 | 含子目錄 prd、delivery、development、security |
| standards/prd/ | 是 | 有 prd_拆分與交付單元規則、驗收條件範本 |
| standards/delivery/ | 是 | 有交付包結構、子程式清單、工程師開工、需求釐清等 |
| standards/development/ | 是 | 有雛型命名、TABLE/API、cursorrules、批次規格、開發順序建議 |
| standards/security/ | 是 | 有資安要求清單 |
| templates/ | 是 | 含子目錄 prd、delivery、ops |
| templates/prd/ | 是 | PRD／需求／RFP 範本 |
| templates/delivery/ | 是 | 交付包與驗收相關範本（含 tpl_驗收條件、tpl_批次規格，已自 prd 修正移入） |
| templates/ops/ | 是 | 營運／治理／背景範本與雛型 HTML |
| ops/ | 是 | 流程與檢查清單、環境建議等 |
| ops/ai_prompt_guides/ | 是 | AI 網站發布、Inbox 自動歸檔執行手冊 |
| index/ | 是 | 總覽、檢核報告、搬移結果等 |
| _archive/ | 是 | 舊結構、備份、專案痕跡歸檔 |

**結論**：目錄結構符合 Template Repo 目標，必要資料夾均已存在。

---

## 2. templates 是否分 prd / delivery / ops

| 子目錄 | 狀態 | 說明 |
|--------|------|------|
| templates/prd/ | 符合 | tpl_solution_spec、tpl_需求變更單、tpl_discovery_note、tpl_rfp_系統全貌、tpl_prd_本階段範圍摘要 |
| templates/delivery/ | 符合 | tpl_驗收條件、tpl_批次規格、tpl_工程師開工指引、tpl_欄位對照表、tpl_子程式清單、tpl_情境與驗收說明、tpl_程式代號與權限矩陣、tpl_交付開發包_readme（驗收條件與批次規格已自 prd 修正移入） |
| templates/ops/ | 符合 | tpl_開發要求與資安清單、tpl_gov_公司e化標準治理、tpl_客戶與專案背景、tpl_prototype_html.html |

**結論**：templates 已正確區分 prd、delivery、ops；Phase 3 修正已將「驗收條件」「批次規格」自 prd 移至 delivery。

---

## 3. standards 是否分 prd / delivery / development / security

| 子目錄 | 狀態 | 說明 |
|--------|------|------|
| standards/prd/ | 符合 | prd_拆分與交付單元規則、驗收條件範本 |
| standards/delivery/ | 符合 | 需求釐清與交付包、交付包結構、子程式清單與實作建議、工程師開工指引 |
| standards/development/ | 符合 | 雛型標題命名、子程式實作建議、TABLE與API設計、cursorrules_範本、批次規格範本、開發順序建議 |
| standards/security/ | 符合 | 資安要求清單 |

**結論**：standards 已依 prd、delivery、development、security 分類，**無待辦搬移**；標準文件已在正確子目錄。

---

## 4. root 是否仍有疑似專案資料

| 項目 | 類型 | 說明 |
|------|------|------|
| *_已搬移.md（多個） | 搬移 stub | 如 01_Discovery_已搬移.md、docs_已搬移.md 等，為遷出說明，非專案資料。 |
| GOV_*.md、OPS_*.md、重構*.md、YAML_header*.md | stub | 原檔已移至 _archive，根目錄為「此文件已搬移至：_archive/...」之 stub。 |
| Template_Repo_重構規劃報告.md | 規劃文件 | 治理規劃產物，可保留或擇期歸 _archive。 |
| .cursorrules、mkdocs.yml、README.md（若有） | 組態／總覽 | 非專案內容，屬 Repo 級設定與說明。 |

**結論**：root 未見疑似專案資料；僅有搬移 stub、規劃報告與 Repo 組態，**無需再遷出**。

---

## 5. _archive 是否包含舊專案資料

| 項目 | 狀態 |
|------|------|
| _archive/ 內含 migration_backup、internal_docs、00_Templates、projects、01_Discovery、02_Analysis、_Inbox、docs 及根目錄重複檔、歷史規劃產物 | OK |

**結論**：_archive 已集中存放舊結構、備份與專案痕跡，符合「純治理庫」之歸檔設計。

---

## 6. 附錄：ops 重複檔比對摘要（Task B）

比對 ** _archive 版** 與 **ops/ai_prompt_guides 版** 之兩組檔案：

### 6.1 OPS_Publish_To_Web

| 項目 | _archive/OPS_Publish_To_Web.md | ops/ai_prompt_guides/ops_publish_to_web.md |
|------|---------------------------------|---------------------------------------------|
| 內文 | 與 ops 版一致（目的、執行邏輯 1～3） | 同上，並含 YAML header（doc_id, layer, domain, stability, visibility, owner, status） |
| 判定 | 舊版（無 header） | **權威版**（較完整） |

**決策**：維持 ops/ai_prompt_guides/ops_publish_to_web.md 為唯一權威版，_archive 版保留不覆寫。

### 6.2 OPS_Inbox_AutoSorter

| 項目 | _archive/OPS_Inbox_AutoSorter.md | ops/ai_prompt_guides/ops_inbox_autosorter.md |
|------|-----------------------------------|-----------------------------------------------|
| 內文 | 與 ops 版一致（目的、執行邏輯 1～4） | 同上，並含 YAML header |
| 判定 | 舊版（無 header） | **權威版**（較完整） |

**決策**：維持 ops/ai_prompt_guides/ops_inbox_autosorter.md 為唯一權威版，_archive 版保留不覆寫。

---

**報告結束。**
