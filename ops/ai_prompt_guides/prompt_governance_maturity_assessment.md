---
doc_id: OPS-GOV-PROMPT_GOVERNANCE_MATURITY_ASSESSMENT
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# 最終治理成熟度評估 — Template Repo 專用

你現在扮演「公司級文件治理審核顧問」。

請對目前 Repo 進行一次完整的「治理成熟度評估」。

⚠️ 本 Repo 為 Template Repo（純治理庫）。

---

# 評估目標

請從以下六大面向進行評估：

## 1️⃣ 結構完整性（Structure Integrity）
檢查是否存在：
- core/
- standards/（含 prd/delivery/development/security）
- templates/（含 prd/delivery/ops）
- ops/ai_prompt_guides/
- index/
- _archive/

輸出：
- 是否齊全
- 是否存在不該出現的目錄（如 projects/）
- 結構風險

---

## 2️⃣ YAML 治理一致性（Metadata Governance）

抽樣檢查各層文件：
- 是否都有 YAML header
- layer 與 stability 是否對應正確
- 是否有缺少 doc_id
- 是否存在錯誤命名

輸出：
- 合規比例（%）
- 高風險文件列表
- 修正建議

---

## 3️⃣ 標準與範本分離度（Standard/Template Separation）

檢查：
- standards 是否只包含規則
- templates 是否未複製 standards 全文
- 是否存在混層現象

輸出：
- 分離成熟度評分
- 是否存在治理污染

---

## 4️⃣ AI 可讀性與可執行性（AI Readability）

檢查：
- 是否有 index 入口
- 是否有 prompt_templates
- 是否有操作手冊
- 是否可讓 AI 自動完成新專案初始化

輸出：
- AI 可用度評分
- 建議優化項目

---

## 5️⃣ 可擴展性與多專案支援能力（Scalability）

檢查：
- 是否明確區分 Template Repo vs Project Repo
- 是否有防止專案資料混入機制
- 是否可安全 clone 成新專案

輸出：
- 擴展成熟度評分
- 潛在風險

---

## 6️⃣ 安全與隔離能力（Security & Isolation）

檢查：
- 是否有禁止 projects/ 的規則
- 是否有 visibility 控制
- 是否有防止客戶資料混入之提示

輸出：
- 安全成熟度評分
- 改進建議

---

# 評分方式

每個面向請給：
- 0~10 分
- 風險說明
- 改善優先順序（High / Medium / Low）

最後輸出：

# 總成熟度評分（0~100）

並給出：

- 🎯 當前成熟度等級：
  - 初級（0-40）
  - 進階（41-70）
  - 成熟（71-85）
  - 公司級（86-95）
  - 產品級（96-100）

- 📌 三項最重要改進建議
- 🧱 若要提升到「產品級治理」需新增什麼

---

⚠️ 不得修改任何檔案。
僅讀取並產出評估報告。