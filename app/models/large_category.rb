class LargeCategory < ApplicationRecord
  has_many :items
  validates :large_category,presence: true
end
