# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, length: { minimum: 2, maximum: 10 }, presence: true

  has_ancestry
  has_many :products

  before_create :capitalize_title

  def capitalize_title
    self.title = title.split.map(&:capitalize).join(' ')
  end
end
