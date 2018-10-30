require 'rails_helper'
describe Item do
  describe '#create' do
    it "is invalid without a item_name" do
     user = Item.new(item_name: "", description: "シャツ", size: "L", password_confirmation: "00000000")
     user.valid?
     expect(item.errors[:item_name]).to include("can't be blank")
    end
  end
end
