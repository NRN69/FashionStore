# frozen_string_literal: true

class AddUserRefToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :user, index: true, foreign_key: true
  end
end
