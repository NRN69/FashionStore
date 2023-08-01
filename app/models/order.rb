# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :orderables, dependent: :destroy
  belongs_to :user

  validates :name, length: { minimum: 3, maximum: 10 }, presence: true
  validates :address, length: { minimum: 6, maximum: 50 }, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates :phone, length: { minimum: 11, maximum: 12 }, presence: true

  enum pay_type: { 'Credit card' => 0, 'Cash' => 1 }

  enum status: { 'No Payment' => 0,
                 'Payment accepted' => 1,
                 'Shipped' => 2,
                 'Delivered' => 3,
                 'Reserved' => 4 }

  def total(order)
    total = []
    order.product_id_and_quantity.each do |product_id, quantity|
      Product.where(id: product_id.to_i).each do |product|
        total << product.price * quantity
      end
    end
    total.sum
  end
end
