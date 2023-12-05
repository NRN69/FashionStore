# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryController do
  render_views

  let(:category)  { create(:category) }
  let!(:products) { create_list(:product, 2, category:) }

  describe 'GET #show' do
    subject { get :show, params: { id: category.id } }

    context 'find category' do
      before { subject }

      it 'assigns category correctly' do
        expect(assigns(:category)).to eq(category)
      end

      it 'assigns products correctly' do
        expect(assigns(:products)).to match_array(products)
      end
    end
  end
end
