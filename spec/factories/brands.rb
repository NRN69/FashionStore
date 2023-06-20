

FactoryBot.define do
  factory :brand do
    title { FFaker::Lorem.word }
    bytitle { FFaker::Lorem.word }
    img { FFaker::Lorem.word }
    description { FFaker::Lorem.sentence }
    # association :user, factory: :user
  end
end