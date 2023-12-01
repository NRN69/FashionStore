# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController do
  describe 'GET #index' do
    let(:products) { create_list(:product, 8) }
    let(:company)  { create(:company) }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        expect(subject).to render_template :index
      end

      it 'instance var works include only works' do
        expect(assigns(:products)).to match_array(products)
      end
    end
  end
end
