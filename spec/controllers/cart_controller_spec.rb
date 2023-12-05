# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartController do
  let(:user)         { create(:user) }
  let(:product)      { create(:product) }
  let(:cart)         { create(:cart, user:) }
  let(:orderables)   { create_list(:orderable, 2, cart:, product:) }
  let(:companies)    { create_list(:company, 2) }

  before { sign_in(user) }

  describe 'GET #show' do
    subject do
      get :show, params: { id: cart.id, Company: companies }
    end

    before { subject }

    it 'render show view' do
      expect(subject).to render_template :show
    end

    it 'assigns cart correctly' do
      expect(assigns(:cart)).to eq(cart)
    end
  end

  describe 'POST #add' do
    subject { post :add, params: { id: product.id, orderable_id: orderables.first.id } }

    context 'when added to cart' do
      it 'create cart' do
        expect { subject }.to change { user.reload.cart.present? }.to(true)
      end

      it 'assigns products correctly' do
        expect { subject }.to change(Orderable, :count).by(1)
      end
    end
  end
end
