FactoryBot.define do
  factory :item do
    name { 'テスト' }
    description { 'テスト' }
    category_id { 2 }
    condition_id { 2 }
    shipping_burden_id { 2 }
    shipping_region_id { 2 }
    shipping_day_id { 2 }
    price { '10000' }
    user
  end
end
