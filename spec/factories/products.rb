# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    association :category, factory: :category

    brand_id     { rand(1..5) }
    title        { Faker::Lorem.word }
    bytitle      { title.downcase }
    img          { 'products/product-1.jpg' }
    content      { Faker::Lorem.sentence }
    keywords     { title.downcase }
    description  { content }
    price        { rand(10..100) }
    status       { 1 }
    hit          { 1 }
    # association :user, factory: :user
  end
end
