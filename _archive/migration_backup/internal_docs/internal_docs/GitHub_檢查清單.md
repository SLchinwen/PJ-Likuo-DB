# GitHub 與本機狀態檢查清單

檢查時間：依您執行時為準。以下為目前發現的項目。

---

## 1. 遠端網址建議更新（重要）

**現狀**：`origin` 為 `https://github.com/SLchinwen/--.git`  
**建議**：GitHub 曾提示改用新網址，請改為正式 repo 網址以免後續 push/fetch 異常。

```powershell
git remote set-url origin https://github.com/SLchinwen/HER_CHYUN.git
git remote -v
```

---

## 2. 目前還在功能分支，未回到 main

**現狀**：

- 目前分支：`update-project-overview-20260205`
- 此分支比 `origin/update-project-overview-20260205` **多 1 個 commit**（內部文件與 mkdocs 更新）尚未 push
- 之前「切到 main → 合併」因檔案被佔用而中斷，所以 **main 上還沒有這批文件結構更新**

**建議**（關閉相關檔案或改用外部終端後執行）：

```powershell
# 可選：先 push 目前分支備份
git push -u origin update-project-overview-20260205

# 切到 main 並合併
git checkout main
git pull origin main
git merge update-project-overview-20260205 -m "merge: 合併文件結構與流程更新"
git push origin main
```

完成後日常在 **main** 上改 `docs/` 並 `git push origin main` 即可。

---

## 3. 未提交的變更（本機）

**已修改、未 add/commit**：

- `01_Discovery/` 下 4 個 .md
- `02_Analysis/` 下 3 個 .md

請依需要決定：要一併 commit（含在目前分支或 main）或還原。

**未追蹤檔案**（在 `docs/` 根目錄）：

- `docs/coding_standard_program_codes.md`
- `docs/協作與治理規範.md`

這兩個已搬至 `internal_docs/`，若為舊檔可刪除，避免重複：

```powershell
# 確認無誤後再刪
Remove-Item docs/coding_standard_program_codes.md, "docs/協作與治理規範.md" -ErrorAction SilentlyContinue
```

---

## 4. GitHub Actions（publish.yml）

- 觸發：**push 到 main** 時會建置 MkDocs 並部署到 **gh-pages**。
- 設定正常，無需修改。合併到 main 並 push 後，網站會自動更新。

---

## 5. 摘要

| 項目           | 狀態     | 建議 |
| :------------- | :------- | :--- |
| 遠端 URL       | 為舊網址 | 執行 `git remote set-url origin https://github.com/SLchinwen/HER_CHYUN.git` |
| 目前分支       | 功能分支 | 合併到 main 並 push（見上方指令） |
| 未提交變更     | 有       | 決定要 commit 或還原；刪除 docs/ 下重複舊檔 |
| GitHub Pages   | 依 main  | 合併並 push main 後會自動發布 |

網路若無法連到 GitHub（例如 fetch 失敗），請檢查本機網路、Proxy 或 VPN，再重試 `git fetch` / `git push`。
