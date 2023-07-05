# frozen_string_literal: true

class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :title
      t.string :bytitle
      t.string :img
      t.string :description
      t.timestamps
    end
  end
end
