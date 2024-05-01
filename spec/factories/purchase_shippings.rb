FactoryBot.define do
  factory :purchase_shipping do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 } # 1ではないもの
    city { '渋谷区' }
    street_address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { '09012345678' }
    user_id { 1 } # 実際には存在するユーザーIDを指定します
    item_id { 1 } # 実際には存在するアイテムIDを指定します
  end
end
