# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Review do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:answers) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to validate_numericality_of(:rating) }

    it { is_expected.to validate_length_of(:body).is_at_least(5).is_at_most(200) }
  end
end
