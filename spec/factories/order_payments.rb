FactoryBot.define do
  factory :order_payment do

  postcode      { "123-4567" }
  prefecture_id { Faker::Number.between(from: 1, to: 47) }
  city          { Faker::Address.city }
  adress        { Faker::Address.street_address }
  building      { "南町1-2-3" }
  phone_num     { "07043211234" }
  token         { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
