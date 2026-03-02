---
doc_id: OPS-GOV-OPS_重複檔比對摘要
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# ops 重複檔比對摘要（Task B）

**比對範圍**：_archive 與 ops/ai_prompt_guides 之兩組同名／對應檔案。

---

## 1. OPS_Publish_To_Web

| 版本 | 路徑 | 差異摘要 |
|------|------|----------|
| _archive | _archive/OPS_Publish_To_Web.md | 無 YAML header；內文與 ops 版一致（目的、執行邏輯 1～3）。 |
| 權威版 | ops/ai_prompt_guides/ops_publish_to_web.md | 含 YAML header（doc_id, layer, domain, stability, visibility, owner, status）；內文相同。 |

**結論**：ops/ai_prompt_guides 版較完整（含治理 metadata），**維持為唯一權威版**；_archive 版不覆寫、不搬移。

---

## 2. OPS_Inbox_AutoSorter

| 版本 | 路徑 | 差異摘要 |
|------|------|----------|
| _archive | _archive/OPS_Inbox_AutoSorter.md | 無 YAML header；內文與 ops 版一致（目的、執行邏輯 1～4）。 |
| 權威版 | ops/ai_prompt_guides/ops_inbox_autosorter.md | 含 YAML header；內文相同。 |

**結論**：ops/ai_prompt_guides 版較完整，**維持為唯一權威版**；_archive 版保留不搬移。

---

**決策**：兩組皆以 **ops/ai_prompt_guides/** 為最新／權威版，無需自 _archive 搬回覆蓋。
