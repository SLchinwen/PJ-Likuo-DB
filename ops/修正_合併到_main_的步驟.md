---
doc_id: ops_governance_merge_to_main
layer: ops
domain: governance
stability: low
visibility: internal
owner: systemlead
status: active
---

# 修正：把分支合併到 main（Git Bash 用）

您上次執行時 **`git checkout main` 因 index.lock 失敗**，所以從未切到 main，後續的 merge / push 沒有把「文件結構更新」合併進 main。

---

## 目前狀態（不健康）

| 項目 | 狀態 |
| :--- | :--- |
| 目前分支 | `update-project-overview-20260205`（還在這支上） |
| main | 還沒有「內部文件、mkdocs 導覽、直推 main 流程」等 commit |
| 遠端 main | 與本地 main 相同，也還沒有上述更新 |

---

## 正確做法（在 Git Bash 依序執行）

**請先關閉 Cursor**，再在 Git Bash 執行（路徑用 `/c/` 開頭）：

```bash
cd "/c/github/SL_Client_Case/HER _CHYUN"

# 1. 刪除鎖檔（一定要先做）
rm -f .git/index.lock .git/config.lock

# 2. 切到 main
git checkout main

# 3. 拉最新 main（可選，確保與遠端一致）
git pull origin main

# 4. 把分支合併進 main
git merge update-project-overview-20260205 -m "merge: 合併文件結構與流程更新"

# 5. 推到遠端
git push origin main
```

執行後應看到：

- `Switched to branch 'main'`（步驟 2）
- `Fast-forward` 或 `Merge made by...`（步驟 4）
- `main -> main`（步驟 5）

---

## 檢查是否健康

執行完後在 Git Bash 跑：

```bash
git branch
git log --oneline -3
```

- `git branch` 應顯示目前是 **main**（前面有 *）。
- `git log` 應能看到「merge: 合併文件結構與流程更新」與「docs: 內部文件與 mkdocs 導覽更新」。

---

## 若步驟 2 仍出現 index.lock

表示還有程式在用這個 repo，請：

1. 完全關閉 Cursor。
2. 關閉任何有開這個專案資料夾的 VS Code / 其他編輯器。
3. 再執行一次 `rm -f .git/index.lock .git/config.lock` 與後續指令。
