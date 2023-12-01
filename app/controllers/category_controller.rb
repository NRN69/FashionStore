# frozen_string_literal: true

class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.includes(%i[images_attachments reviews]).order(params[:sort]).page params[:page]

    return redirect_to @category, status: :moved_permanently if request.path != category_path(@category)

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
end
