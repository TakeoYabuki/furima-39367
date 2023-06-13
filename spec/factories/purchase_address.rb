FactoryBot.define do
  factory :purchase_address do
    zip_code { '123-4567' }
    prefecture_id { rand(2..48) }
    city { '東京都' }
    house_number { '1-1' }
    building {'矢吹ビル'}
    phone_number { '12345678900' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
