

FactoryBot.define do
  factory :product do
    association :category, factory: :category

    brand_id     { rand(1..5) }
    title        { FFaker::Lorem.word }
    bytitle      { FFaker::Lorem.word }
    img          { 'product-1.jpg' }
    content      { FFaker::Lorem.sentence }
    keywords     { FFaker::Lorem.word }
    description  { FFaker::Lorem.sentence }
    price        { rand(10..100) }
    # status      { 1 }
    # hit         { 1 }
    # association :user, factory: :user
  end
end