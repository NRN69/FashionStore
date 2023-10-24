# frozen_string_literal: true

class User < ApplicationRecord
  include UserOauth
  devise            :database_authenticatable,
                    :registerable,
                    :recoverable,
                    :rememberable,
                    :validatable,
                    :lockable,
                    :trackable,
                    :omniauthable,
                    omniauth_providers: %i[mail_ru google_oauth2 vkontakte]

  validates         :email,       format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true
  validates         :password,    length: { minimum: 6 },                      presence: true

  has_one           :cart,                          dependent: :destroy
  has_many          :products,                      dependent: :destroy
  has_many          :answers,                       dependent: :destroy
  has_many          :orders,                        dependent: :destroy
  has_many          :favorites,                     dependent: :destroy
  has_many          :comments,                      dependent: :destroy
  has_many          :notifications, as: :recipient, dependent: :destroy
  has_one_attached  :avatar
end
