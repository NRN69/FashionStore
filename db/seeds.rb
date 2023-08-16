# frozen_string_literal: true

require 'faker'

# table brands

brand_attributes = [
  {
    title: Faker::Lorem.word,
    img: 'products/product-2.jpg',
    description: Faker::Superhero.name
  },
  {
    title: Faker::Lorem.word,
    img: 'products/product-1.jpg',
    description: Faker::Superhero.name
  },
  {
    title: Faker::Lorem.word,
    img: 'products/product-3.jpg',
    description: Faker::Superhero.name
  },
  {
    title: Faker::Lorem.word,
    img: 'products/product-4.jpg',
    description: Faker::Superhero.name
  },
  {
    title: Faker::Lorem.word,
    img: 'products/product-5.jpg',
    description: Faker::Superhero.name
  }
]

brand_attributes.each do |attr|
  Brand.create!(attr) unless Brand.where(attr).first
end

# - - - - -
#
# rubocop:disable Lint/UselessAssignment
# # table categories

women = Category.create(title: 'Women', bytitle: 'women', keywords: 'women', description: 'for women')
summer2 = Category.create(title: 'Summer', bytitle: 'summer', keywords: 'summer', description: 'for summer',
                          parent: women)
winter2 = Category.create(title: 'Winter', bytitle: 'winter', keywords: 'winter', description: 'for winter',
                          parent: women)
spring2 = Category.create(title: 'Spring', bytitle: 'spring', keywords: 'spring', description: 'for spring',
                          parent: women)
autumn2 = Category.create(title: 'Autumn', bytitle: 'autumn', keywords: 'autumn', description: 'for autumn',
                          parent: women)

men = Category.create(title: 'Men', bytitle: 'men', keywords: 'men', description: 'for men')
summer1 = Category.create(title: 'Summer', bytitle: 'summer', keywords: 'summer', description: 'for summer',
                          parent: men)
winter1 = Category.create(title: 'Winter', bytitle: 'winter', keywords: 'winter', description: 'for winter',
                          parent: men)
spring1 = Category.create(title: 'Spring', bytitle: 'spring', keywords: 'spring', description: 'for spring',
                          parent: men)
autumn1 = Category.create(title: 'Autumn', bytitle: 'autumn', keywords: 'autumn', description: 'for autumn',
                          parent: men)

kids = Category.create(title: 'Kids', bytitle: 'kids', keywords: 'kids', description: 'for kids')
summer3 = Category.create(title: 'Summer', bytitle: 'summer', keywords: 'summer', description: 'for summer',
                          parent: kids)
winter3 = Category.create(title: 'Winter', bytitle: 'winter', keywords: 'winter', description: 'for winter',
                          parent: kids)
spring3 = Category.create(title: 'Spring', bytitle: 'spring', keywords: 'spring', description: 'for spring',
                          parent: kids)
autumn3 = Category.create(title: 'Autumn', bytitle: 'autumn', keywords: 'autumn', description: 'for autumn',
                          parent: kids)
# # - - - - - - - -
# rubocop:enable Lint/UselessAssignment
# table products
product_attributes = [
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-1.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-2.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-3.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-4.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-5.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-6.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-7.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-8.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-9.jpg'
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-10.jpg'
  },
  {
    category_id: '7',
    brand_id: '2',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-11.jpg'
  },
  {
    category_id: '7',
    brand_id: '2',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-12.jpg'
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-13.jpg'
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-14.jpg'
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-15.jpg'
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-16.jpg'
  },
  {
    category_id: '1',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-17.jpg'
  },
  {
    category_id: '2',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-18.jpg'
  },
  {
    category_id: '3',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-19.jpg'
  },
  {
    category_id: '4',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-20.jpg'
  },
  {
    category_id: '5',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-1.jpg'
  },
  {
    category_id: '8',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-2.jpg'
  },
  {
    category_id: '9',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-3.jpg'
  },
  {
    category_id: '10',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-4.jpg'
  },
  {
    category_id: '11',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-5.jpg'
  },
  {
    category_id: '12',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-6.jpg'
  },
  {
    category_id: '13',
    brand_id: '4',
    title: Faker::Name.female_first_name,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    keywords: 'keywords',
    description: Faker::Lorem.sentence,
    img: 'products/product-7.jpg'
  }
]

product_attributes.each do |attr|
  Product.create!(attr) unless Product.where(attr).first
end

# - - - - -

# # table users
# user_attributes = [
#   {
#     name: 'Admin',
#     email: 'admin@admin.com',
#     password: 'adminadmin',
#     password_confirmation: 'adminadmin',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: true
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'gmail.com'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'mail.ru'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'yandex.ru'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'hotmail.com'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'yahoo.com'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   },
#   {
#     name: Faker::Name.name,
#     email: Faker::Internet.email(domain: 'youmail.com'),
#     password: 'password',
#     password_confirmation: 'password',
#     phone: Faker::PhoneNumber.cell_phone_in_e164,
#     address: Faker::Address.street_address,
#     admin: false
#   }
# ]
#
# user_attributes.each do |attr|
#   User.create!(attr) unless User.where(attr).first
# end

# - - - - - - - -

# # table sizes
200.times do
  Size.create!(
    product_id: Faker::Number.between(from: 1, to: 27),
    size: Faker::Number.between(from: 27, to: 60)
  )
end

# - - - - -
