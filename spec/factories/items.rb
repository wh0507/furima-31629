FactoryBot.define do
  factory :item do
    id { '1' }
    user
    item_name             { '商品' }
    description           { '商品説明' }
    category_id           { '2' }
    condition_id          { '2' }
    postage_payer_id      { '2' }
    postage_area_id       { '2' }
    postage_day_id        { '2' }
    item_price            { 50000 } 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
