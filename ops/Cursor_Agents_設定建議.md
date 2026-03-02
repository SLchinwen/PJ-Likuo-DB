---
doc_id: OPS-GOV-CURSOR_AGENTS_SETTINGS
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# Cursor「Agents」頁面設定 — 功能說明與建議

依治理／文件／Prompt 撰寫為主的使用習慣，對 **Settings → Agents** 底下各區塊逐項說明並給建議。

---

## 一、Tab（程式碼／文件補全）

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Cursor Tab** | 依游標與近期編輯提供多行、情境感知的自動完成 | **ON** | 寫 YAML、表格、列表時可快速產出一致結構 |
| **Partial Accepts** | Ctrl+→ 逐字接受建議 | **ON** | 治理用語需精準時可只接受部分，其餘手動改 |
| **Suggestions While Commenting** | 在註解區塊內也觸發 Tab 建議 | **ON** | 在 Markdown 註解或草稿區仍可補全 |
| **Whitespace-Only Suggestions** | 僅建議空白／換行／縮排 | **OFF** | 格式需手動控制以符合 markdownlint |
| **Imports (TypeScript)** | 自動加入 TypeScript import | **OFF** | 以 .md／YAML 為主時不需 |
| **Auto Import for Python BETA** | Python 自動 import（Beta） | **OFF** | 同上，且 Beta 易有干擾 |

---

## 二、Models（模型選擇）

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Default model（Chat／Composer）** | 對話與多輪任務預設使用的模型 | 依方案選 **能力與用量平衡** 的型號 | 治理文件需理解長文與規則，建議至少能處理較長 context 的模型 |
| **Default model（Tab 補全）** | Tab 自動完成使用的模型 | 可與 Chat 同，或選 **較快／較省** 的型號 | 補全講求延遲低，不必用到最貴的模型 |
| **Override in conversation** | 單次對話中可切換模型 | **保留預設或 ON** | 需要時可針對難題換成更強模型 |

**說明**：若介面為「下拉選單」而非開關，選一個你方案內可用的預設即可；文件工作通常不需頻繁改動。

### 依「治理／文件／Prompt」工作建議啟用的 Models

| 用途 | 建議啟用 | 說明 |
|------|----------|------|
| **Chat／複雜推理**（審規則、對齊憲法、多檔案理解） | **Opus 4.6** 或 **Sonnet 4.6** | 長 context、推論穩，適合長篇治理文件與結構化產出 |
| **日常編輯／快回**（改 YAML、表格、單檔） | **GPT-5.3 Codex** 或 **Codex Low / Low Fast** | 延遲低、夠用即可，省用量 |
| **多步驟／跨檔任務**（Lint 修正、批次改 core） | **Composer 1.5** | 適合 Agent 型多檔編輯與執行 |
| **Tab 補全** | 與 Chat 同或 **Codex / Low Fast** | 以速度為主即可 |

**建議組合**：Opus 或 Sonnet（主要 Chat）＋ Codex 或 Low Fast（快回／Tab）＋ Composer 1.5（需多檔時）；其餘可關閉以減少清單干擾。

### Chat 用 Agent / Auto 建議

| 模式 | 建議 | 理由 |
|------|------|------|
| **Agent**（多步驟、可改檔／執行指令） | **需要時再開，或預設關** | 治理文件改動需可控；Agent 一次改多檔時建議先看計畫再接受，避免誤改 |
| **Auto**（自動執行、少確認） | **不建議** | 與「先審後改」習慣衝突；建議保留**每步或每批確認** |

**實務**：日常 Chat 用**一般對話模式**（非 Agent）即可；要跑 Lint、批次修 YAML、跨檔對齊時再開 Agent，且**不開 Auto**，改為手動接受或逐段確認。

---

## 三、Cloud Agents（雲端 Agent／背景任務）

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Enable Cloud Agents** | 是否啟用雲端 Agent 執行任務 | **依需求**：若會用 Cursor 網頁／API／Slack 等觸發 Agent 再開 | 本機以編輯＋Chat 為主可不開，減少權限與用量 |
| **Default model for agents** | Agent 執行任務時使用的模型 | 與 Chat 同或選 **Max 相容** 型號 | 僅在啟用 Cloud Agents 時才有影響 |
| **Base branch for PR** | Agent 開 PR 時的預設基底分支 | 多為 **main** 或 **master** | 與你 Repo 預設分支一致即可 |
| **Default repository** | Agent 預設操作的倉庫 | 留空或指定常用專案 Repo | 避免誤改到 Template Repo |
| **Network access** | Agent 是否可連外網（allowlist／allow all） | **Allowlist only** 或 **Default + allowlist** | 治理環境建議最小權限，只開放必要網域 |
| **Team follow-ups** | 誰可對 Agent 任務送 follow-up | **僅自己或信任成員** | 避免他人用你的身份影響任務與憑證 |
| **Display agent summary** | 是否顯示 Agent 的檔案 diff／摘要 | **ON** | 方便確認改動範圍與內容 |
| **Long running agents** | 是否允許長時間執行 | **依方案與需求** | 文件任務通常不需開到最長 |

