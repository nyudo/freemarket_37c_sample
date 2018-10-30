class AddDeliveryMethodToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :delivery_method, :string
  end
end
