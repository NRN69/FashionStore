# frozen_string_literal: true

require 'faker'

# table brands

brand_attributes = [{
  title: Faker::Lorem.word,
  bytitle: Faker::Lorem.word,
  img: 'products/product-2.jpg',
  description: Faker::Superhero.name
},
                    {
                      title: Faker::Lorem.word,
                      bytitle: Faker::Lorem.word,
                      img: 'products/product-1.jpg',
                      description: Faker::Superhero.name
                    },
                    {
                      title: Faker::Lorem.word,
                      bytitle: Faker::Lorem.word,
                      img: 'products/product-3.jpg',
                      description: Faker::Superhero.name
                    },
                    {
                      title: Faker::Lorem.word,
                      bytitle: Faker::Lorem.word,
                      img: 'products/product-4.jpg',
                      description: Faker::Superhero.name
                    },
                    {
                      title: Faker::Lorem.word,
                      bytitle: Faker::Lorem.word,
                      img: 'products/product-5.jpg',
                      description: Faker::Superhero.name
                    }]

brand_attributes.each do |attr|
  Brand.create(attr) unless Brand.where(attr).first
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
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-1.jpg',
    hit: 1
  },
  {
    category_id: '6',
    brand_id: '1',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-2.jpg',
    hit: 1
  },
  {
    category_id: '7',
    brand_id: '2',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-3.jpg',
    hit: 1
  },
  {
    category_id: '7',
    brand_id: '2',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-4.jpg',
    hit: 1
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-5.jpg',
    hit: 1
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-6.jpg',
    hit: 1
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-7.jpg',
    hit: 1
  },
  {
    category_id: '6',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-8.jpg',
    hit: 1
  },
  {
    category_id: '1',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-1.jpg',
    hit: 1
  },
  {
    category_id: '2',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-2.jpg',
    hit: 1
  },
  {
    category_id: '3',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-3.jpg',
    hit: 1
  },
  {
    category_id: '4',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-4.jpg',
    hit: 1
  },
  {
    category_id: '5',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-5.jpg',
    hit: 1
  },
  {
    category_id: '8',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-6.jpg',
    hit: 1
  },
  {
    category_id: '9',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-7.jpg',
    hit: 1
  },
  {
    category_id: '10',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-8.jpg',
    hit: 1
  },
  {
    category_id: '11',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-7.jpg',
    hit: 1
  },
  {
    category_id: '12',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-6.jpg',
    hit: 1
  },
  {
    category_id: '13',
    brand_id: '4',
    title: Faker::Lorem.word,
    bytitle: Faker::Lorem.word,
    content: Faker::Lorem.sentence(word_count: 20),
    price: Faker::Commerce.price,
    color: Faker::Color.color_name,
    status: 1,
    keywords: 'keywords',
    description: Faker::Lorem.sentence(word_count: 10),
    img: 'products/product-5.jpg',
    hit: 1
  }

]

product_attributes.each do |attr|
  Product.create(attr) unless Product.where(attr).first
end

# - - - - -

# table related products

# look into migration related_products

# - - - - - - - -
