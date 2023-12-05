# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many :reviews }
    it { is_expected.to have_many :answers }
    it { is_expected.to have_many :favorites }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_length_of(:address), in: 6..50 }
    it { is_expected.to validate_length_of(:phone), in: 11..12 }
    it { is_expected.to validate_length_of(:name), in: 3..30 }
  end
  
end
