# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :likes

  validates :email,    presence: true
  validates :password, presence: true
end
