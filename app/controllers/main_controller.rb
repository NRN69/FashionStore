# frozen_string_literal: true

class MainController < ApplicationController
  before_action :set_page_options

  def index
    @brands   = Brand.limit(3)
    @products = if params[:query].present?
                  Product.where('title LIKE ?', "%#{params[:query]}%")
                else
                  Product.order(params[:sort]).limit(8)
                end

    return unless current_user

    current_user.notifications.mark_as_read!
    @notifications = current_user.notifications.reverse
  end

  private

  def set_page_options
    @page_title = ''
    @page_description = 'Woman Wears'
    @page_keywords = 'Dresses Shirts and More'
  end
end
