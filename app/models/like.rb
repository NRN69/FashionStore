# frozen_string_literal: true

class Like < ApplicationRecord
  validates   :product_id,  presence: true
  validates   :user_id,     presence: true

  belongs_to  :product
  belongs_to  :user
end
