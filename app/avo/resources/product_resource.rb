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
  field :category, as: :belongs_to, name: 'Category', use_resource: CategoryResource, required: true
  field :brand, as: :text, required: true
  field :price, as: :number, required: true
  field :color, as: :text, required: true
  field :material, as: :text, required: true
  field :images, as: :files, direct_upload: true
  field :description, as: :textarea, required: true
  field :content, as: :textarea
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  tabs do
    tab 'Size' do
      field :sizes, as: :has_many
    end
    tab 'Reviews' do
      field :reviews, as: :has_many
    end
  end

  grid do
    cover :image, as: :external_image, link_to_resource: true do |model|
      model.images.first.url
    end
    title :title, as: :text, required: true, link_to_resource: true
    body :description, as: :text
  end
end
