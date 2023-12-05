# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    association :user
    association :product

    rating { rand(1..5) }
    body { Faker::Lorem.sentence(word_count: 20) }
  end
end
