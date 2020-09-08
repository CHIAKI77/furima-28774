class SendingDestination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :city

  # アソシエーション
  belongs_to :purchase

  # バリデーション
  validates :post_code,     presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :name,          presence: true
  validates :city,          numericality: { other_than: 1 }
  validates :house_number,  presence: true
  validates :building_name, presence: true
  validates :phone_number,  presence: true

end
