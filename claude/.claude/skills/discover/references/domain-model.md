# ドメインモデルテンプレート (`domain-model.md`)

````markdown
# ドメインモデル

> 最終更新: YYYY-MM-DD ｜ サブフェーズ1で作成、サブフェーズ2で更新

## モデル図

```mermaid
classDiagram
    class EntityName {
        +id: string
        +name: string
        +status: EntityStatus
        +createdAt: Date
    }
    class RelatedEntity {
        +id: string
        +entityId: string
    }
    EntityName "1" --> "*" RelatedEntity
```

## エンティティ詳細

### （エンティティ名）（日本語名）

- **説明**: （このエンティティが表す概念）
- **主な属性**:
  - `id`: 一意識別子
  - `name`: （属性の説明）
  - `status`: （ステータスの種類を列挙）
- **関連**: （他エンティティとの関係を記述）
- **備考**: （補足事項）

（エンティティの数だけ繰り返す）

## 値オブジェクト

| 名前 | 型 | 取りうる値 | 説明 |
|------|---|-----------|------|
| （例: OrderStatus） | enum | pending, confirmed, shipped, delivered | 注文のステータス |

## 境界づけられたコンテキスト

```mermaid
graph TB
    subgraph ContextA["コンテキストA"]
        Entity1[エンティティ1]
        Entity2[エンティティ2]
    end
    subgraph ContextB["コンテキストB"]
        Entity3[エンティティ3]
    end
    ContextA -.->|連携| ContextB
```

| コンテキスト | 含まれるエンティティ | 責務 |
|------------|-------------------|------|
| （コンテキスト名） | （エンティティ一覧） | （このコンテキストの責務） |
````
