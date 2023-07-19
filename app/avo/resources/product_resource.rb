# frozen_string_literal: true

class ProductResource < Avo::BaseResource
  self.default_view_type = :grid
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  #

  field :title, as: :text, name: 'name', required: true
  field :bytitle, as: :text
  field :description, as: :text, required: true
  field :price, as: :number, required: true
  field :color, as: :text, required: true
  field :img, as: :external_image, name: 'image', required: true
  field :content, as: :text
  field :status, as: :number
  field :hit, as: :number, required: true
  field :category, as: :belongs_to, name: 'Category', use_resource: CategoryResource, required: true
  field :brand, as: :belongs_to, name: 'Brand', use_resource: BrandResource, required: true
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]

  grid do
    cover :img, as: :external_image, link_to_resource: true
    title :title, as: :text, required: true, link_to_resource: true
    body :description, as: :text
  end
end