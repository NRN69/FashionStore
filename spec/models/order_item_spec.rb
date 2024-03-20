# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem do
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:product) }

  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:size) }
end
