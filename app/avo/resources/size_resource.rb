# frozen_string_literal: true

class SizeResource < Avo::BaseResource
  self.title = :size
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :size, as: :text
  field :product, as: :belongs_to
  # add fields here
end
