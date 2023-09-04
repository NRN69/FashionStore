# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_page_options

  def create
    @favorite = current_user.favorites.new(product_id: favorite_params[:product_id])
    @favorite.save
    respond_to_format
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favorite.destroy!
    respond_to_format
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id, :target)
  end

  # rubocop:disable Metrics/AbcSize

  def respond_to_format
    respond_to do |format|
      format.turbo_stream do
        if favorite_params[:target] == 'Favorites'
          render turbo_stream:
                   [turbo_stream.replace('favorites',
                                         partial: 'favorites/favorites'),
                    turbo_stream.replace('favorites-quantity',
                                         partial: 'favorites/favorites_quantity')]

        else
          render turbo_stream:
                   [turbo_stream.replace('products-trending',
                                         partial: 'main/products_trending',
                                         locals: { products: Product.all.limit(8) }),
                    turbo_stream.replace('favorites-quantity',
                                         partial: 'favorites/favorites_quantity')]
        end
      end
      format.html do
        redirect_to root_path status: :see_other
      end
    end
  end

  # rubocop:enable Metrics/AbcSize

  def set_page_options
    @page_title = 'Favorites'
  end
end
