# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table  :products do |t|
      t.integer   :category_id,         null: false, foreign_key: true
      t.integer   :user_id,             null: false, foreign_key: true
      t.string    :brand,               null: false, foreign_key: true
      t.string    :title,               null: false, foreign_key: true
      t.text      :content
      t.float     :price,               null: false, foreign_key: true
      t.string    :color,               null: false, foreign_key: true
      t.string    :material,            null: false, foreign_key: true
      t.string    :keywords,            null: false, foreign_key: true
      t.string    :description
      t.timestamps
    end
  end
end
