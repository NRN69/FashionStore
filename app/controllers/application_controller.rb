# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :set_render_cart
  before_action :initialize_cart

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_or_create_by(user: current_user)
  end

  # def initialize_cart
  #   @cart ||= Cart.find_or_create_by(user: current_user)
  # end
  #
  # def orderables
  #   initialize_cart.orderables
  # end
  #
  # helper_method :initialize_cart, :orderables
end
