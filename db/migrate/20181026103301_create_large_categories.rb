class CreateLargeCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :large_categories do |t|
      t.text :large_category
      t.timestamps
    end
  end
end
