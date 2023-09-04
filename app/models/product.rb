# frozen_string_literal: true

class Product < ApplicationRecord
  validates   :category_id, numericality: true,                  presence: true
  validates   :user_id,     numericality: true,                  presence: true
  validates   :price,       numericality: true,                  presence: true
  validates   :title,       length: { minimum: 2, maximum: 20 }, presence: true
  validates   :brand,       length: { minimum: 2, maximum: 20 }, presence: true
  validates   :color,       length: { minimum: 2, maximum: 20 }, presence: true
  validates   :material,    length: { minimum: 2, maximum: 20 }, presence: true
  validates   :keywords,    length: { minimum: 2, maximum: 20 }, presence: true

  belongs_to  :category
  belongs_to  :user
  has_many    :orderables,        dependent: :destroy
  has_many    :sizes,             dependent: :destroy
  has_many    :favorites,         dependent: :destroy
  has_many    :reviews,           dependent: :destroy
  has_many    :related_products,  dependent: :destroy
  has_many    :related,             through: :related_products
  has_many    :carts,               through: :orderables

  before_create :capitalize_attr

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [408, 408]
  end
  scope :order_by_filename, -> { joins(file_attachment: :blob).order('active_storage_blobs.filename ASC') }

  def capitalize_attr
    self.title    =    title.split.map(&:capitalize).join(' ')
    self.brand    =    brand.split.map(&:capitalize).join(' ')
    self.color    =    color.split.map(&:capitalize).join(' ')
    self.material = material.split.map(&:capitalize).join(' ')
  end

  def image_first
    images.min
  end

  def image_second
    images.second
  end

  def image_third
    images.third
  end
end
