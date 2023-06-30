

FactoryBot.define do
  factory :brand do
    title       { Faker::Lorem.word }
    bytitle     { Faker::Lorem.word }
    img         { 'products/product-2.jpg' }
    description { Faker::Lorem.sentence }
    # association :user, factory: :user
  end
end