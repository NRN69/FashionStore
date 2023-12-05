# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer do
  describe 'associations' do
    it { is_expected.to belong_to(:review) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }

    it { is_expected.to validate_length_of(:body).is_at_least(5).is_at_most(200) }
  end
end
