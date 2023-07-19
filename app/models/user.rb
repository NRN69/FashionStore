class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :trackable

  has_one :cart, dependent: :destroy

  validates :email,    presence: true
  validates :password, presence: true
end
