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
|area|string|null:false|
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


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false,add_index,validates :items_name, length: { maximum: 40 }|
|image1|string|null:false|
|image2|string|-------|
|image3|string|-------|
|image4|string|-------|
|description|string|null:false,validates :description, length: { maximum: 1000 }|
|large_category|string|null:false|
|medium_category|string|null:false|
|small_category|string|null:false|
|brand|string|-------|
|size|string|-------|
|condition|string|null:false|
|charge_method|string|null:false|
|delivery_area|string|null:false|
|handling_time|string|null:false|
|price|integer|null:false,validates :price,:greater_than => 299,:less_than => 10000000|
|user_id|string|null: false, foreign_key: true, add_index|
|saler_id|integer|add_index,foreign_key:true|
|buyer_id|integer|add_index,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :saler, class_name:"User"
- belongs_to :buyer, class_name:"User"
