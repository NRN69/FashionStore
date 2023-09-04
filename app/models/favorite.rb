# frozen_string_literal: true

class Favorite < ApplicationRecord
  validates   :product_id, numericality: true, presence: true
  validates   :user_id,    numericality: true, presence: true

  belongs_to  :product
  belongs_to  :user
end
