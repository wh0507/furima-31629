FactoryBot.define do
  factory :order_donation do
    token            { 'tok_abcdefghijk00000000000000000'} 
    post_code        { '123-4567' }
    prefecture_id    { 2 }
    city             { '東京都' }
    address          { '青山1-1' }
    phone_number     { '08012345678'}

  end
end
