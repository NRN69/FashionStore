# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Favorites' do
  let(:user) { create(:user) }
  let(:companies) { create_list(:company, 3) }
  let(:category) { create(:category) }

  describe 'GET #index' do
    it 'returns http success' do
      sign_in(user)
      get '/favorites', params: { current_user: user, Company: companies, category: }

      expect(response).to have_http_status(:success)
    end
  end
end
