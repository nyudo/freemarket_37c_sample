class SmallCategory < ApplicationRecord
  has_many :items
  has_many :blands, through: :items
  validates :small_category,presence: true
end
