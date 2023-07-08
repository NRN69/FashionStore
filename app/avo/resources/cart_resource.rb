class CartResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :user_id, as: :id
  field :created_at, as: :date, name: 'create date', format: "dd-LL-yyyy"
  field :updated_at, as: :date, name: 'update date', format: "dd-LL-yyyy"
  # add fields here
end
