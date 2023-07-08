# frozen_string_literal: true

class BrandResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :title, as: :text, name: 'name'
  field :bytitle, as: :text
  field :description, as: :text
  field :created_at, as: :date, name: 'create date', format: "dd-LL-yyyy"
  field :updated_at, as: :date, name: 'update date', format: "dd-LL-yyyy"
end
