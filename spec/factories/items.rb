FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words(number: 2).join(' ') } # 3 単語からなる名前
    info { Faker::Lorem.sentences } # ランダムな文章
    category_id { Faker::Number.between(from: 2, to: 11) } # 1〜10の間でランダムな値
    sales_status_id { Faker::Number.between(from: 2, to: 7) } # 1〜10の間でランダムな値
    shipping_fee_status_id { Faker::Number.between(from: 2, to: 3) } # 1〜10の間でランダムな値
    prefecture_id { Faker::Number.between(from: 2, to: 48) } # 1〜48の間でランダムな値
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) } # 1〜10の間でランダムな値
    price { Faker::Number.between(from: 300, to: 9_999_999) } # 300〜9999999の間でランダムな値
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
