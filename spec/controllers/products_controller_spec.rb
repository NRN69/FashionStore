# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  describe 'GET #show' do
    subject { get :show, params: { id: product.id } }

    let(:product) { create(:product) }

    context 'show product' do
      it 'render show view' do
        expect(subject).to render_template :show
      end
    end
  end
end
