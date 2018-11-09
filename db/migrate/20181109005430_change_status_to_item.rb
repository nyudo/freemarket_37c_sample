class ChangeStatusToItem < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :status, :integer
  end
end
