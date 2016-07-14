class AddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :myCart_id, :integer
  end
end
