# YAML Header 補齊 — 變更清單

**執行日期**：2026-03-01  
**規則**：僅補 header，未改動內文。  
**必備欄位**：`doc_id`、`layer`、`domain`、`stability`、`visibility`、`owner`、`status`。

---

## 一、stability 對應規則

| layer     | stability |
|----------|-----------|
| core     | high      |
| standard | medium    |
| template | medium    |
| ops      | low       |
| projects | 未統一補 header |

---

## 二、變更清單（依 layer）

### 2.1 core（20 個 .md 檔案）

| 檔案路徑 | doc_id | domain | stability |
|----------|--------|--------|-----------|
| core/gov_e化專案治理總則.md | core_governance_gov_governance | governance | high |
| core/readme_internal_docs.md | core_governance_readme_internal_docs | governance | high |
| core/index_internal_docs.md | core_governance_index_internal_docs | governance | high |
| core/公司專案標準規範_需求與開發協作.md | core_governance_company_standard_collaboration | governance | high |
| core/協作與治理規範.md | core_governance_collaboration | governance | high |
| core/docs_治理規範.md | core_governance_docs | governance | high |
| core/需求到交付包_生命週期與流程總覽.md | core_governance_lifecycle_overview | governance | high |
| core/需求到交付包_整併與版本說明.md | core_governance_lifecycle_merge_version | governance | high |
| core/程式編碼原則_共用規範.md | core_governance_coding_shared | governance | high |
| core/模組與程式代碼編碼原則.md | core_api_module_coding_principle | api | high |
| core/雛型產出規範與指引.md | core_governance_prototype_guideline | governance | high |
| core/ai_產出交付文件指引.md | core_delivery_ai_output_guideline | delivery | high |
| core/ai_prompt_主程式與prd拆分.md | core_prd_ai_prompt_prd_split | prd | high |
| core/ai治理與開發銜接檢視與建議.md | core_governance_ai_governance_review | governance | high |
| core/開發團隊_ai開發指引.md | core_governance_dev_team_ai_guide | governance | high |
| core/如何要求文件優化.md | core_governance_how_to_request_doc_optimization | governance | high |
| core/新專案參考使用辦法_整合ai開發.md | core_governance_new_project_guide | governance | high |
| core/舊專案加入治理_操作指引.md | core_governance_legacy_project_governance | governance | high |
| core/單支程式交付開發包_實作足夠性檢視與建議.md | core_delivery_single_package_sufficiency_review | delivery | high |
| core/交付開發包補足建議與版本對照.md | core_delivery_package_supplement_version | delivery | high |

**未補 header**：`core/.cursorrules`（非 .md，非文件 YAML 適用對象）。

---

### 2.2 standards（14 個 .md 檔案）

| 檔案路徑 | doc_id | domain | stability |
|----------|--------|--------|-----------|
| standards/00_總覽.md | standard_governance_overview | governance | medium |
| standards/prd/prd_拆分與交付單元規則.md | standard_prd_split_rules | prd | medium |
| standards/prd/驗收條件範本.md | standard_prd_acceptance_template | prd | medium |
| standards/delivery/需求釐清與交付包_治理規範.md | standard_delivery_requirement_clarification | delivery | medium |
| standards/delivery/交付包結構範本.md | standard_delivery_package_structure | delivery | medium |
| standards/delivery/子程式清單與實作建議_治理規範.md | standard_delivery_subprogram_list_governance | delivery | medium |
| standards/delivery/工程師開工指引_治理規範.md | standard_delivery_engineer_kickoff_governance | delivery | medium |
| standards/development/雛型標題命名標準.md | standard_api_prototype_title_naming | api | medium |
| standards/development/子程式實作建議_標準.md | standard_api_subprogram_implementation | api | medium |
| standards/development/table與api設計_ai產出指引.md | standard_api_table_api_design_guide | api | medium |
| standards/development/cursorrules_範本.md | standard_api_cursorrules_template | api | medium |
| standards/development/批次規格範本.md | standard_api_batch_spec_template | api | medium |
| standards/development/開發順序建議_合群報關.md | standard_api_dev_order_hechyun | api | medium |
| standards/security/資安要求清單.md | standard_security_requirements | security | medium |

