#!/bin/bash
set -euo pipefail

errors=0

check_command() {
  local cmd=$1
  local install_hint=$2
  if ! command -v "$cmd" &> /dev/null; then
    echo "[NG] $cmd が見つかりません"
    echo "    インストール: $install_hint"
    ((errors++))
  else
    local version
    version=$("$cmd" --version 2>&1 | grep -oP '\d+\.\d+\.\d+' | head -1)
    echo "[OK] $cmd v${version:-unknown}"
  fi
}

echo "=== 前提条件チェック ==="
echo ""
check_command "node" "https://nodejs.org/ または volta/fnm/nvm でインストール"
check_command "git"  "https://git-scm.com/"

# Docker は任意
if command -v docker &> /dev/null; then
  if docker info &> /dev/null 2>&1; then
    echo "[OK] Docker デーモン稼働中"
  else
    echo "[WARN] Docker インストール済みだがデーモン停止中"
  fi
else
  echo "[INFO] Docker 未インストール（DB等を使わなければ不要）"
fi

# OS 検出
echo ""
case "$(uname -s)" in
  Linux*)
    if grep -qEi "(Microsoft|WSL)" /proc/version 2>/dev/null; then
      echo "[INFO] OS: WSL2"
    else
      echo "[INFO] OS: Linux"
    fi ;;
  Darwin*) echo "[INFO] OS: macOS" ;;
  *)       echo "[INFO] OS: $(uname -s)" ;;
esac

# カレントディレクトリの空チェック
echo ""
if [ "$(ls -A . 2>/dev/null)" ]; then
  echo "[NG] カレントディレクトリが空ではありません"
  echo "    空のディレクトリで実行してください"
  ((errors++))
else
  echo "[OK] カレントディレクトリは空です"
fi

echo ""
if [ $errors -gt 0 ]; then
  echo "${errors} 個の問題があります。解決後に再実行してください。"
  exit 1
fi
echo "すべての前提条件を満たしています。"
