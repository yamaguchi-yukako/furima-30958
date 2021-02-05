FactoryBot.define do
  factory :user do
    nickname { "フリマ弥太郎" }
    last_name { "山田" }
    first_name { "弥太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "ヤタロウ" }
    birth_date { "1931-01-01" }
    email {"kkk@e"}
    password = Faker::Internet.password(min_length: 6)
    password {"12345a"}
    password_confirmation {"12345a"}
  end
end