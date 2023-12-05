# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Favorite do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:product_id) }

    it { is_expected.to validate_numericality_of(:user_id) }
    it { is_expected.to validate_numericality_of(:product_id) }
  end
end
