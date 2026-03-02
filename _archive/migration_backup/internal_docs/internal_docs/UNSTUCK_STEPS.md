# 解除「卡在分支＋未提交變更」步驟

在專案目錄開啟終端機，**依序**執行：

## 1. 把目前所有變更都提交（還在原分支上）

```powershell
git add mkdocs.yml internal_docs/
git status
git commit -m "docs: 內部文件與 mkdocs 導覽更新（直推 main 流程）"
```

## 2. 切到 main

```powershell
git checkout main
```

## 3. 把這支分支合併進 main

```powershell
git pull origin main
git merge update-project-overview-20260205 -m "merge: 合併文件結構與流程更新"
```

## 4. 推到遠端 main

```powershell
git push origin main
```

## 5. 可選：刪除本地舊分支

```powershell
git branch -d update-project-overview-20260205
```

之後直接在 **main** 上改 `docs/`，commit 再 `git push origin main` 即可。
