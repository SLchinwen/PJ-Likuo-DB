---
doc_id: ops_governance_azure_env
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
title: "合群報關管理系統｜Azure 環境建議"
type: Reference
tags: [Azure, 環境, 雲端]
version: 1.0
last_updated: 2026-02-23
---

# 合群報關管理系統｜Azure 環境建議

本專案採用 **Azure 雲端**。工程團隊原則上使用 **SQL 彈性資料庫**、**App Service** 為 API 伺服器。以下為建議環境與可規劃使用之服務。

---

## 1. 核心服務建議

| 服務 | 用途 | 說明 |
| :--- | :--- | :--- |
| **Azure SQL 彈性資料庫** | 資料庫 | 多資料庫可共用彈性集區，降低成本 |
| **App Service** | API 伺服器 | 部署後端 API；可建 staging slot 供測試 |
| **App Service 方案** | 主機方案 | 依負載選擇 B1、S1、P1v2 等 |
| **Application Insights** | 監控 | 建議每個 App Service 啟用，追蹤效能與錯誤 |
| **Azure Storage** | 檔案儲存 | 匯出檔、附件等 Blob 儲存 |
| **Log Analytics** | 日誌 | 集中日誌分析（選用） |

---

## 2. 公司既有 Azure 資源

公司已啟用多項 Azure 服務，可依專案需求規劃使用。資源清單由專案負責人提供（如 `Azureresources.csv`），包含：

- **SQL 資料庫**：sl-dbt、sl-dbp 等伺服器
- **App Service**：多個專案已使用 East Asia、Japan East
- **Application Insights**：監控元件
- **儲存體帳戶**：Blob、檔案儲存
- **Logic App**：工作流程自動化（若需）
- **Azure Automation**：Runbook、排程（若需）

---

## 3. 本專案建議規劃

### 3.1 新專案資源（建議新建）

| 資源類型 | 命名建議 | 說明 |
| :--- | :--- | :--- |
| 資源群組 | RG_HER_CHYUN 或 RG_合群報關 | 本專案專用 |
| SQL 伺服器 | 依公司規範 | 可新建或使用既有 |
| SQL 資料庫 | HER_CHYUN 或 合群報關 | 彈性集區內 |
| App Service 方案 | ASP_HER_CHYUN | 本專案 API 用 |
| App Service | api-her-chyun 或類似 | API 部署目標 |
| Application Insights | appi-her-chyun | 監控 |

### 3.2 環境變數建議

| 變數 | 說明 |
| :--- | :--- |
| `DATABASE_URL` 或 `ConnectionStrings__Default` | SQL 連線字串 |
| `Azure__Storage__ConnectionString` | Storage 連線（若用） |
| `APPLICATIONINSIGHTS_CONNECTION_STRING` | App Insights（App Service 自動注入） |

### 3.3 區域建議

- **East Asia**、**Japan East**：公司既有資源多在此兩區，建議一致以利整合

---

## 4. 相關文件

| 文件 | 說明 |
| :--- | :--- |
| 各交付包 03_附錄/工程師開工指引.md | 該程式之環境與準備事項 |
| [TABLE 與 API 設計｜AI 產出指引](standards/TABLE與API設計_AI產出指引.md) | schema、環境設定建議 |
