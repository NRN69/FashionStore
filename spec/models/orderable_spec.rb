# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orderable, type: :model do
  it { is_expected.to belong_to(:product) }
  it { is_expected.to belong_to(:cart) }
  it { is_expected.to validate_presence_of(:cart_id) }
  it { is_expected.to validate_presence_of(:quantity) }
end
