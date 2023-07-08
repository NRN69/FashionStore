# frozen_string_literal: true

class ProductResource < Avo::BaseResource
  self.default_view_type = :grid
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
  #

  field :id, as: :id
  field :title, as: :text, name: 'name'
  field :bytitle, as: :text
  field :description, as: :text
  field :price, as: :number
  field :color, as: :text
  field :img, as: :external_image, name: 'image'
  field :content, as: :text
  field :status, as: :number
  field :hit, as: :number
  field :category_id, as: :id
  field :brand_id, as: :id
  field :created_at, as: :date, name: 'create date', format: "dd-LL-yyyy"
  field :updated_at, as: :date, name: 'update date', format: "dd-LL-yyyy"

  grid do
    cover :img, as: :external_image, link_to_resource: true
    title :title, as: :text, required: true, link_to_resource: true
    body :description, as: :text
  end
end