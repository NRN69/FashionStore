# frozen_string_literal: true

FactoryBot.define do
  factory :orderable do
    association :product
    association :cart

    quantity { 1 }
  end
end
