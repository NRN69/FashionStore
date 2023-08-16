# frozen_string_literal: true

class NotificationResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :recipient, as: :text
  field :type, as: :text
  field :params, as: :text
  field :read_at, as: :date_time
  # add fields here
end
