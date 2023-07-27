class AddColumsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :cart_id,:integer
  end
end
