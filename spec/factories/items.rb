FactoryBot.define do
  
  factory :item do
    name              {"かばん"}
    explanation       {"旅行用のカバンです"}
    category_id       {rand(2..11)}
    condition_id      {rand(2..8)}
    postage_id        {rand(2..3)}
    prefecture_id     {rand(2..48)}
    delivery_day_id   {rand(2..4)}
    price             {rand(3..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end