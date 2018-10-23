# README

## usersテーブル

|Column|Type|Options|Remarks|
|------|----|-------|-------|
|nickname|string|null:false,add_index|-------|
|family_name|string|null:false|-------|
|first_name|string|null:false|-------|
|kana_family_name|string|null:false|-------|
|kana_first_name|string|null:false|-------|
|email_address|string|uniqueness:true,null:false|-------|
|password|string|null:false|-------|
|birthday|date|null:false|-------|
|prefecture|integer|null:false, foreign_key: true|enum prefectures: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }|-------|
|city|string|null:false|-------|
|address|string|null:false|-------|
|residential_name|string|-------|-------|
|phone_number|integer|null:false|-------|
|postal_code|integer|null:false|-------|
|profile|text|-------|-------|

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

|Column|Type|Options|Remarks|
|------|----|-------|-------|
|item_name|string|null:false,add_index,validates :items_name, length: { maximum: 40 }|-------|
|description|string|null:false,validates :description, length: { maximum: 1000 }|-------|
|size|string|-------|-------|
|condition|string|null:false|-------|
|charge_method|string|null:false|-------|
|prefecture|integer|null:false, foreign_key: true|enum prefectures: {
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }|-------|
|handling_time|string|null:false|-------|
|price|integer|null:false,validates :price,:greater_than => 299,:less_than => 10000000|-------|
|user_id|string|null: false, foreign_key: true, add_index|-------|
|saler_id|integer|add_index,foreign_key:true|-------|
|buyer_id|integer|add_index,foreign_key:true|-------|
|Large_category_id|integer|null:false, foreign_key: true|-------|
|medium_category_id|integer|null:false, foreign_key: true|-------|
|small_category_id|integer|null:false, foreign_key: true|-------|
|bland_id|integer|add_index,foreign_key:true|-------|

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
