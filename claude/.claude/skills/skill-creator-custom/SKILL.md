---
name: skill-creator-custom
description: |
  スキルの新規作成・改善・eval実行を行うラッパースキル。ビルトイン skill-creator にカスタム執筆ガイドラインを適用する。
  スキル作成、スキル改善、SKILL.md 執筆・レビュー、スキルテスト、eval 実行に使用する。
---

# スキル作成・改善ラッパー

ビルトイン skill-creator の機能（作成・改善・eval）に、カスタム品質基準を上乗せする。

## 手順

1. `references/writing-guidelines.md` を読み込む。以降のすべての SKILL.md 生成・編集にこのガイドラインを適用する
2. Skill ツールで `skill-creator` を実行する
3. skill-creator の出力（SKILL.md）がガイドラインに準拠しているかチェックし、違反があれば修正する

## ガイドライン適用タイミング

- **生成時**: ガイドラインに沿って SKILL.md を生成する
- **編集時**: ガイドラインに沿って SKILL.md を編集する
- **eval 後の改善時**: ガイドラインに沿って改善する
- **最終レビュー**: `references/writing-guidelines.md` のチェックリストで確認する
