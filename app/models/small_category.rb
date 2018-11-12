class SmallCategory < ApplicationRecord
  has_many :items
  validates :small_category,presence: true
end
