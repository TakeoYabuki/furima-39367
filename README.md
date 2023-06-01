# テーブル設計

## users テーブル

| Column             |  Type  | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :purchases 

## items テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | -------------------------------|
| image              | string     | null: false                    |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| postage            | string     | null: false                    |
| address            | references | null: false, foreign_key: true |
| delivery_days      | string     | null: false,                   |
| price              | string     | null: false,                   |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル 

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column             |  Type      | Options                        |
| ------------------ | ---------- | -------------------------------|
| zip-code           | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase