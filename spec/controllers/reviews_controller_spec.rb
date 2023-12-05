# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController do
  let(:user)      { create(:user) }
  let(:product)   { create(:product) }
  let(:reviews)   { create_list(:review, 3, user:, product:) }
  let(:companies) { create_list(:company, 3) }

  before { sign_in(user) }

  describe 'POST #create' do
    it 'create new review' do
      expect do
        post :create, params: { product_id: product.id, review: attributes_for(:review) }
      end.to change(Review, :count).by(1)
    end
  end

  # describe 'PUT #update' do
  #   it 'update review' do
  #     expect do
  #       put :update, params: { id: reviews.first.id, product_id: product.id, review: { body: 'new body', rating: 5 } }
  #     end.not_to change(Review, :count)
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'destroy review' do
  #     expect do
  #       delete :destroy,
  #              params: { id: reviews.first.id, product_id: product.id, reviews:, product: }
  #     end.to change(Review, :count).by(-1)
  #   end
  # end
end
