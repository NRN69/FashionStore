# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.text :phone
      t.integer :pay_type
      t.json :product_id_and_quantity
      t.integer :status

      t.timestamps
    end
  end
end
