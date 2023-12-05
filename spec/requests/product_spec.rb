# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products' do
  let(:product)   { create(:product) }
  let(:companies) { create_list(:company, 3) }

  describe 'GET /show' do
    it 'returns http success' do
      get "/products/#{product.slug}", params: { Company: companies }
      expect(response).to have_http_status(:success)
    end
  end
end
