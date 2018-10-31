class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :nickname, null: false
      t.integer :user_detail_id
      t.index   :nickname
      t.timestamps
    end
  end
end
