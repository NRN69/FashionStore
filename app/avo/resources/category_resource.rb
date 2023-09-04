# frozen_string_literal: true

class CategoryResource < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :title, as: :text, name: 'name'
  field :description, as: :text
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :update_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  # add fields here
end
