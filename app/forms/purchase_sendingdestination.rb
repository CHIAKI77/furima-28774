class PurchaseSendingdestination

  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture, :city, :house_number, :building_name,:phone_number, :user_id, :item_id

  validates :token, presence: true
  # モデルのsending_destinationから移行記述した
  validates :post_code,     presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture,    numericality: { other_than: 1 }
  validates :city,          presence: true
  validates :house_number,  presence: true
  # validates :building_name, presence: true
  validates :phone_number,  presence: true

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    # user = User.create(name: name, name_reading: name_reading, nickname: nickname)
    # 住所の情報を保存
    Sending_destination.create(post_code: post_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
    # 寄付金の情報を保存
    Purchase.create(item_id: item_id, user_id: user.id)
  end

end