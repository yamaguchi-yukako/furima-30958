# README

## users テーブル

| Column | Type | Options |
| ---------- | ---------- | ——————————————— |
| nickname  | string | null: false |
| email | string |  null: false, unique: true |
| encrypted_password | string | null: false |
| first_name | string | null:false |
| family_name |string |null:false |
| first_name_kana | string | null:false | 
| family_name_kana | string | null:false |
| birth_year | date | null:false |
| birth_month | date | null:false |
| birth_day | date | null:false |


### Association

- has_many :items
- has_many :orders

## shipping_addresses テーブル

| Column | Type | Options |
| --------- | ---------- | ——————————————— |
| post_code | string | null:false |
| prefecture_code_id | integer | null:false |
| city | string | null:false |
| house_number |string | null:false |
| building_name	| string |
| phone_number |string | null:false |
| order | references | null: false, foreign_key: true |
| seller_id |references | foreign_key: true |

### Association

- belongs_to :order
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'


## items テーブル

| Column | Type | Options |
| ---------- | ---------- | ——————————————— |
| name | string | null: false |
| text | text | null: false |
| price | integer | null: false |
| category | references | null: false, foreign_key: true |
| condition | references | null: false,foreign_key: true |
| cost_id | references	| null: false,foreign_key: true |
| prefecture_code | integer | null: false |
| day | references | null: false, foreign_key: true |
| deal_closed_date | timestamp |


### Association

- belongs_to :user
- has_many :orders
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'

## orders テーブル

| Column | Type | Options |
| ---------- | ---------- | ------------------------------ |
| user_id | string | null: false |
| item_id | string | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

#Gem：jp_prefecture 書く
#イメージではアクティブストレージを使用する
#アクティブハッシュを使う
#カードはdbに保存しないためテーブルを作成しない

