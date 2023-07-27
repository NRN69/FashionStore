# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :orderables, dependent: :destroy
  has_many :products, through: :orderables
  belongs_to :user

  validates :user_id, presence: true

  def total
    orderables.to_a.sum(&:total)
  end

  def quantity
    orderables.to_a.sum(&:quantity)
  end
end
