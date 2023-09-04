# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :render_cart, only: %i[index show]
  before_action :authenticate_user!
  before_action :set_page_options

  def index
    @orders = current_user.orders.order(created_at: :desc).page params[:page]
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  # rubocop:disable Metrics/AbcSize

  def create
    order = current_user.orders.build order_params
    order.product = {}
    @cart.orderables.each do |item|
      order.product[item.product.id] = { item.size => item.quantity }
    end

    respond_to do |format|
      format.html do
        if order.save
          current_user.cart.destroy
          redirect_to orders_path
        else
          redirect_to new_order_path
        end
      end
    end
  end

  # rubocop:enable Metrics/AbcSize

  private

  def set_page_options
    @page_title = 'Orders'
  end

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone, :pay_type)
  end

  def render_cart
    @render_cart = false
  end
end
