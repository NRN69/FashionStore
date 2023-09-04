# frozen_string_literal: true

class ReviewResource < Avo::BaseResource
  self.title = :body
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :body, as: :text, name: 'review'
  field :product, as: :belongs_to
  field :raiting, as: :text
  field :user, as: :belongs_to
  field :answers, as: :has_many
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
end
