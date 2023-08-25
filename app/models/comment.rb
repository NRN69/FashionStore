# frozen_string_literal: true

class Comment < ApplicationRecord
  validates     :body, length: { minimum: 5, maximum: 100 }, presence: true

  belongs_to    :product
  belongs_to    :user
  has_many      :answers, dependent: :destroy
end
