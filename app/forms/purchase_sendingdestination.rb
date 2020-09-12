class PurchaseSendingdestination
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  validates :token, presence: true
  # モデルのsending_destinationから移行記述した
  validates :post_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city,          presence: true
  validates :house_number,  presence: true
  validates :phone_number,  presence: true, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    SendingDestination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
