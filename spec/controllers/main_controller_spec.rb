# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MainController do
  describe 'GET #index' do
    let(:products)  { create_list(:product, 8) }
    let(:companies) { create_list(:company, 3) }

    before { get :index, params: { Company: companies } }

    context 'when required output per page' do
      subject { response }

      it 'assigns products correctly' do
        expect(assigns(:products)).to match_array(products)
      end

      it 'render to index template' do
        expect(subject).to render_template :index
      end
    end
  end
end
