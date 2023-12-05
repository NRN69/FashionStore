# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    category factory: %i[category]
    association :user

    brand { Faker::Commerce.brand }
    material { Faker::Commerce.material }
    title { Faker::Name.female_first_name }
    content { Faker::Lorem.sentence(word_count: 20) }
    price { Faker::Commerce.price }
    color { Faker::Color.color_name }
    keywords { 'keywords' }
    description { Faker::Lorem.sentence }

    after(:build) do |product|
      product.images.attach([
                              { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'main-image',
                                                              'product-1.jpg')),
                                filename: '1-1.jpg',
                                content_type: 'image/jpg' },
                              { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'second_image',
                                                              '1.jpg')),
                                filename: '2-1.jpg',
                                content_type: 'image/jpg' },
                              { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'third_image',
                                                              '2.jpg')),
                                filename: '3-1.jpg',
                                content_type: 'image/jpg' }
                            ])
      product.slug = product.title.gsub(' ', '-')
    end
  end
end
