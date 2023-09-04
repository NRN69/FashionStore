# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table  :orders do |t|
      t.string    :name,                  null: false
      t.string    :email,                 null: false
      t.text      :address,               null: false
      t.text      :phone,                 null: false
      t.integer   :pay_type,              null: false
      t.json      :product,               null: false
      t.integer   :status, default: 0,    null: false

      t.timestamps
    end
  end
end
