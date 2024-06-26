# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :render_cart, only: %i[index show]
  before_action :authenticate_user!
  before_action :set_page_options

  def index
    @orders = current_user.orders.includes(:order_items).order(created_at: :desc).page params[:page]
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
    @cart.orderables.each do |item|
      order.order_items.build(product: item.product, quantity: item.quantity, size: item.size)
    end

    respond_to do |format|
      format.html do
        if order.save && order.order_items
          current_user.cart.destroy
          redirect_to orders_path
        else
          flash_errors_messages(order)
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
    @render_cart = true
  end

  def flash_errors_messages(object)
    object.errors.messages.each_value { |msg| flash[:danger] = "#{object.class} #{msg.join(', ')}" }
  end
end
