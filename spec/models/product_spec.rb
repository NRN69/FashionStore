# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:brand) }
    it { is_expected.to validate_presence_of(:color) }
    it { is_expected.to validate_presence_of(:material) }
    it { is_expected.to validate_presence_of(:keywords) }

    it { is_expected.to validate_numericality_of(:price) }

    it { is_expected.to validate_length_of(:title).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_length_of(:brand).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_length_of(:color).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_length_of(:material).is_at_least(2).is_at_most(20) }
    it { is_expected.to validate_length_of(:keywords).is_at_least(2).is_at_most(30) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:orderables) }
    it { is_expected.to have_many(:sizes) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:related_products) }
    it { is_expected.to have_many(:related) }
    it { is_expected.to have_many(:carts) }
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
