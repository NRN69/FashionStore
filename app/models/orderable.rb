class Orderable < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :cart_id, :quantity, presence: true

  def total
    product.price * quantity
  end
end
