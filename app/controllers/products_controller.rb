# frozen_string_literal: true

class ProductsController < ApplicationController
  after_action :register_visit, only: [:show]

  def show
    @product = Product.find(params[:id])
    set_page_options
  end

  helper_method :recent_products
  attr_accessor :product

  def recent_products
    [] if recently.none?
    Product.where(id: recently)
  end

  private

  def recently
    session[:viewed_products] ||= []
  end

  def register_visit
    session[:viewed_products] ||= []
    session[:viewed_products] = ([product.id] + session[:viewed_products]).uniq.take(4)
  end

  # rubocop:disable Metrics/AbcSize
  def set_page_options
    set_meta_tags product.slice(:title, :keywords, :description)
    add_breadcrumb 'Home', :root_path, title: 'Home'
    add_breadcrumb product.category.title.capitalize, category_path(product.category)
    add_breadcrumb product.brand.capitalize
    add_breadcrumb product.title.capitalize
  end
  # rubocop:enable Metrics/AbcSize
end
