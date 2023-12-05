# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController do
  let(:user) { create(:user) }
  let(:orders) { create_list(:order, 3, user:) }

  before { sign_in(user) }

  describe 'GET #index' do
    it 'render index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns orders correctly' do
      get :index
      expect(assigns(:orders)).to match_array(orders)
    end
  end

  describe 'GET #new' do
    it 'render new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { order: attributes_for(:order) } }

    it 'create new order' do
      expect { subject }.to change(Order, :count).by(1)
    end
  end
end
