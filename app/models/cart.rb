class Cart < ApplicationRecord
  has_many :orderables
  has_many :products, through: :orderables

  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end

  def quantity
    orderables.to_a.sum { |orderable| orderable.quantity }
  end
end
