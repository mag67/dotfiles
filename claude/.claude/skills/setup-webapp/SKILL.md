---
name: setup-webapp
description: "WEBアプリ開発環境を対話的にセットアップする。技術選定に意思決定マトリクスを用い、主要な決定をADRとして記録する。"
argument-hint: "[プロジェクト名]"
disable-model-invocation: true
allowed-tools:
  - Bash(npx create-* *)
  - Bash(npx --yes create-* *)
  - Bash(npm install *)
  - Bash(npm init *)
  - Bash(npm run *)
  - Bash(npm audit *)
  - Bash(npm view *)
  - Bash(npm create *)
  - Bash(pnpm install *)
  - Bash(pnpm create *)
  - Bash(pnpm run *)
  - Bash(pnpm add *)
  - Bash(pnpm dlx *)
  - Bash(bun install *)
  - Bash(bun create *)
  - Bash(bun run *)
  - Bash(bun add *)
  - Bash(bunx *)
  - Bash(git init *)
  - Bash(git add *)
  - Bash(git commit *)
  - Bash(mkdir *)
  - Bash(cp *)
  - Bash(chmod *)
  - Bash(node --version)
  - Bash(node -e *)
  - Bash(docker --version)
  - Bash(docker compose *)
  - Bash(bash *)
  - Bash(sh *)
  - Bash(uname *)
  - Bash(ls *)
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
  - WebSearch
  - WebFetch
  - Agent
---

# WEBアプリ環境構築ワークフロー

## 動的コンテキスト

- Node.js: !`node --version 2>/dev/null || echo "未インストール"`
- npm: !`npm --version 2>/dev/null || echo "未インストール"`
- OS: !`uname -s`
- 日付: !`date +%Y-%m-%d`

---

## Phase 0: 前提チェック

1. `scripts/check-prerequisites.sh` を実行する
2. カレントディレクトリが空であることを確認（空でなければ中断）
3. `$ARGUMENTS` があればプロジェクト名として使用、なければ AskUserQuestion で確認

---

## Phase 1: 理解 — 制約・要求の把握

Design It! の ASR（Architecturally Significant Requirements）に基づき、
ユーザーの要求を体系的に収集する。

### 1a. プロジェクト概要（Point-of-View Mad Lib）

AskUserQuestion で以下を聞く:
- どのようなアプリを作るか（種類・目的・対象ユーザー）
- 穴埋め: 「[対象ユーザー]は[達成したいこと]のために[このアプリ]を必要としている」

### 1b. 制約の確認

AskUserQuestion で変更不可の前提条件を確認:
- 使用必須の言語・ランタイム
- ホスティング先の指定
- チーム・組織の技術的制約
- 予算・ライセンスの制約

### 1c. 品質特性の優先順位（Choose One Thing）

[decision-guide.md](decision-guide.md) の「Choose One Thing テンプレート」に従い、
AskUserQuestion で二択質問を3問以内で行う。

---

## Phase 2: 探求 — 技術スタック選定

### 2a. 技術調査

Phase 1 の結果をもとに WebSearch / Agent で各カテゴリの
最新技術を調査し、候補を3〜5個に絞る。
調査カテゴリ:
1. フレームワーク
2. パッケージマネージャー
3. DB + ORM
4. 認証
5. CSS スタイリング
6. デプロイ先

### 2b. 意思決定マトリクス提示

[decision-guide.md](decision-guide.md) の手法に従い、
**変更コスト高**のカテゴリのみマトリクスで提示する。
変更コスト低の項目はデフォルト推奨を一括提示。

### 2c. ユーザー決定

- 変更コスト高 → AskUserQuestion で明示的に質問
- 変更コスト低 → デフォルト推奨を提示し、異論がなければそのまま採用

### 2d. 最終構成の確認

全カテゴリの選定結果を一覧表示し、ユーザーの最終承認を得る。

---

## Phase 3: 作成 — 環境構築

実行前にドライラン（操作一覧）を表示してユーザー確認を挟む。
テンプレートファイルは使わず、すべてその場で生成する。

### 3a. プロジェクト初期化

1. `.gitignore` 生成（`.env*` 除外を含む）— **最初に実行**
2. `git init`
3. 公式CLIでスキャフォールディング（`@latest` 使用）
4. `.nvmrc` + `package.json` volta キー生成

### 3b. 開発ツールチェーン

1. リンター/フォーマッター設定（`biome init` 等の公式コマンド優先）
2. Git hooks（Husky + lint-staged）
3. `.editorconfig` 生成

### 3c. インフラ・DB（選択に応じて）

1. `docker-compose.yml` 生成（DB, キャッシュ等）
2. `.env.example`（プレースホルダーのみ）
3. `.env.local`（コピー + 設定案内）
4. ORM 初期設定

### 3d. CI/CD

1. `.github/workflows/ci.yml` 生成

### 3e. セキュリティデフォルト

1. フレームワーク別セキュリティヘッダー設定

---

## Phase 4: 評価 — 動作確認・記録

### 4a. 動作確認

1. 依存関係インストール
2. ビルド確認
3. `npm audit` 実行

### 4b. ADR 生成

[adr-template.md](adr-template.md) を参照し、変更コストが高い技術選定
（フレームワーク、DB、ORM、認証、デプロイ先）について
MADR 形式の ADR を `docs/adr/` に生成する。
各 ADR には「選ばなかった選択肢（Paths Not Taken）」を含める。

### 4c. 完了サマリー

以下を表示する:
- 構築結果の要約（選定スタック一覧）
- 開発サーバーの起動方法
- 次のステップの案内
