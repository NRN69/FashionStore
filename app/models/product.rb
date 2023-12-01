# frozen_string_literal: true

class Product < ApplicationRecord
  extend FriendlyId

  validates   :category_id, numericality: true,                  presence: true
  validates   :user_id,     numericality: true,                  presence: true
  validates   :price,       numericality: true,                  presence: true
  validates   :title,       length: { minimum: 2, maximum: 20 }, presence: true, uniqueness: true
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

  friendly_id :title_and_brand, use: %i[slugged history finders]

  has_many_attached :images, dependent: :destroy do |attachable|
    attachable.variant :thumb, resize_to_limit: [408, 408]
  end

  scope :order_by_filename, -> { joins(file_attachment: :blob).order('active_storage_blobs.filename ASC') }

  # rubocop:disable Metrics/AbcSize
  def capitalize_attr
    self.title    =    title.split.map(&:capitalize).join(' ')
    self.brand    =    brand.split.map(&:capitalize).join(' ')
    self.color    =    color.split.map(&:capitalize).join(' ')
    self.material = material.split.map(&:capitalize).join(' ')
  end
  # rubocop:enable Metrics/AbcSize

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  def title_and_brand
    "#{title} #{brand}"
  end
end
