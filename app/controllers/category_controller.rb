# frozen_string_literal: true

class CategoryController < ApplicationController
  before_action :set_product!
  def show
    @category = Category.find(params[:id])
    @products = @category.products.joins(:reviews).order(params[:sort]).page params[:page]

    set_page_options
  end
  attr_accessor :category

  private

  def set_page_options
    set_meta_tags category.slice(:title, :keywords, :description)
    add_breadcrumb 'Home', :root_path, title: 'Home'
    add_breadcrumb category.parent.title, category_path(category.parent) if category.parent
    add_breadcrumb category.title
  end

  def set_product!
    @product = Product.find(params[:id])
  end
end
