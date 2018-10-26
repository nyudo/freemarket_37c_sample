class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string  :nickname, null: false
      t.string  :family_name, null: false
      t.string  :first_name, null: false
      t.string  :kana_family_name, null: false
      t.string  :kana_first_name, null: false
      t.string  :email_address, null:false, unique: true
      t.string  :password, null: false
      t.date    :birthday, null: false
      t.integer :prefecture, default: 0 ,null:false, foreign_key: true
      t.string  :city, null:false
      t.string  :address, null:false
      t.string  :residentill_name
      t.integer :phone_number, null:false
      t.integer :postal_code, null: false
      t.text    :profile
      t.index   :nickname
      t.timestamps
    end
  end
end
