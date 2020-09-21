FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 6) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) + "1a"}
    password_confirmation { password }
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1212-12-12' }
  end
end
