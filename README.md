# テーブル設計

## User テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| nickname            | string     | null: false       |
| email               | integer    | unique: true      |
| encrypted_password  | integer    | unique: true      |
| first_name          | string     | null: false       |
| first_name_kana     | string     | null: false       |
| last_name           | string     | null: false       |
| last_name_kana      | string     | null: false       |
| birthday            | date       | null: false       |

### Association

- has_many :items
- has_many :orders

## Item テーブル

| Column              | Type       | Options           |
| --------------      | ---------- | ----------------- |
| item_name           | string     | null: false       |
| description         | text       | null: false       |
| category_id         | integer    | null: false       |
| condition_id        | integer    | null: false       |
| postage_payer_id    | integer    | null: false       |
| postage_area_id     | integer    | null: false       |
| postage_day_id      | integer    | null: false       |
| item_price          | integer    | null: false       |
| user                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to :category_id
- belongs_to :condition_id 
- belongs_to :postage_payer_id
- belongs_to :postage_area_id 
- belongs_to :postage_day_id

## Order テーブル

| Column      | Type       | Options                                        |
| ----------- | ---------- | ---------------------------------------------- |
| user        | reference  | null: false, foreign_key: { to_table: :users } |
| item        | reference  | null: false, foreign_key: true                 |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## Address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phon_number   | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to :prefecture_id