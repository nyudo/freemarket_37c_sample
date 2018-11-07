require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with a item_name, description, size, condition, charge_method, prefecture, handling_time,price,user_id,saler_id,buyer_id,large_category_id,medium_category_id,small_category_id,bland_id,delivery_method" do
      item = build(:item)
      expect(item).to be_valid
    end
    it "is invalid without a item_name" do
     item = build(:item, item_name: nil)
     expect(item).to be_invalid
    end
    it "is invalid without a description" do
      item = build(:item, description: nil)
      expect(item).to be_invalid
    end
    it "is invalid without condirion" do
      item = build(:item, condition: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a charge_method" do
      item = build(:item, charge_method: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a prefecuture" do
      item = build(:item, prefecture: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a price" do
      item = build(:item, price: nil)
      expect(item).to be_invalid
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a large_category_id" do
      item = build(:item, large_category_id: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a medium_category_id" do
      item = build(:item, medium_category_id: nil)
      expect(item).to be_invalid
    end
    it "is invalid without a small_category_id" do
      item = build(:item, small_category_id: nil)
      expect(item).to be_invalid
    end
    it "is valid with price that has less than 10000000 numbers " do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end
    it "is valid with price that has more than or equal to 10000000 numbers " do
      item = build(:item, price: 10000000)
      expect(item).to be_invalid
    end
    it "is valid with price that has greater_than 299 numbers" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end
    it "is valid with price that has less than or equal to 299 numbers" do
      item = build(:item, price: 299)
      expect(item).to be_invalid
    end
    it "is invalid with a item_name that has greater than 40 characters " do
      item = build(:item, item_name: "a"*41)
      expect(item).to be_invalid
    end

    it "is valid with a item_name that has less than or equal to 40 characters " do
      item = build(:item, item_name: "a"*40)
      expect(item).to be_valid
    end
    it "is valid with a description that has less than or equal to 1000 characters " do
      item = build(:item, description: "a"*1000)
      expect(item).to be_valid
    end
    it "is invalid with a description that has greater than 1000 characters " do
      item = build(:item, description: "a"*1001)
      expect(item).to be_invalid
    end

  end
end
