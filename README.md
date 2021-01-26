# テーブル設計

## users テーブル

| Column            | Type    | Options      |
| ----------------- |---------|--------------|
| nickname          | string  | null: false  |
| email             | string  | null: false  |
| encrypted_password| string  | null: false  |
| lastname          | string  | null: false  |
| firstname         | string  | null: false  |
| lastname_reading  | string  | null: false  |
| firstname_reading | string  | null: false  |
| birthday          | date    | null: false  |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| burden_id           | integer    | null: false                    |
| consignor_region_id | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- has_one :purchase_record
- belongs_to :user

## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    | 
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| street_number      | string     | null: false                    | 
| building_name      | string     |                                | 
| phone_number       | string     | null: false                    | 
| purchase_record    | references | null: false, foreign_key: true | 

### Association

- belongs_to :purchase_record
