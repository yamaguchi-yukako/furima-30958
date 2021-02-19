FactoryBot.define do
  factory :item do
    name { "商品名が必要" }
    price { 300 }
    info { "商品の説明" }
    category_id { 1 }
    condition_id { 1 }
    cost_id { 1 }
    prefecture_code_id {1 }
    day_id { 1 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
