# frozen_string_literal: true

class OrderResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :email, as: :text
  field :address, as: :textarea
  field :product_ids, as: :text, name: 'product id\'s' do |order|
    order.product.keys.to_s.gsub('"', '').gsub('[', '').gsub(']', '')
  end
  field :size_and_quantity, as: :text, name: 'size and quantity' do |order|
    order.product.values.to_s.gsub('"', '').gsub('[', '').gsub(']', '').gsub('{', '').gsub('}', '')
  end
  field :created_at, as: :date, name: 'create date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
  field :updated_at, as: :date, name: 'update date', format: 'dd-LL-yyyy', hide_on: %i[new edit]
end
