# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Orderable, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:cart) }
  it { should validate_presence_of(:cart_id) }
  it { should validate_presence_of(:quantity) }
end
