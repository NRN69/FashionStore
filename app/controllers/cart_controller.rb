class CartController < ApplicationController
  before_action :set_page_options

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end
    respond_format
  end

  def remove
    @orderable = Orderable.find(params[:id])
    @orderable.destroy
    respond_format
  end


  private

  def set_page_options
    @page_title  = 'Cart'
  end

  def respond_format

    respond_to do |format|
      format.turbo_stream do
        if @page_title == 'Cart'
          render turbo_stream:
                   [turbo_stream.replace('cart-show',
                                         partial: 'cart/cart_show',
                                         locals: { cart: @cart }),
                    turbo_stream.replace('cart-quantity',
                                         partial: 'cart/cart_quantity'),
                    turbo_stream.replace(cart_path)]
        else
          render turbo_stream:
                   [turbo_stream.append(
                     request.headers["Turbo-Frame"],
                     helpers.javascript_tag(
                       "Turbo.visit('#{cart_url(@cart)}')",
                       data: {turbo_temporary: true}
                     )),
                    turbo_stream.replace('cart-modal',
                                          partial: 'cart/cart_modal',
                                          locals: { cart: @cart }),
                    turbo_stream.replace('cart-quantity',
                                         partial: 'cart/cart_quantity')]
        end
      end
    end
  end
end