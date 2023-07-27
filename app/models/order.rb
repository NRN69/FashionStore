# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :orderables, dependent: :destroy
  has_many :products
  belongs_to :user

  validates :name, :address, :email, presence: true


  enum pay_type: { 'Credit card' => 0, 'Cash' => 1 }

  enum status: { 'No Payment' => 0,
                 'Payment accepted' => 1,
                 'Shipped' => 2,
                 'Delivered' => 3,
                 'Reserved' => 4 }

end
