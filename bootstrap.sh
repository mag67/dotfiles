#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- OS判定 ---
detect_os() {
  if grep -qEi "(microsoft|WSL)" /proc/version 2>/dev/null; then
    echo "wsl"
  elif [[ "$(uname)" == "Darwin" ]]; then
    echo "macos"
  else
    echo "linux"
  fi
}

OS_TYPE=$(detect_os)
echo "検出されたOS: $OS_TYPE"

# --- Homebrew インストール ---
install_homebrew() {
  if ! command -v brew &>/dev/null; then
    echo "Homebrew をインストール中..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # PATH に追加
  if [[ "$OS_TYPE" == "macos" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi

  echo "Brewfile からパッケージをインストール中..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
}

# --- Oh-my-Zsh インストール ---
install_oh_my_zsh() {
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Oh-my-Zsh をインストール中..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  else
    echo "Oh-my-Zsh は既にインストール済み"
  fi
}

# --- Zsh カスタムプラグイン ---
install_zsh_plugins() {
  local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

  if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]]; then
    echo "zsh-autosuggestions をインストール中..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  fi

  if [[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]]; then
    echo "zsh-syntax-highlighting をインストール中..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  fi
}

# --- Stow でシンボリックリンク作成 ---
stow_packages() {
  cd "$DOTFILES_DIR"

  local packages=(zsh git nvim zellij wezterm mise gh claude codex lazygit)

  for pkg in "${packages[@]}"; do
    echo "Stow: $pkg をリンク中..."
    stow --restow --target="$HOME" "$pkg"
  done
}

# --- OS固有セットアップ ---
apply_os_specific() {
  if [[ -f "$DOTFILES_DIR/os/$OS_TYPE/setup.sh" ]]; then
    echo "OS固有セットアップを実行中: $OS_TYPE..."
    bash "$DOTFILES_DIR/os/$OS_TYPE/setup.sh"
  fi
}

# --- mise ランタイム ---
setup_mise() {
  if command -v mise &>/dev/null; then
    echo "mise でランタイムをインストール中..."
    mise install
  fi
}

# --- Codex CLI インストール ---
install_codex() {
  if command -v codex &>/dev/null; then
    echo "Codex CLI は既にインストール済み"
    return
  fi

  if command -v mise &>/dev/null; then
    echo "Codex CLI をインストール中..."
    mise exec -- npm install -g @openai/codex
  elif command -v npm &>/dev/null; then
    npm install -g @openai/codex
  else
    echo "警告: npm が見つかりません。mise install 後に 'npm install -g @openai/codex' を実行してください"
  fi
}

# --- Neovim プラグイン同期 ---
setup_neovim() {
  if command -v nvim &>/dev/null; then
    echo "Neovim プラグインを同期中..."
    nvim --headless "+Lazy! sync" +qa 2>/dev/null || true
  fi
}

# --- メイン ---
echo "===== dotfiles セットアップ開始 ====="
echo ""

install_homebrew
install_oh_my_zsh
install_zsh_plugins
stow_packages
apply_os_specific
setup_mise
install_codex
setup_neovim

echo ""
echo "===== セットアップ完了 ====="
echo ""
echo "以下の手動ステップを実行してください:"
echo "  1. gh auth login        (GitHub 認証)"
echo "  2. codex login          (Codex CLI に ChatGPT で認証)"
echo "  3. ssh-keygen -t ed25519 (SSH鍵生成、必要に応じて)"
echo "  4. exec zsh             (シェルをリロード)"

if [[ "$OS_TYPE" == "wsl" ]]; then
  echo ""
  echo "Windows 側の WezTerm 設定:"
  echo "  cp ~/dotfiles/wezterm/.wezterm.lua /mnt/c/Users/\$(cmd.exe /c 'echo %USERNAME%' 2>/dev/null | tr -d '\\r')/.wezterm.lua"
fi
