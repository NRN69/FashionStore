# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:opening_hours) }
    it { is_expected.to validate_presence_of(:opening_days) }

    it { is_expected.to validate_length_of(:address).is_at_least(6).is_at_most(50) }
    it { is_expected.to validate_length_of(:phone).is_at_least(11).is_at_most(12) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(30) }
    it { is_expected.to validate_length_of(:opening_hours).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_length_of(:opening_days).is_at_least(2).is_at_most(20) }
  end

  describe 'images' do
    subject { create(:product).images }

    it 'has an instance of ActiveStorage::Attached::Many' do
      expect(subject).to be_an_instance_of(ActiveStorage::Attached::Many)
    end

    it 'is attached' do
      expect(subject).to be_attached
    end
  end
end
