# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean  :admin
      t.string   :name, null: false, foreign_key: true
      t.string   :phone
      t.string   :address
      t.string   :uid
      t.string   :provider
      t.string   :avatar_url
      t.timestamps
    end
  end
end
