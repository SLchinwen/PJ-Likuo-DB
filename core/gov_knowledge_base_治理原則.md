---
doc_id: CORE-GOV-KNOWLEDGE_BASE_PRINCIPLES
layer: core
domain: governance
stability: high
visibility: internal
owner: systemlead
status: active
---

# 知識庫治理原則與需求背景

本文件說明本知識庫（Template Repo）建立之**需求背景**與**治理設計原則**，作為未來變更、擴充與重構時的依據。本文件為**原則**；具體辦法與變更驗收見 [知識庫需求背景與治理辦法](gov_knowledge_base_需求背景與治理辦法.md)。

---

# 一、需求背景

## 1.1 問題起點

隨著專案數量增加與 AI 輔助產出比例提高，出現以下風險：

- 文件散落不同專案
- 標準與範本混用
- 命名隨時間變動（含日期與版本號）
- AI 產出文件缺乏一致 metadata
- 專案資料誤混入公司標準庫
- 無法量化治理成熟度

若無結構化治理，長期將導致：

- 知識不可累積
- 標準無法複製
- AI 無法穩定引用
- 專案與標準污染

---

## 1.2 建立此 Template Repo 的目的

本知識庫之角色為：

> 公司級 e 化專案之「治理母體」與「可複製模板庫」

核心定位：

- 僅存放治理規範、中央標準與範本
- 不存放任何單一專案資料
- 可被 clone 為新專案之基底
- 可被 AI 穩定讀取與引用

---

# 二、治理設計核心原則

---

## 原則 1：標準與專案隔離（Separation of Standard & Project）

- Template Repo 不得包含專案工作流目錄（如 Discovery、Analysis、Delivery Packages）
- 專案資料必須存在於 Project Repo
- 若發現專案資料，應搬移至 _archive 或專案庫

目的：

- 避免標準被客戶差異污染
- 確保公司知識可跨專案複製

---

## 原則 2：結構先於內容（Structure Before Content）

目錄結構固定為：

- core/
- standards/
- templates/
- ops/
- index/
- _archive/

任何新增文件必須符合分層邏輯。

目的：

- 讓 AI 與人員能快速定位文件層級
- 避免長期扁平化退化

---

## 原則 3：Metadata 治理（YAML 為強制）

所有 .md 文件必須具備 YAML Frontmatter。

必要欄位：

- doc_id
- layer
- domain
- stability
- visibility
- owner
- status

目的：

- 支援 AI 檢索
- 支援 Lint 自動檢查
- 支援未來 CI 與版本演進

---

## 原則 4：穩定命名，不以時間承載版本

禁止：

- YYYYMMDD_ 前綴
- v2 / v3 / 1.1 置於檔名
- 含空白命名

版本資訊必須存在於：

- YAML
- 文件內版本紀錄（若必要）

目的：

- 避免 rename 造成連結失效
- 降低歷史重構成本

---

## 原則 5：不刪除，僅搬移（Archive Strategy）

- 不直接刪除歷史文件
- 以 `_archive/` 收納
- 必要時建立 stub 指向新位置

目的：

- 保留演進脈絡
- 支援治理追溯

---

## 原則 6：治理可量化（Lint & Maturity）

- 透過治理 Lint 定期檢查
- 透過成熟度評估量化狀態
- 修正後必須再驗證（閉環）

目的：

- 防止治理退化
- 讓治理成為持續能力，而非一次性整理

---

## 原則 7：安全與隔離優先

- Template Repo 不得存放客戶資料
- 不得存放 API Key / Token / 憑證
- 敏感示例必須遮罩

目的：

- 降低資安風險
- 避免錯誤外洩

---

## 原則 8：AI 上下文節省與 PRD 最小模組化（本知識庫對 AI 的要求與治理原理）

為**節省未來需求之上下文 Token 數**，並讓專案 PRD 成為本知識庫可穩定引用之最小單元，下列為強制要求：

**（一）引用優於複製**

- 本知識庫內文件以 **doc_id / 路徑引用** 為主，AI 僅載入當前任務所需文件，不整庫載入。
- 入口與索引（如 index/00_overview、standards/00_總覽、core/readme_internal_docs）提供**導航**，AI 依 layer / domain 選擇必要檔案，降低單次 context 量。

**（二）PRD 最小模組化**

- 專案 PRD 須採**最小可交付單元**拆分：**一份 PRD 僅涵蓋一個主程式＋其子程式**，不寫整個專案。
- 依據：[PRD 拆分與交付單元規則](../standards/prd/prd_拆分與交付單元規則.md)、[文件治理規範](docs_治理規範.md) §6.5。
- 效益：AI 產出或審核時可依「單一主程式」載入對應 PRD，減少無關段落佔用 context。

**（三）治理條文化**

- 上述「引用優於複製」「PRD 最小模組化」為**本知識庫對 AI 的要求與治理原理**；新增或修改規範時須與之對齊，並透過 Lint／成熟度評估驗證。

目的：

- 降低 AI 單次對話之 context token 消耗
- 讓 PRD 成為可被精準引用、最小化載入的模組
- 使憲法與標準可直接指導 AI 行為與產出範圍

---

# 三、變更治理原則

未來若需修改本結構或規則，必須：

1. 說明修改原因（Why）
2. 評估對 AI / 專案 / 標準的影響
3. 更新本文件
4. 重新執行治理 Lint

---

# 四、長期演進方向

未來可能進化方向：

- 自動化 CI 治理檢查
- doc_id 全域唯一性索引
- 標準版本相容性政策
- 多層可見性（internal / public）

---

# 結語

本知識庫的價值不在文件數量，而在：

> 可複製、可維護、可量化、可演進。

若未來變更破壞**上述原則 1～8**任一條，應視為治理退化。