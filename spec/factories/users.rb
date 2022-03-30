FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '隆太郎' }
    last_name_katakana    { 'ヤマダ' }
    first_name_katakana   { 'リクタロウ' }
    birthday              { Faker::Date.birthday }
  end
end
