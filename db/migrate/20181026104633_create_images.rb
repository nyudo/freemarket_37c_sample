class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :item_id,null:false,foreign_key:true
      t.index :item_id
      t.timestamps
    end
  end
end
