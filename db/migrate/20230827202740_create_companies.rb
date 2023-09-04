# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table  :companies do |t|
      t.string    :title
      t.string    :address
      t.string    :phone
      t.string    :opening_hours
      t.string    :opening_days

      t.timestamps
    end
  end
end
