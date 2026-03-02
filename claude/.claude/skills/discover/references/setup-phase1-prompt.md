# サブフェーズ1 環境構築プロンプト

以下の手順で成果物用のディレクトリとスケルトンファイルを作成せよ。

## 手順

1. `docs/requirements/` ディレクトリを作成する（存在しない場合）
2. 以下の3ファイルのスケルトンを作成する

| 作成先 | テンプレート |
|--------|------------|
| `docs/requirements/business-flow.md` | `references/business-flow.md` |
| `docs/requirements/domain-model.md` | `references/domain-model.md` |
| `docs/requirements/unconfirmed-items.md` | `references/unconfirmed-items.md` |

## スケルトン作成ルール

- 各テンプレートファイルを読み込み、その構造（見出し・テーブルヘッダ等）を維持する
- サンプルデータ・プレースホルダ行は削除し、空のテーブルや「（対話を通じて記述予定）」で埋める
- `最終更新` の日付は今日の日付を入れる
- Mermaidコードブロックのサンプルは削除する（見出しのみ残す）

## 完了条件

- `docs/requirements/` ディレクトリが存在する
- 上記3ファイルがすべて作成されている
- 各ファイルがテンプレートの見出し構造に準拠している
