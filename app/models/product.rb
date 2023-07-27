# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  has_many :related_products
  has_many :related, through: :related_products
  has_many :galleries
  belongs_to :category
  belongs_to :order

  has_many :orderables
  has_many :carts, through: :orderables

  enum hit: { hit: 1, not_hit: 0 }
end
