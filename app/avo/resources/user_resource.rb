class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :user_id, as: :id
  field :admin, as: :boolean
  field :email, as: :text
  field :locked_at, as: :text
  field :sign_in_count, as: :text
  field :failed_attempts, as: :number
  field :created_at, as: :date, name: 'create date', format: "dd-LL-yyyy"
  field :current_sign_in_at, as: :date, format: "dd-LL-yyyy"
  field :last_sign_in_at, as: :date, format: "dd-LL-yyyy"
  field :current_sign_in_ip, as: :text
  field :last_sign_in_ip, as: :text
  # # add fields here
end
