# frozen_string_literal: true

FactoryBot.define do
  factory :orderable do
    association :cart
    association :product

    quantity { 1 }
    size     { 'S' }
  end
end
