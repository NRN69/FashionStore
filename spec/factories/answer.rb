# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :user
    association :review

    body { Faker::Lorem.sentence(word_count: 20) }
  end
end
