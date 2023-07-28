# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authorization
  before_action :set_render_cart
  before_action :cart

  def set_render_cart
    @render_cart = true
  end

  def cart
    @cart ||= Cart.find_or_create_by(user: current_user)
  end
end
