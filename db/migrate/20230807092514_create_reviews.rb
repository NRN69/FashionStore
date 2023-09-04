# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table   :reviews do |t|
      t.text       :body,               null: false
      t.integer    :rating, default: 0, null: false, foreign_key: true
      t.references :product,            null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
