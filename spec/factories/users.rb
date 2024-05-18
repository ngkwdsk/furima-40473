FactoryBot.define do
  factory :user do
    nickname { Faker::Name.nickname }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana { Faker::Name.last_name_kana }
    first_name_kana { Faker::Name.first_name_kana }
    birthday { Faker::Date.birthday }
  end
end
