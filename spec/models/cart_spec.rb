# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { is_expected.to have_many(:orderables) }
  # it { should have_many(:products) }
  it { is_expected.to belong_to(:user) }
  # it { should validate_presence_of(:user_id) }
end
