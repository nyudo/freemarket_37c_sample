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
|prefecture_id|integer|null:false, foreign_key: true|
|city|string|null:false|
|address|string|null:false|
|residential_name|string|-------|
|phone_number|integer|null:false|
|postal_code|integer|null:false|
|profile|text|-------|

### Association
- has_many :items, dependent: :destroy
- has_many :bought_items, foreign_key:"buyer_id",class_name:"Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
- belongs_to :prefecture
- has_many :likes,dependent: :desrtroy
- has_many :evaluations
- has_many :todos, dependent: :destroy
- has_many :points, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true, add_index|
|image|string|-------|

### Association
belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false,add_index,validates :items_name, length: { maximum: 40 }|
|description|string|null:false,validates :description, length: { maximum: 1000 }|
|size|string|-------|
|condition|string|null:false|
|charge_method|string|null:false|
|prefecture_id|integer|null:false, foreign_key: true|
|handling_time|string|null:false|
|price|integer|null:false,validates :price,:greater_than => 299,:less_than => 10000000|
|user_id|string|null: false, foreign_key: true, add_index|
|saler_id|integer|add_index,foreign_key:true|
|buyer_id|integer|add_index,foreign_key:true|
|Large_category_id|integer|null:false, foreign_key: true|
|medium_category_id|integer|null:false, foreign_key: true|
|small_category_id|integer|null:false, foreign_key: true|
|bland_id|integer|add_index,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :saler, class_name:"User"
- belongs_to :buyer, class_name:"User"
- belongs_to :large_category
- belongs_to :medium_category
- belongs_to :small_category
- belongs_to :bland
- belongs_to :prefecture
- has_many :likes,dependent: :destroy
- has_many :todos, dependent: :destroy
- has_many :images, dependent: :destroy

## large_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|Large_category|text|add_index|

### Association
- has_many :items

## medium_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|medium_category|text|add_index|

### Association
- has_many :items

## small_categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|small_category|text|add_index|

### Association
- has_many :items


## blandsテーブル

|Column|Type|Options|
|------|----|-------|
|bland|text|add_index|

### Association
- has_many :items

## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|text|add_index|
### Association
- has_many :users
- has_many :items

##likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|string|null: false, foreign_key: true, add_index|
|item_id|string|null: false, foreign_key: true, add_index|

### Association
- belongs_to :item
- belongs_to :user

##evaluations テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|evaluated_user_id|references|null: false, foreign_key: true|
|evaluation|integer|enum status: { good: 0, medium: 1, bad: 2 }|

### Association
- belongs_to :user
- belongs_to :evaluated_user, class_name:"User", foreign_key: :evaluated_user_id

##todos テーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null:false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

##points テーブル
|Column|Type|Options|
|------|----|-------|
|points|integer|null:false|
|limit|date|-------|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
