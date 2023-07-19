# frozen_string_literal: true

class MainController < ApplicationController
  before_action :set_page_options

  def index
    @brands = Brand.limit(3)
    @hits = if params[:query].present?
              Product.where('title LIKE ?', "%#{params[:query]}%")
            else
              Product.all.limit(8)
            end
  end

  private

  def set_page_options
    @page_title = ''
    @page_description = 'Woman Wears'
    @page_keywords = 'Dresses Shirts and More'
  end
end
