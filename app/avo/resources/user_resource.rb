# frozen_string_literal: true

class UserResource < Avo::BaseResource
  # self.default_view_type = :grid
  self.title = :email
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :admin, as: :boolean
  field :name, as: :text
  field :phone, as: :text
  field :address, as: :text
  field :email, as: :text, protocol: :mailto
  field :avatar, as: :file, direct_upload: true
  field :password, as: :password, visible: %i[new edit]
  field :locked_at, as: :text
  field :sign_in_count, as: :text, hide_on: %i[new edit]
  field :failed_attempts, as: :number, hide_on: %i[new edit]
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :current_sign_in_at, as: :date, format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :last_sign_in_at, as: :date, format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :current_sign_in_ip, as: :text, hide_on: %i[new edit]
  field :last_sign_in_ip, as: :text, hide_on: %i[new edit]
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]

  # grid do
  #   cover :avatar, as: :file, link_to_resource: true
  #   title :name, as: :text, required: true, link_to_resource: true
  #   body :email, as: :text
  # end
  # # add fields here
end
