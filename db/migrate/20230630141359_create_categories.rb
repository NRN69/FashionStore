# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table  :categories do |t|
      t.string    :title,       null: false, foreign_key: true
      t.string    :keywords,    null: false, foreign_key: true
      t.string    :description, null: false, foreign_key: true

      t.timestamps
    end
  end
end
