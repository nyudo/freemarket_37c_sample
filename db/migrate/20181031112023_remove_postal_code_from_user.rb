class RemovePostalCodeFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :postal_code, :integer
  end
end
