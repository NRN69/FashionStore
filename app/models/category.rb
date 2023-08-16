# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, presence: true

  has_ancestry
  has_many :products
end
