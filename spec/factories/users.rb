FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = "hoge12"
    password { password }
    password_confirmation { password }
    firstname { Gimei.first.kanji }
    lastname { Gimei.last.kanji }
    firstname_reading { Gimei.first.katakana }
    lastname_reading { Gimei.last.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
