# frozen_string_literal: true

class User < ApplicationRecord
  include UserOauth
  devise            :database_authenticatable,
                    :registerable,
                    :recoverable,
                    :rememberable,
                    :validatable,
                    :confirmable,
                    :lockable,
                    :trackable,
                    :omniauthable,
                    omniauth_providers: %i[mail_ru google_oauth2]

  validates         :email,       format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates         :password,    length: { minimum: 6 },                      presence: true
  validates         :name,        length: { minimum: 3, maximum: 30 }
  validates         :address,     length: { maximum: 50 }
  validates         :phone,       length: { minimum: 11, maximum: 12 }

  has_one           :cart,                          dependent: :destroy
  has_many          :products,                      dependent: :destroy
  has_many          :answers,                       dependent: :destroy
  has_many          :orders,                        dependent: :destroy
  has_many          :favorites,                     dependent: :destroy
  has_many          :reviews,                       dependent: :destroy
  has_many          :notifications, as: :recipient, dependent: :destroy
  has_one_attached  :avatar,                        dependent: :destroy

  after_create :send_email

  def send_email
    UserRegistrationService.call(self)
  end
end
