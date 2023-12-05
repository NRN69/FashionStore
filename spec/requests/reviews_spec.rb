# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', :javascript do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let(:review)  { create(:review, user:, product:) }
  let(:companies) { create_list(:company, 3) }

  before do
    sign_in(user)
    visit "/products/#{product.slug}", params: { Company: companies }, type: :routing
  end

  describe 'PUT #edit' do
    before do
      find("turbo-frame[id=#{dom_id(review)}]")
      click_on 'Edit'
      fill_in "#{review.body}", with: 'new body'
      click_on 'Sent'
    end

    it 'edit review' do
      expect(page).to have_text('new body')
    end
  end

  def slug_id(product)
    product.slug.gsub(' ', '-')
  end
end
