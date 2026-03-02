#!/usr/bin/env bash
# Template Repo 治理 Lint 檢查（CI 用）
# 執行 R1（結構污染）、R2 最小集（YAML 必填）、R9（layer-stability）
set -e

REPO_ROOT="${1:-.}"
cd "$REPO_ROOT"
FAIL=0

echo "==> R1: 結構污染檢查（根目錄不得有專案目錄）"
for dir in 01_Discovery 02_Analysis 03_Solution 04_prototype 90_delivery_packages projects; do
  if [[ -d "$dir" ]]; then
    echo "R1 違規: 根目錄存在禁止目錄: $dir"
    FAIL=1
  fi
done
[[ $FAIL -eq 0 ]] && echo "R1 通過"

echo ""
echo "==> R2 最小集: 主路徑 .md 須含 doc_id, layer, stability"
for layer_dir in core standards templates ops index; do
  [[ ! -d "$layer_dir" ]] && continue
  while IFS= read -r -d '' f; do
    if ! grep -q '^doc_id:' "$f" || ! grep -q '^layer:' "$f" || ! grep -q '^stability:' "$f"; then
      echo "R2 違規: 缺少必填 YAML 欄位: $f"
      FAIL=1
    fi
  done < <(find "$layer_dir" -name "*.md" -print0 2>/dev/null)
done
[[ $FAIL -eq 0 ]] && echo "R2 最小集通過"

echo ""
echo "==> R9: layer ↔ stability 一致性"
check_r9() {
  local f="$1"
  local layer="" stability=""
  # 僅從檔案開頭 YAML 區塊擷取（前 60 行內）
  layer=$(head -60 "$f" | grep -m1 '^layer:' | sed 's/^layer:[[:space:]]*//' | tr -d ' ')
  stability=$(head -60 "$f" | grep -m1 '^stability:' | sed 's/^stability:[[:space:]]*//' | tr -d ' ')
  [[ -z "$layer" || -z "$stability" ]] && return 0
  case "$layer" in
    core)      [[ "$stability" == "high" ]]   || { echo "R9 違規: $f (layer=$layer, stability=$stability, 應為 high)";   return 1; }
              ;;
    standard)  [[ "$stability" == "medium" ]] || { echo "R9 違規: $f (layer=$layer, stability=$stability, 應為 medium)"; return 1; }
              ;;
    template)  [[ "$stability" == "medium" ]] || { echo "R9 違規: $f (layer=$layer, stability=$stability, 應為 medium)"; return 1; }
              ;;
    ops)       [[ "$stability" == "low" ]]    || { echo "R9 違規: $f (layer=$layer, stability=$stability, 應為 low)";    return 1; }
              ;;
    *) return 0 ;;
  esac
  return 0
}
for layer_dir in core standards templates ops index; do
  [[ ! -d "$layer_dir" ]] && continue
  for f in $(find "$layer_dir" -name "*.md" 2>/dev/null); do
    check_r9 "$f" || FAIL=1
  done
done
[[ $FAIL -eq 0 ]] && echo "R9 通過"

if [[ $FAIL -eq 1 ]]; then
  echo ""
  echo "治理 Lint 檢查未通過，請依 index/governance_lint_report.md 與 prompt_governance_lint_advanced.md 修正。"
  exit 1
fi
echo ""
echo "治理 Lint 檢查通過（R1、R2 最小集、R9）。"
