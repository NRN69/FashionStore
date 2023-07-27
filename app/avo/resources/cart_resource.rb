# frozen_string_literal: true

class CartResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :user_id, as: :id
  field :user, as: :belongs_to, name: 'User', use_resource: UserResource, required: true
  field :orderables, as: :has_many, name: 'Orderables', use_resource: OrderableResource, required: true
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy'
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy'
  # add fields here
end
