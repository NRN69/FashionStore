# frozen_string_literal: true

class OrderItem < ApplicationRecord
  validates :quantity, numericality: true, presence: true
  validates :size, presence: true

  belongs_to :order
  belongs_to :product
end
