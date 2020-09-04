class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one_attached :image

  #バリデーション
  validates :image,              presence: true
  validates :name,               presence: true
  validates :description,        presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,        numericality: { other_than: 1 }
  validates :condition_id,       numericality: { other_than: 1 }
  validates :shipping_burden_id, numericality: { other_than: 1 }
  validates :shipping_region_id, numericality: { other_than: 1 }
  validates :shipping_day_id,    numericality: { other_than: 1 }
  validates :price,              presence: true, numericality: { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
end
