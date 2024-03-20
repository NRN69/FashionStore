# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    association :user
    name   { Faker::Name.name }
    email  { Faker::Internet.email }
    phone  { '+79101531210' }
    address { 'some address some address' }
    status { 1 }
    pay_type { 'Credit card' } # 1 - cash, 2 - card
  end
end
