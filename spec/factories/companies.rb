# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name            { Faker::Coffee.blend_name }
    address         { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{rand(1..100)}" }
    phone           { "+7#{Faker::Company.russian_tax_number}" }
    opening_hours   { '9.00 am - 8.00 pm' }
    opening_days    { 'Monday-Friday' }
    email           { Faker::Internet.email }
  end
end
