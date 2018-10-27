class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name,null:false
      t.string :description,null:false
      t.string :size
      t.string :condition,null:false
      t.string :charge_method,null:false
      t.integer :prefecure,null:false,foreign_key:true
      t.string :handling_time,null:false
      t.integer :price,null:false
      t.integer :user_id,null:false,foreign_key: true
      t.integer :saler_id,foreign_key:true
      t.integer :buyer_id,foreign_key:true
      t.integer :large_category_id,null:false,foreign_key:true
      t.integer :medium_category_id,null:false,foreign_key:true
      t.integer :small_category_id,null:false,foreign_key:true
      t.integer :bland_id,foreign_key:true
      t.index [:user_id, :saler_id, :buyer_id, :bland_id]
      t.timestamps
    end
  end
end

