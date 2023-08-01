# frozen_string_literal: true

class AddAncestryToCategories < ActiveRecord::Migration[7.0]
  def change
    change_table(:categories) do |t|
      t.string 'ancestry', collation: 'C'
      t.index 'ancestry'
    end
  end
end
