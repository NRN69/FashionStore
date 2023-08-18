# frozen_string_literal: true

class Size < ApplicationRecord
  validates  :size, presence: true

  belongs_to :product
end
