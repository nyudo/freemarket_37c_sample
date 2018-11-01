class RemoveProfileFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :profile, :text
  end
end