**說明**：若你主要在本機 Cursor 編輯＋對話，很少用 Cloud Agents，整區可維持預設或關閉。

---

## 四、其他可能出現在 Agents 頁的項目

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Auto-run / 自動執行** | Agent 是否自動執行而不先確認 | **OFF 或需確認** | 治理文件與 Prompt 改動建議先預覽再接受 |
| **Suggestions delay** | 延遲幾毫秒後才顯示補全 | **維持預設** | 過短易誤觸，過長影響流暢度 |
| **Max tokens（suggestion）** | 單次補全最大 token 數 | **維持預設或適度提高** | 寫長段落時可略增，不必極大 |

---

## 五、總結：依你習慣的建議組合

- **Tab**：Cursor Tab、Partial Accepts、Suggestions While Commenting **ON**；Whitespace-Only、Imports、Python Auto Import **OFF**。
- **Models**：選一個 context 足夠、你方案內可用的預設；Tab 用同款或較輕量型號即可。
- **Cloud Agents**：少用則關閉或最小權限；若啟用則 Network 用 allowlist、Team follow-ups 限縮、Display summary **ON**。
- **自動執行類**：關閉或改為需確認，避免未檢查就改檔案。

若你實際畫面上有「名稱不同」或「多出來的選項」，把該選項名稱貼給我，我可以補上對應說明與建議。

---

## 六、Inline Editing & Terminal（行內編輯與終端機）

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Legacy Terminal Tool** | Agent 模式使用舊版終端，適用不支援的 shell 環境 | **OFF** | 一般環境用預設即可；僅在終端異常時再開 |
| **Toolbar on Selection** | 選取程式碼時顯示「Add to Chat」「Quick Edit」按鈕 | **ON** | 選取段落後可快速丟給 AI 改寫或討論，文件工作好用 |
| **Auto-Parse Links** | 在 Quick Edit（Ctrl+K）貼上時自動解析連結 | **ON** | 貼 URL 或 `@file` 時可自動辨識，方便引用 |
| **Themed Diff Backgrounds** | 行內 diff 使用主題色標示增刪 | **ON** | 改動一目了然，審核治理文件時好用 |
| **Terminal Hint** | 在終端顯示 Ctrl+K 提示 | **ON** | 在終端下指令時可提醒可用 Quick Edit |
| **Preview Box for Terminal Ctrl+K** | 終端 Ctrl+K 用預覽框而非直接串流進 shell | **依習慣**：建議 **ON** | 先看建議再決定是否套用，避免指令直接寫入終端 |

---

## 七、Attribution（歸屬）

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Commit Attribution** | Agent 產生的 commit 標記為與 Cursor 共同作者 | **ON** | 可追溯哪些 commit 有 AI 參與，稽核與治理透明 |
| **PR Attribution** | PR 標記為「Made with Cursor」 | **ON** | 同上，便於審查與合規紀錄 |

---

## 八、Cursor Ignore 與 Applying Changes

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Hierarchical Cursor Ignore** | 各層目錄的 .cursorignore 遞迴套用到子目錄 | **ON** | 與 .gitignore 類似，可依專案／子目錄控制 AI 索引範圍；改動後需重啟 Cursor |
| **Ignore Symlinks in Cursor Ignore Search** | 搜尋 .cursorignore 時略過符號連結 | **OFF** | 除非 Repo 有大量 symlink 且造成問題再開，預設保留完整發現 |
| **Inline Diffs NEW** | 在編輯器內顯示行內 diff 裝飾 | **ON** | 改動直接顯示在檔案旁，審核方便 |
| **Jump to Next Diff on Accept** | 接受一處改動後自動跳到下一個 diff | **ON** | 連續審核多處改動時省時 |
| **Auto Format on Agent Finish** | Agent 完成後自動格式化被改過的檔案 | **OFF** | 你重視 markdownlint／手動格式；自動 format 可能改動你刻意保留的排版 |

---

## 九、Agent Review 與 Context

| 選項 | 功能 | 建議 | 理由 |
|------|------|------|------|
| **Start Agent Review on Commit** | 每次 commit 後自動啟動 Agent 審查變更 | **OFF** | 治理文件改動希望自己控制何時審查，避免每次 commit 都跑 |
| **Include Submodules in Agent Review** | 審查時包含 Git submodule 的變更 | **OFF**（若無 submodule 則無所謂） | 本 Repo 無 submodule 可關；若有且需一併審再開 |
| **Include Untracked Files in Agent Review** | 審查時包含未追蹤（新）檔案 | **ON** | 新加的 .md／範本可一併被審查 |
| **Default Approach** | 審查深度：Quick / 較徹底 | **Quick** | 文件 Repo 用 Quick 即夠，省時省用量；需深度再手動選 |
| **Web Search Tool** | Agent 可搜尋網路 | **ON** | 查規範、文件格式時有用 |
| **Auto-Accept Web Search** | 略過確認，Agent 可自動執行搜尋 | **OFF** | 治理環境建議先確認再放行，避免未預期的外連 |
| **Web Fetch Tool** | Agent 可從 URL 抓內容 | **ON** | 引用外部文件、規範時有用；必要時再手動允許 |
