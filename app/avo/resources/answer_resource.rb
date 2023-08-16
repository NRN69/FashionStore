# frozen_string_literal: true

class AnswerResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :body, as: :textarea
  field :comment, as: :belongs_to
  field :user, as: :belongs_to
  # add fields here
end