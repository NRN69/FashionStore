# frozen_string_literal: true

class Order < ApplicationRecord
  validates :name,        length: { minimum: 3, maximum: 30 },          presence: true
  validates :address,     length: { minimum: 6, maximum: 50 },          presence: true
  validates :email,       format: { with: URI::MailTo::EMAIL_REGEXP },  presence: true
  validates :phone,       length: { minimum: 11, maximum: 12 },         presence: true

  before_save :capitalize_name

  belongs_to :user
  has_many   :orderables,  dependent: :destroy
  has_many   :order_items, dependent: :destroy

  enum pay_type: {
    'Credit card' => 0,
    'Cash' => 1
  }
  enum status: {
    'No Payment' => 0,
    'Payment accepted' => 1,
    'Shipped' => 2,
    'Delivered' => 3,
    'Reserved' => 4
  }

  def total(order)
    total = []
    order.order_items.each do |item|
      total << (item.product.price * item.quantity)
    end
    total.sum
  end

  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
