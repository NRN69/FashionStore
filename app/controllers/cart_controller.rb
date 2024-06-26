# frozen_string_literal: true

class CartController < ApplicationController
  before_action :set_page_options

  def show
    @render_cart = false
  end

  # rubocop:disable Metrics/AbcSize
  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    size = params[:size]
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    # if current_orderable && quantity.positive?
    #   current_orderable.update(size:)
    #   respond_format
    if quantity <= 0
      current_orderable.destroy
    elsif size.nil?
      flash[:danger] = 'Size not selected!'
      redirect_to product_path(@product), status: :see_other
    else
      @cart.orderables.create(product: @product, quantity:, size:)
      respond_format
    end
  end
  # rubocop:enable Metrics/AbcSize

  def remove
    Orderable.find(params[:id]).destroy
    respond_format
  end

  private

  def set_page_options
    @page_title = 'Cart'
  end

  def respond_format
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
                 [turbo_stream.replace('cart-show',
                                       partial: 'cart/cart_show',
                                       locals: { cart: @cart }),
                  turbo_stream.replace('cart-quantity',
                                       partial: 'cart/cart_quantity'),
                  turbo_stream.replace(cart_path)]
      end
    end
  end
end
