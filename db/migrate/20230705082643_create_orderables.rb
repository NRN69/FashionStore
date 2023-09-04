# frozen_string_literal: true

class CreateOrderables < ActiveRecord::Migration[7.0]
  def change
    create_table   :orderables do |t|
      t.belongs_to :product,              null: false, foreign_key: true
      t.belongs_to :cart,                 null: false, foreign_key: true
      t.integer    :quantity, default: 1, null: false
      t.string     :size,                 null: false

      t.timestamps
    end
  end
end
