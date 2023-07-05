# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :brand_id
      t.string :title
      t.string :bytitle
      t.text :content
      t.float :price
      t.string :color
      t.integer :status
      t.string :keywords
      t.string :description
      t.string :img, default: 'no_image.jpg'
      t.integer :hit, default: 0
      t.timestamps
    end
  end
end
