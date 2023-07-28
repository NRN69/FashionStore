# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartController, type: :controller do
  render_views

  let(:user) { create :user }
  let(:product) { create :product }
  let(:cart) { create :cart, user: }
  let(:orderables) { create :orderable, cart:, product: }

  describe 'GET #show' do
    subject { get :show }

    it 'render show view' do
      sign_in(user)
      is_expected.to render_template :show
      expect(response.body).to include(product.title)
    end
  end

  describe 'REMOVE #remove' do
    subject { post :remove }
    context 'remove from cart' do
      it 'remove product from cart' do
        sign_in(user)
        expect { subject }.to change { user.reload.cart.present? }.to(false)
      end

      it 'remove product from orderables' do
        sign_in(user)
        expect { subject }.to change(user.cart.orderables, :count).by(-1)

        it 'render view show after remove'
        is_expected.to render_template :show
      end
    end
  end
end
