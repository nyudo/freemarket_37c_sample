class MediumCategory < ApplicationRecord
  has_many :items
  validates :medium_category,presence: true
end
