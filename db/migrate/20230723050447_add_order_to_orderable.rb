# frozen_string_literal: true

class AddOrderToOrderable < ActiveRecord::Migration[7.0]
  def change
    add_reference :orderables, :order, null: true, foreign_key: true
  end
end
