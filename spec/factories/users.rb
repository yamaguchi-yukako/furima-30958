FactoryBot.define do
  factory :user do
    nickname { "フリマ弥太郎" }
    last_name { "山田" }
    first_name { "弥太郎" }
    last_name_kana { "ヤマダ" }
    first_name_kana { "ヤタロウ" }
    date_of_birth { "1931-01-01" }
    email                 {Faker::Internet.free_email}
    password {"12345a"}
  end
end
