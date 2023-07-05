class OrderableResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :product, as: :text
  field :cart, as: :text
  field :quantity, as: :number
  # add fields here
end
