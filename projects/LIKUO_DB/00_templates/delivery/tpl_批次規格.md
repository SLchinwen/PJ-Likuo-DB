---
doc_id: template_api_batch_spec
layer: template
domain: api
stability: medium
visibility: internal
owner: systemlead
doc_status: active
title: "批次規格（範本）"
type: Template
tags: [批次, 無 UI, 規格]
version: 1.0
last_updated: 2026-02-23
---

# 批次規格：[程式代號]｜[批次名稱]

本文件依 [中央標準｜批次規格範本](../internal_docs/standards/批次規格範本.md) 產出，用於無 UI 之批次程式。每支批次一檔，檔名：`<程式代號>_<簡述>.md`。

---

## 觸發條件

- **排程**：[例 每日 02:00]
- **前置**：[例 前日結關資料已就緒]

---

## 輸入

| 來源 | 格式 | 說明 |
| :--- | :--- | :--- |
| [TABLE 或檔案] | [格式] | [說明] |

---

## 處理邏輯

1. [步驟一]
2. [步驟二]
3. …

---

## 輸出

| 輸出項 | 格式 | 說明 |
| :--- | :--- | :--- |
| [檔案或 TABLE] | [格式] | [說明] |

---

## 錯誤處理

- [錯誤情境一]：[處理方式]
- [錯誤情境二]：[處理方式]

---

## 驗收條件（至少一項 B 類型）

| ID | 類型 | 描述 | 檢核方式 |
| :--- | :--- | :--- | :--- |
| [程式代號]-B01 | B | [例 產出檔名格式 export_YYYYMMDD_HHmmss.csv] | 執行後檢查檔名與內容 |

---

## 版本紀錄

| 版本 | 日期 | 修改者 | 修改內容 |
| :--- | :--- | :--- | :--- |
| v1.0 | YYYY-MM-DD | [產出者] | 依範本產出。 |
