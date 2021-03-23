FactoryBot.define do
  factory :shipping_address do
    postal_code { "123-4567" }
    prefecture_code_id { 1 }
    city { "横浜市緑区" }
    house_number { "青山1−1−1" }
    building_name { "柳ビル" }
    phone_number { "09012345678" }
    
  end
end
