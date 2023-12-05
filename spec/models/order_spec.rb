# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:orderables) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_length_of(:address).is_at_least(6).is_at_most(50) }
    it { is_expected.to validate_length_of(:phone).is_at_least(11).is_at_most(12) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(30) }
  end
end
