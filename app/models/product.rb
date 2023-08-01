# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  has_many :related_products
  has_many :related, through: :related_products
  has_many :galleries
  has_many :likes, dependent: :destroy
  belongs_to :category

  has_many :orderables
  has_many :carts, through: :orderables

  enum hit: { hit: 1, not_hit: 0 }

  def favorited_by?(user)
    favorites.where(user:).any?
  end

  def favorite(user)
    favorites.where(user:).first_or_create
  end

  def unfavorite(user)
    favorites.where(user:).destroy_all
  end
end
