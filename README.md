# テーブル設計

## users テーブル

| Column           | Type    | Options      |
| -----------------|---------|--------------|
| nickname         | string  | null: false  |
| email            | string  | null: false  |
| password         | string  | null: false  |
| lastname         | string  | null: false  |
| firstname        | string  | null: false  |
| lastname_reading | string  | null: false  |
| firstname_reading| string  | null: false  |
| birthday_year    | integer | null: false  |
| birthday_month   | integer | null: false  |
| birthday_day     | integer | null: false  |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| category         | integer    | null: false                    |
| condition        | integer    | null: false                    |
| burden           | integer    | null: false                    |
| consignor_region | integer    | null: false                    |
| shipping_days    | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- has_one :shipping_record
- belongs_to :user

## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_information   | string     | null: false                    | 
| expiration_month   | integer    | null: false                    |
| expiration_year    | integer    | null: false                    |
| security_code      | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    | 
| prefecture         | integer    | null: false                    |
| city               | string     | null: false                    |
| street_number      | string     | null: false                    | 
| building_name      | string     | null: false                    | 
| phone_number       | string     | null: false                    | 
| purchase_record_id | references | null: false, foreign_key: true | 

### Association

- belongs_to :purchase_record
