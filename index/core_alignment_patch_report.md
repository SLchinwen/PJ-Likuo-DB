---
doc_id: OPS-GOV-CORE_ALIGNMENT_PATCH_REPORT
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# core/ 對齊修補報告（Core Alignment Patch Report）

**執行角色**：Core Alignment Patch 修正員  
**依據**：index/core_alignment_review_report.md、Template Repo 結構（core/standards/templates/ops/index/_archive）、Lint 規則  
**產出日期**：2026-03-01  
**安全規則**：未刪除、未搬移任何檔案；僅修改 core/ 內 .md；未改 _archive/**、standards/**、templates/**、ops/**（僅新增本報告於 index/）。

---

## 1. 修正摘要

| 類型 | 說明 | 套用檔案數 |
| ------ | ------ | -------------- |
| **P1 用語修補** | 於出現 01_Discovery、02_Analysis、03_Solution、00_Templates、internal_docs 等段落前後加註「專案 Repo（由本 Template Repo clone 後）」與「本 Template Repo 僅包含 core/standards/templates/ops/index/_archive」 | 10+ |
| **P2 路徑修正 00_Templates → templates** | 相對路徑 `../00_Templates/`、`00_Templates/` 改為 `../templates/` 或對應 templates 子路徑（含 tpl_gov_公司e化標準治理、tpl_prototype_html、tpl_欄位名稱對照表_交付用 等） | 15+ |
| **P3 路徑修正 internal_docs** | 「本 Repo 的 internal_docs/」改為 core/ 或 index/00_overview.md、readme_internal_docs.md；「專案 Repo 的 internal_docs/」保留並加註「專案 Repo 內」 | 12+ |
| **P4 YAML／命名規則** | gov_e化專案治理總則 §1.2 補必填欄位說明（doc_id/layer/domain/stability/visibility/status）；§3.1 加註「本 Template Repo 檔名不含日期／版本」、範例標為「專案 Repo」 | 1 |
| **P5 入口一致** | 「見 README.md」「本目錄 README」改為 readme_internal_docs.md、index/00_overview.md；§7 索引連結改為 core 內相對路徑與 ../templates/、../ops/、../index/ | 4+ |

---

## 2. 逐檔變更清單

| 檔案 | 變更類型 | 修改前 → 修改後（短片段） |
| ------ | ------ | ------------------------- |
| core/gov_e化專案治理總則.md | P1 | §2 前加註「以下目錄結構為專案 Repo…；本 Template Repo 本身僅包含 core/standards/templates/ops/index/_archive」 |
| core/gov_e化專案治理總則.md | P2 | 00_Templates → templates/；§7 連結 00_Templates/、internal_docs/ → templates/、index/00_overview、readme_internal_docs |
| core/gov_e化專案治理總則.md | P3 | §2.3 internal_docs 單一真相來源 → 本 Template Repo 以 core/ 與 index/00_overview 為入口；專案 Repo 以 internal_docs 為準 |
| core/gov_e化專案治理總則.md | P4 | §1.2 補「本 Template Repo 另要求必填 doc_id、layer、domain、stability、visibility、status」；§3.1 加註「本 Template Repo 內檔名不含日期／版本」、範例標「專案 Repo」 |
| core/gov_e化專案治理總則.md | P5 | §7 索引 internal_docs/ 需求到交付包… → 需求到交付包…（core 內）；internal_docs/、00_Templates/ → index/00_overview、readme_internal_docs、templates/；OPS 連結 → ../ops/ |
| core/readme_internal_docs.md | P1、P3 | 開頭加「本 Template Repo 之治理入口為 core/；以下說明適用於複製至專案 Repo 後之 internal_docs/」；§1 結構圖前加「本 Template Repo 結構：core/、standards/、templates/…」與「專案 Repo 複製後可採用」 |
| core/index_internal_docs.md | P1、P3、P5 | 「本頁為 internal_docs 之詳細一覽」→「core/ 治理文件之詳細一覽」；入口 README.md → readme_internal_docs.md、index/00_overview.md；產物歸屬加「專案 Repo 建議」；「本目錄或 02_Analysis」→「core/ 或專案 Repo 之 02_Analysis」 |
| core/協作與治理規範.md | P1、P2 | §2 前加註「專案 Repo…；本 Template Repo 本身僅包含 core/standards/…」；Tpl_模組欄位名稱對照表 → ../templates/tpl_欄位名稱對照表_交付用.md |
| core/公司專案標準規範_需求與開發協作.md | P2、P5 | README.md、index.md → readme_internal_docs、index_internal_docs、index/00_overview；「本專案」→「專案 Repo 建議」；00_Templates/Tpl_* → templates/ 下對應範本（tpl_程式代號與權限矩陣_交付用、tpl_欄位名稱對照表_交付用 等） |
| core/docs_治理規範.md | P1、P2 | 開頭加註「本 Template Repo 結構…；以下 docs/ 與 internal_docs/ 適用於專案 Repo」；../00_Templates/Tpl_* → ../templates/tpl_*（權限矩陣、情境與驗收說明、欄位名稱對照表） |
| core/雛型產出規範與指引.md | P2、P1 | ../00_Templates/Tpl_GOV_公司e化標準治理、Tpl_Prototype_HTML → ../templates/tpl_gov_公司e化標準治理.md、tpl_prototype_html.html；放置列加「專案 Repo」與「本 Template Repo 不包含 02_Analysis/、docs/」 |
| core/程式編碼原則_共用規範.md | P2 | 00_Templates/Tpl_模組欄位名稱對照表 → ../templates/tpl_欄位名稱對照表_交付用.md（本 Template Repo） |
| core/如何要求文件優化.md | P3 | 「本目錄 internal_docs/」→「本 Template Repo 為 core/；專案 Repo 內為 internal_docs/」 |
| core/新專案參考使用辦法_整合ai開發.md | P1、P2、P3 | 開頭加註「專案 Repo 內」與 P1 註記；表格「複製來源」改為本 Template Repo core/、templates/；新專案放置為專案 Repo 之 internal_docs/、00_Templates/；00_Templates 範本路徑 → templates/ 下對應範本 |
| core/開發團隊_ai開發指引.md | P3 | internal_docs 路徑或副本 → 加註「專案 Repo 內」；模組與程式代碼編碼原則 → 本 Template Repo core/；專案架構 → 需求方 Repo 之 02_Analysis 或 internal_docs（專案 Repo 內） |
| core/ai治理與開發銜接檢視與建議.md | P1、P2 | 目錄與工作流、模組與程式代碼列加「專案 Repo」／「本 Template Repo：core/」；00_Templates/Tpl_GOV → ../templates/tpl_gov_公司e化標準治理.md |
| core/舊專案加入治理_操作指引.md | P1、P2、P3 | 來源改為「本 Template Repo」；來源路徑 internal_docs/、00_Templates/ → core/、standards/、templates/；舊專案放置仍為 internal_docs/、00_Templates/；複製說明改為「自本 Template Repo templates/ 與 standards/」 |
| core/交付開發包補足建議與版本對照.md | P2、P3 | §3.1、§4.1、§4.2、§4.3 標題加「本 Template Repo 為 templates/／core/；專案 Repo 為 00_Templates／internal_docs」；00_Templates 範本取用 → templates/；00_Templates/README.md → ../templates/readme.md |
| core/需求到交付包_生命週期與流程總覽.md | P2、P3 | 程式編碼原則放置 internal_docs/ → 本 Template Repo core/、專案 Repo internal_docs/；00_Templates 各範本 → templates/ 對應檔名；GOV 連結 → core 內 gov_e化專案治理總則；internal_docs 單一真相 → 專案 Repo 之 internal_docs；補「本 Template Repo 治理入口為 core/ 與 index/00_overview」 |
| core/需求到交付包_整併與版本說明.md | P2 | 00_Templates/Tpl_RFP_系統全貌、Tpl_客戶與專案背景、Tpl_需求變更單 → 本 Template Repo templates/；專案 Repo 00_Templates/ |
| core/ai_產出交付文件指引.md | P2、P3 | 範本路徑、Step 範本、§6 速查表：00_Templates/、internal_docs/standards/ → 本 Template Repo templates/、standards/；專案 Repo 複製後 00_Templates/、internal_docs/standards/ |
| core/模組與程式代碼編碼原則.md | P2、P3 | 00_Templates/Tpl_GOV → templates/tpl_gov_公司e化標準治理.md；internal_docs/README → readme_internal_docs、index/00_overview；專案 Repo internal_docs/README.md |
| core/單支程式交付開發包_實作足夠性檢視與建議.md | P2 | 00_Templates 未齊備、於 00_Templates 建立 → 本 Template Repo templates/（或專案 00_Templates） |
| core/ai_prompt_主程式與prd拆分.md | P2、P3 | internal_docs/standards/PRD_*、internal_docs/程式編碼原則、internal_docs/AI_產出 → 本 Template Repo standards/、core/；專案 Repo internal_docs/ |

---

## 3. 待人工確認清單

| 項目 | 說明 |
| ------ | ------ |
| **Tpl_PRD_功能作業** | 本 Template Repo 之 templates/ 下無同名檔，僅有 tpl_solution_spec、tpl_prd_本階段範圍摘要、tpl_情境與驗收說明_交付用 等；若專案需「功能作業 PRD」範本，請確認對應為 tpl_prd_本階段範圍摘要 或另建範本。 |
| **standards 子目錄** | 部分 core 內連結指向 `../standards/驗收條件範本.md`；實際路徑為 `standards/prd/驗收條件範本.md`。若 404 請改為 `../standards/prd/驗收條件範本.md`。 |
| **舊專案加入治理 1.2 表** | 「來源路徑」已改為 standards/；若舊專案複製時需從 core/ 取得檔案，表內「來源」應為 core/（治理規範類）與 standards/（交付包類），已區分。 |

---

## 4. 建議

- 修正完成後，建議再跑一次**進階治理 Lint**（依 ops/ai_prompt_guides/prompt_governance_lint_advanced.md）驗證 R1～R7。
- 建議再跑一次 **core/ 對齊審核**（治理憲法審核員），確認對齊度評分與殘項。

---

**報告結束。**
