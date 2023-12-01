# frozen_string_literal: true

class Category < ApplicationRecord
  extend FriendlyId

  validates :title, length: { minimum: 2, maximum: 10 }, presence: true

  has_ancestry
  has_many :products

  before_create :capitalize_title

  friendly_id :title_and_season, use: %i[slugged history finders]

  def capitalize_title
    self.title = title.split.map(&:capitalize).join(' ')
  end

  def title_and_season
    if parent
      "#{title} from #{parent.title}"
    else
      title.to_s
    end
  end

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
