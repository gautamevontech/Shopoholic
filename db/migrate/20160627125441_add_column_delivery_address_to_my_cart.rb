class AddColumnDeliveryAddressToMyCart < ActiveRecord::Migration
  def change
    add_column :my_carts, :delivery_address, :integer
  end
end
