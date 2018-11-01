class RemoveBirthdayFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :birthday, :date
  end
end
