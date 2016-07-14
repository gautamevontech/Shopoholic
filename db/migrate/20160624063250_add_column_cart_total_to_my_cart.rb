class AddColumnCartTotalToMyCart < ActiveRecord::Migration
  def change
    add_column :my_carts, :cart_total, :integer
  end
end
