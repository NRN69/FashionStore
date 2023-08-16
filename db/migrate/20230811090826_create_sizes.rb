# frozen_string_literal: true

class CreateSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :sizes do |t|
      t.integer :size
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
