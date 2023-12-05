# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    name            { Faker::Coffee.blend_name }
    address         { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{rand(1..100)}" }
    phone           { "+7#{Faker::Company.russian_tax_number}" }
    opening_hours   { '9.00 am - 8.00 pm' }
    opening_days    { 'Monday-Friday' }
    email           { Faker::Internet.email }

    after(:build) do |company|
      company.images.attach([
                              { io: File.open(Rails.root.join('app/assets/images/carousel/slider1.png')),
                                filename: '1-slider.png',
                                content_type: 'image/png' },
                              { io: File.open(Rails.root.join('app/assets/images/carousel/slider2.png')),
                                filename: '2-slider.png',
                                content_type: 'image/png' },
                              { io: File.open(Rails.root.join('app/assets/images/carousel/slider3.png')),
                                filename: '3-slider.png',
                                content_type: 'image/png' }
                            ])
    end
  end
end
