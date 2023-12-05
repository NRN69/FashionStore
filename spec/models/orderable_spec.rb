# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orderable do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:cart).optional }
    it { is_expected.to belong_to(:order).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:cart_id) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:size) }
  end
end
