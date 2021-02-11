FactoryBot.define do
  factory :purchase_data do
    postal_code { Faker::Number.number(digits: 7).to_s.insert(3, "-") }
    prefecture_id { rand(2...48) }
    city { Gimei.address.city.kanji }
    street_number { "緑区1-1-1" }
    building_name { Gimei.name.last.kanji + "ビル" }
    phone_number { Faker::Number.number(digits: 9) }
    token { 'sk_test_************' }
  end
end
