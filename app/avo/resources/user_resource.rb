class UserResource < Avo::BaseResource
  self.title = :email
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :admin, as: :boolean
  field :email, as: :text, protocol: :mailto
  field :password, as: :password, visible: %i[new edit]
  field :locked_at, as: :text
  field :sign_in_count, as: :text, hide_on: %i[new edit]
  field :failed_attempts, as: :number, hide_on: %i[new edit]
  field :created_at, as: :date, name: 'create date', format: "dd-LL-yyyy", hide_on: %i[new edit]
  field :current_sign_in_at, as: :date, format: "dd-LL-yyyy", hide_on: %i[new edit]
  field :last_sign_in_at, as: :date, format: "dd-LL-yyyy", hide_on: %i[new edit]
  field :current_sign_in_ip, as: :text, hide_on: %i[new edit]
  field :last_sign_in_ip, as: :text, hide_on: %i[new edit]
  # # add fields here
end
