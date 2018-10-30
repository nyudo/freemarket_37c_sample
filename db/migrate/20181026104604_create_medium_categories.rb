class CreateMediumCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :medium_categories do |t|
      t.text :medium_category
      t.timestamps
    end
  end
end
