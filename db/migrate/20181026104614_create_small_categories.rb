class CreateSmallCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :small_categories do |t|
      t.text :small_category
      t.timestamps
    end
  end
end
