class RemoveFamilyNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :family_name, :string
  end
end
