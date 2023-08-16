# frozen_string_literal: true

class Product < ApplicationRecord
  validates   :title, presence: true
  validates   :price, presence: true

  belongs_to  :category
  has_many    :related_products
  has_many    :orderables
  has_many    :galleries
  has_many    :related,     through: :related_products
  has_many    :carts,       through: :orderables
  has_many    :sizes,     dependent: :destroy
  has_many    :likes,     dependent: :destroy
  has_many    :comments,  dependent: :destroy
end
