class RemovePrefuctureFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :prefecture, :integer
  end
end
