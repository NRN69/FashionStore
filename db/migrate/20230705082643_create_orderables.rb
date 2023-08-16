# frozen_string_literal: true

class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table :orderables do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.integer :size, null: false, default: 0

      t.timestamps
    end
  end
end
