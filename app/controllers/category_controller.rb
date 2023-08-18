# frozen_string_literal: true

class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(params[:sort]).page params[:page]
    set_page_options
  end
  attr_accessor :category

  private

  def set_page_options
    set_meta_tags category.slice(:title, :keywords, :description)
    add_breadcrumb 'Home', :root_path, title: 'Home'
  end
end
