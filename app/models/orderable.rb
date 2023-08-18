# frozen_string_literal: true

class Orderable < ApplicationRecord
  validates   :cart_id,  presence: true
  validates   :quantity, presence: true
  validates   :size,     presence: true

  belongs_to  :product
  belongs_to  :cart,     optional: true
  belongs_to  :order,    optional: true

  def total
    product.price * quantity
  end
end
