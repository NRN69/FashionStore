# frozen_string_literal: true

class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validates :cart_id, :quantity, presence: true

  def total
    product.price * quantity
  end
end
