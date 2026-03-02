# サブフェーズ2 環境構築プロンプト

このプロンプトは呼び出し時に以下の補足情報が付与される:
- **方針**: `integrate`（既存アプリに統合）または `standalone`（独立プロジェクト作成）
- **既存アプリ情報**（方針が `integrate` の場合）: 技術スタック、ディレクトリ構成、使用中のUIライブラリ等

---

## 方針A: 既存アプリに統合 (`integrate`)

### 1. 既存プロジェクトの確認

- `package.json` を読み、フレームワーク・UIライブラリ・ルーティングライブラリを特定する
- 既存のディレクトリ構成（`src/`, `app/`, `pages/` 等）を確認する
- 既存のルーティング設定を確認する

### 2. モックアップ用ディレクトリの作成

既存プロジェクトの規約に従い、モックアップ用のディレクトリを作成する。例:

- Next.js App Router: `app/(mockup)/` または `app/mockup/`
- Next.js Pages Router: `pages/mockup/`
- React Router: `src/pages/mockup/` または `src/mockup/`
- その他: 既存構造に合わせて判断

### 3. 不足する依存関係のインストール

既存プロジェクトに不足している依存関係があればインストールする。既にインストール済みのものは追加しない。

### 4. 成果物スケルトンの作成

「共通: 成果物スケルトンの作成」セクションを参照。

### 完了条件

- 既存プロジェクト内にモックアップ用ディレクトリが作成されている
- 既存のビルド・開発サーバーが正常に動作する（壊していない）
- `docs/requirements/requirements-table.md` と `docs/requirements/usecases.md` が作成されている

---

## 方針B: 独立プロジェクト作成 (`standalone`)

### 1. モックアップ用Reactプロジェクトの初期化

```bash
cd docs/requirements/
npm create vite@latest mockup -- --template react-ts
cd mockup
npm install
```

### 2. UIライブラリの選定とインストール

WebSearchで該当ドメインの業務システムに適したUIライブラリを調査し、以下の基準で選定する:

- 業務システム向けのコンポーネントが豊富（テーブル、フォーム、モーダル等）
- TypeScriptサポートが充実
- ドキュメントが整備されている

選定後、インストールする:

```bash
npm install （選定したUIライブラリ）
```

### 3. 基本依存関係のインストール

```bash
npm install react-router-dom
```

### 4. 基本的なプロジェクト構成の作成

`src/` 配下に以下のディレクトリを作成:

```
src/
├── components/    # 共通コンポーネント
├── pages/         # 画面コンポーネント
├── layouts/       # レイアウトコンポーネント
├── data/          # ダミーデータ
└── types/         # TypeScript型定義
```

### 5. 成果物スケルトンの作成

「共通: 成果物スケルトンの作成」セクションを参照。

### 完了条件

- `docs/requirements/mockup/` がReact + Vite + TypeScriptプロジェクトとして初期化されている
- `npm install` が完了し `node_modules/` が存在する
- UIライブラリとreact-router-domがインストールされている
- `src/` 配下に基本ディレクトリ構成が作成されている
- `docs/requirements/requirements-table.md` と `docs/requirements/usecases.md` が作成されている

---

## 共通: 成果物スケルトンの作成

以下の2ファイルを、テンプレートを読み込んでスケルトンとして作成する。

| 作成先 | テンプレート |
|--------|------------|
| `docs/requirements/requirements-table.md` | `references/requirements-table.md` |
| `docs/requirements/usecases.md` | `references/usecases.md` |

### スケルトン作成ルール

- 各テンプレートファイルを読み込み、その構造（見出し・テーブルヘッダ等）を維持する
- サンプルデータ・プレースホルダ行は削除し、空のテーブルにする
- `最終更新` の日付は今日の日付を入れる
- サマリーの件数は `0件` にする
