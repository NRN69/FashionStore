# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { '12345678' }
    password_confirmation { '12345678' }
    phone                 { '+79001234567' }
    name                  { Faker::Name.name.capitalize! }
    address               { Faker::Address.street_address }
    admin                 { true }
    confirmed_at          { Time.now }

    # after(:create) do |user|
    #   user.avatar.attach(
    #     io: File.open(Rails.root.join('app/assets/images/default_avatar.png'))
    #   )
    # end
  end
end
