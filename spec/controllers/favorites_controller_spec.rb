# frozen_string_literal: true

RSpec.describe FavoritesController do
  let(:user)      { create(:user) }
  let(:products)  { create_list(:product, 3) }
  let(:favorites) { create_list(:favorite, 3, user:) }
  let(:companies) { create_list(:company, 3) }

  before { sign_in(user) }

  describe 'GET #index' do
    before { get :index, params: { product_id: products.first.id, Company: companies, current_user: user } }

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'DELETE #destroy' do
    before { delete :destroy, params: { id: favorites.first.id } }

    it 'delete favorite' do
      expect(Favorite.count).to eq(2)
    end
  end
end
