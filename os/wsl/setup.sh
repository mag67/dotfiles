#!/usr/bin/env bash
set -euo pipefail

echo "WSL2 固有セットアップ..."

# win32yank.exe のインストール（WSL ⇔ Windows クリップボード連携）
if [[ ! -f "$HOME/.local/bin/win32yank.exe" ]]; then
  echo "win32yank.exe をインストール中..."
  mkdir -p "$HOME/.local/bin"
  curl -fsSL https://github.com/equalsraf/win32yank/releases/latest/download/win32yank-x64.zip -o /tmp/win32yank.zip
  unzip -o /tmp/win32yank.zip -d "$HOME/.local/bin/" win32yank.exe
  chmod +x "$HOME/.local/bin/win32yank.exe"
  rm /tmp/win32yank.zip
  echo "win32yank.exe インストール完了"
else
  echo "win32yank.exe は既にインストール済み"
fi
