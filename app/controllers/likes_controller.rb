# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_page_options
  attr_accessor :hits

  def create
    @like = current_user.likes.new(product_id: like_params[:product_id])
    @like.save
    respond_to_format
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @like.destroy!
    respond_to_format
  end

  def index
    current_url(controller_name)
  end

  private

  def like_params
    params.require(:like).permit(:product_id, :target)
  end

  # rubocop:disable Metrics/AbcSize

  def respond_to_format
    respond_to do |format|
      format.turbo_stream do
        if like_params[:target] == 'Likes'
          render turbo_stream:
                   [turbo_stream.replace('likes',
                                         partial: 'likes/likes'),
                    turbo_stream.replace('likes-quantity',
                                         partial: 'likes/likes_quantity')]

        else
          render turbo_stream:
                   [turbo_stream.replace('products-trending',
                                         partial: 'main/products_trending',
                                         locals: { products: Product.all.limit(8) }),
                    turbo_stream.replace('likes-quantity',
                                         partial: 'likes/likes_quantity')]
        end
      end
      format.html do
        redirect_to root_path status: :see_other
      end
    end
  end

  # rubocop:enable Metrics/AbcSize

  def set_page_options
    @page_title = 'Likes'
  end
end
