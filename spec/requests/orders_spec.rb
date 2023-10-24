# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Orders' do
  describe 'GET /index' do
    it 'returns http success' do
      get '/orders/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/orders/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/orders/new'
      expect(response).to have_http_status(:success)
    end
  end
end