---

### 2.3 templates（17 個 .md 檔案）

| 檔案路徑 | doc_id | domain | stability |
|----------|--------|--------|-----------|
| templates/readme.md | template_governance_readme | governance | medium |
| templates/tpl_solution_spec.md | template_prd_solution_spec | prd | medium |
| templates/tpl_需求變更單.md | template_prd_change_request | prd | medium |
| templates/tpl_驗收條件.md | template_prd_acceptance | prd | medium |
| templates/tpl_客戶與專案背景.md | template_governance_client_background | governance | medium |
| templates/tpl_discovery_note.md | template_prd_discovery_note | prd | medium |
| templates/tpl_批次規格.md | template_api_batch_spec | api | medium |
| templates/tpl_開發要求與資安清單.md | template_security_dev_requirements | security | medium |
| templates/tpl_gov_公司e化標準治理.md | template_governance_gov_egovernance | governance | medium |
| templates/tpl_rfp_系統全貌.md | template_prd_rfp_overview | prd | medium |
| templates/tpl_工程師開工指引.md | template_delivery_engineer_kickoff | delivery | medium |
| templates/tpl_欄位名稱對照表_交付用.md | template_delivery_field_mapping | delivery | medium |
| templates/tpl_子程式清單_交付用.md | template_delivery_subprogram_list | delivery | medium |
| templates/tpl_情境與驗收說明_交付用.md | template_delivery_scenario_acceptance | delivery | medium |
| templates/tpl_程式代號與權限矩陣_交付用.md | template_delivery_program_code_matrix | delivery | medium |
| templates/tpl_交付開發包_readme.md | template_delivery_package_readme | delivery | medium |
| templates/tpl_prd_本階段範圍摘要.md | template_prd_scope_summary | prd | medium |

**未補 header**：`templates/tpl_prototype_html.html`（.html 非 .md，未套用 YAML 文件 header）。

---

### 2.4 ops（12 個 .md 檔案）

| 檔案路徑 | doc_id | domain | stability |
|----------|--------|--------|-----------|
| ops/ops_publish_to_web.md | ops_governance_publish_to_web | governance | low |
| ops/ops_inbox_autosorter.md | ops_governance_inbox_autosorter | governance | low |
| ops/協同開發_文件治理流程.md | ops_governance_collab_doc_flow | governance | low |
| ops/更新對外文件與發布.md | ops_governance_update_publish_docs | governance | low |
| ops/提交變更步驟.md | ops_governance_commit_steps | governance | low |
| ops/修正_合併到_main_的步驟.md | ops_governance_merge_to_main | governance | low |
| ops/unstuck_steps.md | ops_governance_unstuck_steps | governance | low |
| ops/github_檢查清單.md | ops_governance_github_checklist | governance | low |
| ops/交付前檢查與待補清單.md | ops_governance_delivery_checklist | governance | low |
| ops/gov_inbox_歸檔審視與建議.md | ops_governance_inbox_archive_review | governance | low |
| ops/技術棧與認證_決策備忘.md | ops_governance_tech_stack_decision | governance | low |
| ops/azure環境建議.md | ops_governance_azure_env | governance | low |

**未補 header**：`ops/workflows/publish.yml`、`ops/mkdocs.yml`（組態檔，非文件 YAML header 適用對象）。

---

## 三、共通欄位值

所有已補 header 之文件均含下列固定值：

| 欄位 | 值 |
|------|-----|
| visibility | internal |
| owner | systemlead |
| status | active |

---

## 四、統計

| layer | 已補 header 檔案數 | 未補（說明） |
|-------|---------------------|--------------|
| core | 20 | 1（.cursorrules） |
| standard | 14 | 0 |
| template | 17 | 1（.html） |
| ops | 12 | 2（.yml） |
| **合計** | **63** | **4** |

---

**變更清單結束。**
