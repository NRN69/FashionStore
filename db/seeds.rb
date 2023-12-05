# frozen_string_literal: true

require 'faker'

# table users

user = User.new
user.phone        = '+79001234567'
user.name         = 'Administrator'
user.email        = 'admin@admin.com'
user.password     = 'password'
user.address      = Faker::Address.full_address
user.confirmed_at = Time.now
user.admin        = true
user.save!

user = User.new
user.phone        = '+79061234547'
user.name         = Faker::Internet.username.capitalize!
user.email        = 'user@user.com'
user.password     = 'password'
user.address      = Faker::Address.full_address
user.confirmed_at = Time.now
user.admin        = false
user.save!

user = User.new
user.phone        = '+79061245547'
user.name         = Faker::Internet.username.capitalize!
user.email        = 'user1@user1.com'
user.password     = 'password'
user.address      = Faker::Address.full_address
user.confirmed_at = Time.now
user.admin        = false
user.save!

# - - - - - - - -

# table company
company = Company.create!(name: Faker::Coffee.blend_name,
                          address: "#{Faker::Address.city}, #{Faker::Address.street_name}, #{rand(1..100)}",
                          phone: "+7#{Faker::Company.russian_tax_number}",
                          opening_hours: '9.00 am - 8.00 pm',
                          opening_days: 'Monday-Friday',
                          email: Faker::Internet.email)
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

# - - - - - - - -

# rubocop:disable Lint/UselessAssignment
# # table categories

women   = Category.create(title: 'Women',  keywords: 'women',  description: 'for women')
summer1 = Category.create(title: 'Summer', keywords: 'summer', description: 'for summer',
                          parent: women)
winter1 = Category.create(title: 'Winter', keywords: 'winter', description: 'for winter',
                          parent: women)
spring1 = Category.create(title: 'Spring', keywords: 'spring', description: 'for spring',
                          parent: women)
autumn1 = Category.create(title: 'Autumn', keywords: 'autumn', description: 'for autumn',
                          parent: women)

men     = Category.create(title: 'Men',    keywords: 'men',    description: 'for men')
summer2 = Category.create(title: 'Summer', keywords: 'summer', description: 'for summer',
                          parent: men)
winter2 = Category.create(title: 'Winter', keywords: 'winter', description: 'for winter',
                          parent: men)
spring2 = Category.create(title: 'Spring', keywords: 'spring', description: 'for spring',
                          parent: men)
autumn2 = Category.create(title: 'Autumn', keywords: 'autumn', description: 'for autumn',
                          parent: men)

kids    = Category.create(title: 'Kids',   keywords: 'kids', description: 'for kids')
summer3 = Category.create(title: 'Summer', keywords: 'summer', description: 'for summer',
                          parent: kids)
winter3 = Category.create(title: 'Winter', keywords: 'winter', description: 'for winter',
                          parent: kids)
spring3 = Category.create(title: 'Spring', keywords: 'spring', description: 'for spring',
                          parent: kids)
autumn3 = Category.create(title: 'Autumn', keywords: 'autumn', description: 'for autumn',
                          parent: kids)
# # - - - - - - - -
# rubocop:enable Lint/UselessAssignment
# table products
product_attributes = [
  {
    category_id: '2',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '3',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '4',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '5',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '6',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '2',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '3',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '4',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '5',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  },
  {
    category_id: '11',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 20)
  },
  {
    category_id: '13',
    user_id: '1',
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  }
]

n = 1
10.times do
  product = Product.create!(
    category_id: 1,
    user_id: 1,
    brand: Faker::Commerce.brand,
    material: Faker::Commerce.material,
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence
  )
  image = rand(1..6)
  product.images.attach([
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'main-image',
                                                          "product-#{n}.jpg")),
                            filename: "1-#{product.id}.jpg",
                            content_type: 'image/jpg' },
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'second_image',
                                                          "#{image}.jpg")),
                            filename: "2-#{product.id}.jpg",
                            content_type: 'image/jpg' },
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'third_image',
                                                          "#{image}.jpg")),
                            filename: "3-#{product.id}.jpg",
                            content_type: 'image/jpg' }
                        ])
  if n <= 20
    n += 1
  else
    n = 1
  end
end

n = 1
product_attributes.each do |attr|
  next if Product.where(attr).first

  product = Product.create!(attr)
  image = rand(1..6)
  product.images.attach([
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'main-image',
                                                          "product-#{n}.jpg")),
                            filename: "1-#{product.id}.jpg",
                            content_type: 'image/jpg' },
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'second_image',
                                                          "#{image}.jpg")),
                            filename: "2-#{product.id}.jpg",
                            content_type: 'image/jpg' },
                          { io: File.open(Rails.root.join('app', 'assets', 'images', 'products', 'third_image',
                                                          "#{image}.jpg")),
                            filename: "3-#{product.id}.jpg",
                            content_type: 'image/jpg' }
                        ])
  if n <= 20
    n += 1
  else
    n = 1
  end
end

# - - - - -

# table reviews
20.times do |i|
  Review.create!(product_id: i + 1, user_id: 2, rating: rand(1..5), body: Faker::Lorem.sentence(word_count: 20))
  Review.create!(product_id: 1, user_id: 2, rating: rand(1..5), body: Faker::Lorem.sentence(word_count: 20))
end

# - - - - - - - -

# table answers
10.times do |i|
  Answer.create!(review_id: i + 1, user_id: 1, body: Faker::Lorem.sentence(word_count: 20))
end

# - - - - - - - -

# # table sizes
200.times do
  Size.create!(
    product_id: rand(1..21),
    size: %w[XS S M L XL XXL].sample
  )
end

# - - - - -
puts ''
puts '--------------------- Done! -------------------------'
puts ''
