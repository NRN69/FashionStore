# frozen_string_literal: true

class Company < ApplicationRecord
  validates   :name,                length: { minimum: 2, maximum: 20 },  presence: true
  validates   :address,             length: { minimum: 6, maximum: 50 },  presence: true
  validates   :phone,               length: { minimum: 11, maximum: 12 }, presence: true
  validates   :opening_hours,       length: { minimum: 2, maximum: 20 },  presence: true
  validates   :opening_days,        length: { minimum: 2, maximum: 20 },  presence: true
  validates   :email,               format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [1920, 400]
  end
  scope :order_by_filename, -> { joins(file_attachment: :blob).order('active_storage_blobs.filename ASC') }

  before_create :capitalize_name

  def capitalize_name
    self.name = name.split.map(&:capitalize).join(' ')
  end

  def phone_number
    phone.gsub('+7', '')
  end
end
