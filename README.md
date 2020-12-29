# テーブル設計

## users テーブル

| Column                | Type    | Options                     |
| ----------------------| ------- | --------------------------- |
| nickname              | string  | null: false                 |
| email                 | string  | null: false,unique: true    |
| password              | string  | null: false                 |
| password_confirmation | string  | null: false                 |
| first_name            | string  | null: false                 |
| last_name             | string  | null: false                 |
| first_name_kana       | string  | null: false                 |
| last_name_kana        | string  | null: false                 |
| birth_date            | string  | null: false                 |

### Association
- has_many :items
- has_many :comments
- has_one :order
- has_one :address

## itemsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| product_name       | string     | null: false                   |
| description        | text       | null: false                   |
| category           | integer    | null: false                   |
| condition          | integer    | null: false                   |
| shipping_charge    | integer    | null: false                   |
| area               | integer    | null: false                   |
| deadline           | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_one :address

## ordersテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false,foreign_key: true |
| item               | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| postal_code        | string     | null: false                   |
| prefecture         | integer    | null: false                   |
| city               | string     | null: false                   |
| house_number       | string     |                               |
| building_name      | string     |                               |
| phone              | string     | null: false                   |
| item               | references | null: false,foreign_key: true |
| user               | references | null: false,foreign_key: true | 

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| text               | text       | null: false                   |
| user               | references | null: false,foreign_key: true |
| item               | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item