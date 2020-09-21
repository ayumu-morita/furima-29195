FactoryBot.define do
  factory :user_address do
    token                { 'pk_test_000000000000000' }
    post_code            { '123-4567' }
    prefecture_id        { 3 }
    city                 { '横浜市' }
    address              { '青山2-1' }
    building             { 'ラフォーレ高橋' }
    phone_number         { '08000000000' }
    user_id              { FactoryBot.create(:user).id }
    item_id              { FactoryBot.create(:item).id }
  end
end
