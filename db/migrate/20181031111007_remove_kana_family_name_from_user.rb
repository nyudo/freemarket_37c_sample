class RemoveKanaFamilyNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :kana_family_name, :string
  end
end
