# frozen_string_literal: true

class User < ApplicationRecord
  devise        :database_authenticatable,
                :registerable,
                :recoverable,
                :rememberable,
                :validatable,
                :lockable,
                :trackable

  validates     :email,       presence: true
  validates     :password,    presence: true

  has_one :cart, dependent: :destroy
  has_many      :answers, dependent: :destroy
  has_many      :orders,     dependent: :destroy
  has_many      :likes,      dependent: :destroy
  has_many      :comments,   dependent: :destroy
  has_many      :notifications, as: :recipient, dependent: :destroy
end
