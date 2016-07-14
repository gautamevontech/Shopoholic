class AddColumnProductQuantityToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :product_quantity, :integer
  end
end
