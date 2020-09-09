class Purchase < ApplicationRecord

  # アソシエーション
  belongs_to :user
  belongs_to :item
  has_one :sending_destination
  
  validates :price, presence: true
  validates :token, presence: true
  attr_accessor :token
end
