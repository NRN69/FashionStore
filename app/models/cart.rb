class Cart < ApplicationRecord
  has_many :orderables, dependent: :destroy
  has_many :products, through: :orderables
  belongs_to :user

  # validates :user_id, present: true

  def total
    orderables.to_a.sum { |orderable| orderable.total }
  end

  def quantity
    orderables.to_a.sum { |orderable| orderable.quantity }
  end
end
