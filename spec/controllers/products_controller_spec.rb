# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController do
  let(:product) { create(:product) }
  let(:companies) { create_list(:company, 3) }
  let(:user) { create(:user) }

  before { sign_in(user) }

  describe 'GET #show' do
    subject { get :show, params: { id: product.id, Company: companies, size: 's' } }

    before { subject }

    # it 'render show view' do
    #   expect(subject).to render_template :show
    # end

    it 'assigns product correctly' do
      expect(assigns(:product)).to eq(product)
    end
  end
end
