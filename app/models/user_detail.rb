class UserDetail < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
end
