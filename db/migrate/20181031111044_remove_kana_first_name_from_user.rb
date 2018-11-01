class RemoveKanaFirstNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :kana_first_name, :string
  end
end
