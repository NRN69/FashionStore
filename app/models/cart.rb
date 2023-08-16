# frozen_string_literal: true

class Cart < ApplicationRecord
  validates   :user_id, presence: true

  belongs_to  :user
  has_many    :orderables,  dependent: :destroy
  has_many    :products,    through: :orderables

  def total
    orderables.to_a.sum(&:total)
  end

  def quantity
    orderables.to_a.sum(&:quantity)
  end
end
