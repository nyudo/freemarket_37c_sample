class CreateBlands < ActiveRecord::Migration[5.1]
  def change
    create_table :blands do |t|
      t.text :bland
      t.timestamps
    end
  end
end
