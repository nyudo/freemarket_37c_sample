class RemoveResidentialNameFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :residential_name, :string
  end
end
