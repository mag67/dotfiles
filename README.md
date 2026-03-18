# dotfiles

tmux + Neovim + WezTerm による個人開発環境の設定ファイル。

## セットアップ

```sh
git clone https://github.com/yusakukomuro/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow */          # 各ディレクトリのシンボリックリンクを作成
mise install     # CLI ツールをインストール
./vscode/install.sh  # VSCode設定のセットアップ（クロスプラットフォーム対応）
```

## 使い方

```sh
# tmux セッション開始
tmux new -s dev
```

## 含まれるもの

| ディレクトリ | ツール | 用途 |
|---|---|---|
| `zsh/` | zsh + Oh My Zsh | シェル |
| `nvim/` | Neovim + LazyVim | エディタ |
| `tmux/` | tmux | ターミナルマルチプレクサ |
| `wezterm/` | WezTerm | ターミナルエミュレータ |
| `git/` | Git | バージョン管理 |
| `lazygit/` | LazyGit | Git TUI |
| `mise/` | mise | ランタイム・CLI 管理 |
| `gh/` | GitHub CLI | GitHub 操作 |
| `claude/` | Claude Code | AI コーディングアシスタント（Skills・CLAUDE.md） |
| `vscode/` | VSCode | エディタ（GUI）※install.sh で管理 |

`claude/.claude/skills` は共有スキル置き場 `../.agents/skills` を参照する symlink として管理する。
