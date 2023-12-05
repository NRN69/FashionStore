# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cart do
  it { is_expected.to have_many(:orderables) }
  it { is_expected.to have_many(:products) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:user_id) }

  it { is_expected.to validate_numericality_of(:user_id) }
end
