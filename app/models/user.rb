class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one  :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail, update_only: true
  has_many :items, dependent: :destroy
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, ->{where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, ->{where("buyer_id is not NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :likes, dependent: :destroy
  has_many :evaluations
  has_many :todos, dependent: :destroy
  has_many :points, dependent: :destroy

  validates :nickname, presence: true, length: { maximum:10 }
end
