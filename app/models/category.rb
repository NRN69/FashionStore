# frozen_string_literal: true

class Category < ApplicationRecord
  has_ancestry
  has_many :products
end
