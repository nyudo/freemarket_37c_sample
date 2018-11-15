class Bland < ApplicationRecord
  has_many :items
  has_many :small_categories, through: :items
  accepts_nested_attributes_for :items
end
