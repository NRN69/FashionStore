# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :set_render_cart
  before_action :cart

  def set_render_cart
    @render_cart = true
  end

  def cart
    @cart ||= Cart.find_or_create_by(user: current_user)
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
