# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :price }
  it { is_expected.to validate_presence_of :brand }
  it { is_expected.to validate_presence_of :color }
  it { is_expected.to validate_presence_of :material }
  it { is_expected.to validate_presence_of :keywords }

  it { is_expected.to belong_to :category }

  it { is_expected.to have_many :sizes }
  it { is_expected.to have_many :reviews }
  it { is_expected.to have_many :favorites }
  it { is_expected.to have_many :related_products }
  it { is_expected.to have_many :related }
end
