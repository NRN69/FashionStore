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
  has_many      :answers,    dependent: :destroy
  has_many      :orders,     dependent: :destroy
  has_many      :likes,      dependent: :destroy
  has_many      :comments,   dependent: :destroy
  has_many      :notifications, as: :recipient
  has_one_attached :avatar

  after_commit :add_default_avatar, on: %i[create update]

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')),
                  filename: 'default_avatar.png',
                  content_type: 'image/png')
  end
end
