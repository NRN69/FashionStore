# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryController, type: :controller do
  render_views
  describe 'GET #show' do
    subject { get :show, params: { id: category.id } }

    let(:category)  { create :category }
    let!(:products) { create_list :product, 2, category: }

    context 'find product for this category' do
      it 'render show view' do
        expect(subject).to render_template :show
        expect(response.body).to include(products.first.title)
      end
    end
  end
end
