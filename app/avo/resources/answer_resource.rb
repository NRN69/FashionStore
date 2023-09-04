# frozen_string_literal: true

class AnswerResource < Avo::BaseResource
  self.title = :body
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :body, as: :text, name: 'answer'
  field :review, as: :belongs_to
  field :user, as: :belongs_to, name: 'answer author'
  field :review_author, as: :text do |answer|
    answer.review.user.email
  end
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
end
