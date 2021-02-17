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

### Association

- belongs_to :order


## items テーブル

| Column | Type | Options |
| ---------- | ---------- | ——————————————— |
| name               | string | null: false |
| text               | text | null: false |
| price              | integer | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null:false |
| cost_id            | integer | null: false |
| prefecture_code_id | integer | null: false |
| day_id             | integer | null:false |


### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type | Options |
| ---------- | ---------- | ------------------------------ |
| user | references | null: false , foreign_key: true|
| item | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

#Gem：jp_prefecture 書く
#イメージではアクティブストレージを使用する
#アクティブハッシュを使う
#belongs_to_active_hash :category
#カードはdbに保存しないためテーブルを作成しない


