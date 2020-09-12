class SendingDestination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # アソシエーション
  belongs_to :purchase

  # バリデーションはformオブジェクトの導入によりpurchase_sendingdestination.rbに移行記述した
end
