# frozen_string_literal: true

class NotificationResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :review_creator, as: :text do |message|
    User.find_by(id: message.recipient_id).email
  end
  field :answer, as: :text do |message|
    message.params.values[0].body
  end
  field :answer_author, as: :text do |message|
    User.find_by(id: message.params.values[0].user_id).name
  end

  field :review, as: :text do |message|
    review.find_by(id: message.params.values[0].review_id).body
  end
  field :user, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit] do |message|
    message.params.values[0].created_at
  end
  # field :read_at, as: :date_time
  # # add fields here
end
