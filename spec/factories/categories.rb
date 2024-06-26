# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title       { Faker::Demographic.sex }
    keywords    { Faker::Lorem.sentence(word_count: 10) }
    description { Faker::Lorem.sentence(word_count: 10) }
  end
end
