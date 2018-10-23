# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false,add_index|
|family_name|string|null:false|
|first_name|string|null:false|
|kana_family_name|string|null:false|
|kana_first_name|string|null:false|
|email_address|string|uniqueness:true,null:false|
|password|string|null:false|
|birthday|date|null:false|
|area_id|integer|null:false, foreign_key: true|
|city|string|null:false|
|address|string|null:false|
|residential_name|string|-------|
|phone_number|integer|null:false|
|postal_code|integer|null:false|
|profile|text|-------|

### Association
- has_many :items, dependent: :destroy
- has_many :buyed_items, foreign_key:"buyer_id",class_name:"Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- belongs_to :area

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false,add_index,validates :items_name, length: { maximum: 40 }|
|image1|string|null:false|
|image2|string|-------|
|image3|string|-------|
|image4|string|-------|
|description|string|null:false,validates :description, length: { maximum: 1000 }|
|size|string|-------|
|condition|string|null:false|
|charge_method|string|null:false|
|area_id|integer|null:false, foreign_key: true|
|handling_time|string|null:false|
|price|integer|null:false,validates :price,:greater_than => 299,:less_than => 10000000|
|user_id|string|null: false, foreign_key: true, add_index|
|saler_id|integer|add_index,foreign_key:true|
|buyer_id|integer|add_index,foreign_key:true|
|category_id|integer|-------|
|bland_id|integer|add_index,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :saler, class_name:"User"
- belongs_to :buyer, class_name:"User"
- belongs_to :category
- belongs_to :bland
- belongs_to :area

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|text|add_index|

### Association
- has_many :items


## blandsテーブル

|Column|Type|Options|
|------|----|-------|
|bland|text|add_index|

### Association
- has_many :items

## areasテーブル

|Column|Type|Options|
|------|----|-------|
|area|text|add_index|
### Association
- has_many :users
- has_many :items
