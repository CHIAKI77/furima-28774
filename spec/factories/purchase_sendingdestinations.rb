FactoryBot.define do
  factory :purchase_sendingdestination do
    token { '4242424242424242' }
    post_code { '111-1111' }
    prefecture_id { 2 }
    city { '港区' }
    house_number { '1-1-1' }
    phone_number { '09012345678' }
  end
end
