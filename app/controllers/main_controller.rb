# frozen_string_literal: true

class MainController < ApplicationController
  before_action :set_page_options

  def index
    @products = if params[:query].present?
                  Product.includes(%i[images_attachments reviews]).where('title LIKE ?', "%#{params[:query]}%")
                else
                  Product.includes(%i[images_attachments reviews]).limit(8)
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
