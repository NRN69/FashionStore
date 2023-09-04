# frozen_string_literal: true

class Review < ApplicationRecord
  MAX_RATING = 5
  validates     :rating,  numericality: { in: 0..MAX_RATING },  presence: true
  validates     :body,    length: { minimum: 5, maximum: 200 }, presence: true

  belongs_to    :product
  belongs_to    :user
  has_many      :answers, dependent: :destroy
end
