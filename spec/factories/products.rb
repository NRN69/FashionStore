# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    category factory: %i[category]

    brand { Faker::Commerce.brand }
    material { Faker::Commerce.material }
    title { Faker::Name.female_first_name }
    content { Faker::Lorem.sentence(word_count: 20) }
    price { Faker::Commerce.price }
    color { Faker::Color.color_name }
    keywords { 'keywords' }
    description { Faker::Lorem.sentence }
    # association :user, factory: :user
  end
end
