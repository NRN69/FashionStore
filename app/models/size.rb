# frozen_string_literal: true

class Size < ApplicationRecord
  validates     :size, presence: true

  belongs_to    :product

  before_create :upcase_size

  def upcase_size
    self.size = size.split.map(&:upcase).join(' ')
  end
end
