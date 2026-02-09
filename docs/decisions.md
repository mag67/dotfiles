# ツール選定理由

> 各ツールの選定理由と検討した代替案の記録。草案のため実際の意図と異なる部分は適宜修正してください。

## シェル: zsh + Oh My Zsh

- **選定**: macOS と揃えるため
- **比較**: bash, fish

## エディタ: Neovim + LazyVim

- **選定**: Lua ベースのモダンな設定。LazyVim により LSP 等の設定が不要
- **比較**: Vim, VSCode, NvChad, AstroNvim

## ターミナルエミュレータ: WezTerm

- **選定**: macOS と揃えるため。WSL2 ネイティブ対応
- **比較**: iTerm2, Alacritty, Kitty

## ターミナルマルチプレクサ: Zellij

- **選定**: tmux と比較して画面にコマンドが表示されるため初心者にも分かりやすい
- **比較**: tmux, screen

## バージョン管理: mise

- **選定**: 単一ツールで複数言語のバージョンを管理。Rust 製で高速
- **比較**: asdf, nvm/nodenv 等の個別ツール

## Git TUI: LazyGit

- **選定**: ターミナル上で直感的に Git 操作ができる
- **比較**: tig, GitUI

## CLI ユーティリティ

### fd

- **選定**: find の代替。`.gitignore` 対応で高速
- **比較**: find

### ripgrep (rg)

- **選定**: grep の代替。`.gitignore` 対応で高速
- **比較**: grep, ag

### fzf

- **選定**: 汎用ファジーファインダー
- **比較**: peco, percol

### zoxide

- **選定**: cd の代替。訪問頻度ベースのディレクトリジャンプ
- **比較**: autojump, z

### yazi

- **選定**: 高速なターミナルファイルマネージャ。非同期 I/O・画像プレビュー対応
- **比較**: ranger, lf

## dotfiles 管理: GNU Stow

- **選定**: シンボリックリンクによるシンプルな管理。パッケージ単位でディレクトリを分割
- **比較**: chezmoi, yadm, 手動 ln -s

## AI 開発支援: Claude Code

- **選定**: ターミナル完結のコーディング支援。Zellij と組み合わせて並列作業が可能
- **比較**: GitHub Copilot CLI, aider

## AI 開発支援: OpenAI Codex CLI

- **選定**: ChatGPT Pro プランを活用した AI コーディング支援。Claude Code との併用で多角的な支援が可能
- **比較**: Claude Code (Anthropic), GitHub Copilot CLI, aider
- **インストール**: npm (クロスプラットフォーム対応)。macOS では Homebrew cask も利用可能

## パッケージマネージャ: Homebrew

- **選定**: macOS/Linux 両対応。Brewfile による宣言的管理
- **比較**: apt 等の OS ネイティブ, Nix
